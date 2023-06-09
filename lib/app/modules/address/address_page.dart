import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/mixins/location_mixin.dart';
import '../../core/ui/extensions/theme_extension.dart';
import '../../entities/address_entity.dart';
import '../../models/place_model.dart';
import 'address_controller.dart';
import 'widgets/address_search_widget/address_search_controller.dart';

part 'widgets/address_item_widget.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends PageLifeCycleState<AddressController, AddressPage> with LocationMixin {
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final reactionService = reaction<bool>(
      (_) => controller.locationServiceUnavailable,
      (locationServiceUnavailable) {
        if (locationServiceUnavailable) {
          showDialogLocationServiceUnavailable();
        }
      },
    );

    final reactionLocationPerm = reaction<LocationPermission?>(
      (_) => controller.locationPermission,
      (locationPermission) {
        if (locationPermission != null && locationPermission == LocationPermission.denied) {
          showDialogLocationDenied(tryAgain: () => controller.getMyLocation());
        } else if (locationPermission != null && locationPermission == LocationPermission.deniedForever) {
          showDialogLocationDeniedForever();
        }
      },
    );

    reactionDisposer.addAll([reactionService, reactionLocationPerm]);
  }

  @override
  void dispose() {
    for (var reaction in reactionDisposer) {
      reaction();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.addressWasSelected(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: context.primaryColorDark),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                Text(
                  'Adicione ou escolha um endereço',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return _AddressSearchWidget(
                      key: UniqueKey(),
                      addressSelectedCallback: (place) {
                        controller.goToAddressDetail(place);
                      },
                      place: controller.placeModel,
                    );
                  },
                ),
                const SizedBox(height: 30),
                ListTile(
                  onTap: () => controller.getMyLocation(),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Localização atual',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      children: controller.addresses
                          .map(
                            (a) => _AddressItemWidget(
                              entity: a,
                              onTap: () {
                                controller.selectAddress(a);
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
