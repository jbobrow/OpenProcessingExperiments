
PImage book, student;

void setup() {
  size(600, 600);
  book = loadImage("http://www.graphicsfuel.com/wp-content/uploads/2010/10/green-book-preview.png");
  student = loadImage("http://manningtaxlaw.com/lawoffice/wp-content/uploads/sites/9/2013/10/student-1-400x.png");
}

void draw() {
  background(0);

  float mx=mouseX/2.5;
  float b = 0;

  if (mouseX>530) b = 255;
  tint(255-b, 255-mx-b, 255-mx-b);
  image(student, 450, 150, 150, 300);
  noTint();
  image(book, mouseX-50, mouseY-50, 100, 100);
}

