
PImage book;
PImage book_open;

void setup()
{
  size(800,600);
  book= loadImage("book_closed3.png");
  book_open = loadImage("book_open.png");
}

void draw()
{
  println(mouseY);
  background(0);
  image (book, 300,50);
  
  if (mouseX>=410 && mouseX<=740 && mouseY>=115 && mouseY<=490)
  { 
    
    tint(255,182,72);
    image(book, 300, 50);
  }
  else
  {
    noTint();
    image(book, 300, 50);
  }
  
    if(mousePressed== true)
    { 
      background(0);
      noTint();
      image(book_open, 50,50);
    }
  
}




