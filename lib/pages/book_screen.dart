import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_manager/pages/drawer_widget.dart';

import '../models/book.dart';
import 'add_book_screen.dart';
import 'book_details_screen.dart';
import 'edit_book_screen.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final List<Book> books = [
    Book(
        title: 'Book One',
        author: 'Author One',
        imagePath: 'https://m.media-amazon.com/images/I/71RVt35ZAbL._AC_UF1000,1000_QL80_.jpg',
        description: "simple description"),
    Book(
        title: 'Book Two',
        author: 'Author Two',
        imagePath: 'https://m.media-amazon.com/images/I/71RVt35ZAbL._AC_UF1000,1000_QL80_.jpg',
        description: "simple desctiption"),
  ];
  void _addBook(Book book) {
    setState(() {
      books.add(book);
    });
  }
  List<Book> _searchBooks(String query) {
    List<Book> searchResult = [];
    for (Book book in books) {
      if (book.title.toLowerCase().contains(query.toLowerCase())) {
        searchResult.add(book);
      }
    }
    return searchResult;
  }

  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }
  void _editBook(int index, Book book) {
    setState(() {
      books[index] = book;
    });
  }
  final TextEditingController _searchController = TextEditingController();
  List<Book> _searchResult = [];
  void _searchBookss( query) {
    setState(() {
      if(query.isEmpty)
        _searchResult = books;
      else
        _searchResult = _searchBooks(query);
    });
  }
  @override
  void setState(VoidCallback fn) {
    _searchResult=books;
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar:  AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Rechercher un livre',
            border: InputBorder.none,
          ),
          onChanged: _searchBookss,
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResult.length,
        itemBuilder: (context, index) {
          final book = books[index];
           final image = Image.network(
              book.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            );
          return Card(
            child: ListTile(
              leading: image,
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailScreen(book: book),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBookScreen(
                            book: book,
                            editBookCallback: _editBook, index: index,
                          ),
                        ),
                      );
                    },
                  ),
                    IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: () {
                        _deleteBook(index);
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(addBookCallback: _addBook),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
