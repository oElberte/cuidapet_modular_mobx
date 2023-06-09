// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_addressEntityAtom =
      Atom(name: 'HomeControllerBase._addressEntity', context: context);

  AddressEntity? get addressEntity {
    _$_addressEntityAtom.reportRead();
    return super._addressEntity;
  }

  @override
  AddressEntity? get _addressEntity => addressEntity;

  @override
  set _addressEntity(AddressEntity? value) {
    _$_addressEntityAtom.reportWrite(value, super._addressEntity, () {
      super._addressEntity = value;
    });
  }

  late final _$_categoriesAtom =
      Atom(name: 'HomeControllerBase._categories', context: context);

  List<SupplierCategoryModel> get categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  List<SupplierCategoryModel> get _categories => categories;

  @override
  set _categories(List<SupplierCategoryModel> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$_supplierPageTypeSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierPageTypeSelected', context: context);

  SupplierPageType get supplierPageTypeSelected {
    _$_supplierPageTypeSelectedAtom.reportRead();
    return super._supplierPageTypeSelected;
  }

  @override
  SupplierPageType get _supplierPageTypeSelected => supplierPageTypeSelected;

  @override
  set _supplierPageTypeSelected(SupplierPageType value) {
    _$_supplierPageTypeSelectedAtom
        .reportWrite(value, super._supplierPageTypeSelected, () {
      super._supplierPageTypeSelected = value;
    });
  }

  late final _$_getAddressSelectedAsyncAction =
      AsyncAction('HomeControllerBase._getAddressSelected', context: context);

  @override
  Future<void> _getAddressSelected() {
    return _$_getAddressSelectedAsyncAction
        .run(() => super._getAddressSelected());
  }

  late final _$goToAddressPageAsyncAction =
      AsyncAction('HomeControllerBase.goToAddressPage', context: context);

  @override
  Future<void> goToAddressPage() {
    return _$goToAddressPageAsyncAction.run(() => super.goToAddressPage());
  }

  late final _$_getCategoriesAsyncAction =
      AsyncAction('HomeControllerBase._getCategories', context: context);

  @override
  Future<void> _getCategories() {
    return _$_getCategoriesAsyncAction.run(() => super._getCategories());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void changePageType(SupplierPageType supplierPageType) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changePageType');
    try {
      return super.changePageType(supplierPageType);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
