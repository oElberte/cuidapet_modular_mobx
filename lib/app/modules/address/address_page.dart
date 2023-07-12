import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
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

class _AddressPageState extends PageLifeCycleState<AddressController, AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _AddressSearchWidget(
                addressSelectedCallback: (place) {
                  Modular.to.pushNamed('/address/details/', arguments: place);
                },
              ),
              const SizedBox(height: 30),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Localização atual',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return Column(
                    children: controller.addresses
                        .map(
                          (e) => _AddressItemWidget(entity: e),
                        )
                        .toList(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
