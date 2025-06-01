class Items {
  final String item;
  bool isCompleted;
  Items({required this.item, this.isCompleted = false});
  void toggle() => isCompleted = !isCompleted;
}
