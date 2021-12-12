List getUniqueOnCreated({required List clone, required List newL}) {
  if (clone.isNotEmpty) {
    // remove any which matches creation date
    clone.removeWhere((element) => newL.any((el) => element.registered == el.registered));
    clone.addAll(newL);
    return clone;
  }

  return newL;
}
