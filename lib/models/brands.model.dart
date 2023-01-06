class Brands {
  late String image;
  late String brand;
  Brands({required this.brand, required this.image});
}

List<Brands> brands = [
  Brands(
      brand: 'JBL',
      image:
          'https://firebasestorage.googleapis.com/v0/b/headphone-19c0c.appspot.com/o/logo%2FJBL-logo%20(1).png?alt=media&token=95aa0788-262d-4dac-a20c-14171d415dd8'),
  Brands(
      brand: 'EPOS',
      image:
          'https://firebasestorage.googleapis.com/v0/b/headphone-19c0c.appspot.com/o/logo%2Fepos.jpg?alt=media&token=8b4f94a7-7ffb-4494-953b-c5433f571bf0'),
  Brands(
      brand: 'FOCAL',
      image:
          'https://firebasestorage.googleapis.com/v0/b/headphone-19c0c.appspot.com/o/logo%2Ffocal-listen-beyond-vector-logo.png?alt=media&token=2ccc7363-5ac0-4108-9904-5cbc1387fac0'),
];
