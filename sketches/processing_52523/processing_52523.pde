
class Book {
  
  // instance variables
  String title;
  String author;
  int yearPublished;
  float x;
  float y;

  // constructor
  Book(String title_, String author_, int yearPublished_, float x_, float y_) {
    title = title_;
    author = author_;
    yearPublished = yearPublished_;
    x = x_;
    y = y_;
  }

void display() {
  fill(255);
  textFont(f,15);
  String txt= title + " " + author + " " + yearPublished;
  text(txt,x,y-5);
 }
}



