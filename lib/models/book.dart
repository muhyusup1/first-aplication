class BookList {
  String imageUrl;
  String writers;
  String title;

  BookList(
      {required this.imageUrl, required this.writers, required this.title});
}

List<BookList> bookList = [
  BookList(
      imageUrl: "assets/images/img1.jpg",
      writers: "Guy Kawasaki",
      title: "Enchantment"),
  BookList(
      imageUrl: "assets/images/img2.jpg",
      writers: "Guy Kawasaki",
      title: "Enchantment"),
  BookList(
      imageUrl: "assets/images/img3.jpg",
      writers: "Guy Kawasaki",
      title: "Enchantment"),
];
