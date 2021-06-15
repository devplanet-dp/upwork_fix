
class Book {
  String name;
  String cover;
  String url;
  String author;

  Book({required this.name,required this.cover,required this.url,required this.author});

  // Book.fromJson(Map<String, dynamic> data, String id) {
  //   this.name = id ?? '';
  //   this.cover = data['cover'] ?? '';
  //   this.url = data['url'] ?? '';
  //   this.author = data['author'] ?? '';
  // }

  // extract all book objects from a Map object
  /*List<Book> mapBook(QuerySnapshot books) {
    List<Book> booksList = [];
    books.docs.forEach((book) {
      Book _book = Book(
        name: book.id,
        cover: book[Metadata.kBookCover],
        url: book[Metadata.kBookUrl],
        author: book[Metadata.kBookAuthor],
      );
      booksList.add(_book);
    });
    return booksList;
  }*/

  @override
  String toString() {
    return 'Book{name: $name, cover: $cover, url: $url, author: $author}';
  }
}
