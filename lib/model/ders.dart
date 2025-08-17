class Ders {
  final String dersAdi;
  final double kredi;
  final double harfNotu;

  Ders({
    required this.dersAdi,
    required this.kredi,
    required this.harfNotu,
  });

  @override
  String toString() {
    return 'Ders{dersAdi: $dersAdi, kredi: $kredi, harfNotu: $harfNotu}';
  }
}