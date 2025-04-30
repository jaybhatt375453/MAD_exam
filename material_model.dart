class MaterialItem {
  final String id;
  final String name;
  final double unitCost;
  final int stock;

  MaterialItem({required this.id, required this.name, required this.unitCost, required this.stock});

  factory MaterialItem.fromMap(Map<String, dynamic> data, String id) {
    return MaterialItem(
      id: id,
      name: data['name'],
      unitCost: (data['unitCost'] as num).toDouble(),
      stock: data['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'unitCost': unitCost,
      'stock': stock,
    };
  }
}