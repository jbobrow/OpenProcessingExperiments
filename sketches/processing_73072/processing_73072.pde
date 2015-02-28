
/*
Assignment 3
Name: Jenny Mott
E-mail: jmott@brynmawr.edu
Course: CS 110-01
Submitted: 10/2/2012

so, i'm hoping that this will be books and candles -
very practical things to have near each other.
With any luck, i'll be able to make the candle burn blue when
you put the mouse over it, and the book disappear when you click it 
because the book doesn't want you to read it - that's why.

*/
//so this is what the book should look like
class Book {
  //Fields
 float x, y, v, n;
 float r, g, b;
  //Constructor
  Book (float xT, float yT, float vT, float nT) {
   x = xT;
   y = yT;
   v = vT;
   n = nT;
   r = random(255);
   g = random(225);
   b = random(225);
  }
  
  
  //Methods
  void drawBook(){
    fill(r,g,b);
    rectMode(CENTER);
    rect(x,y,v,n);
  }
  
  void changeColor () {
    fill(82,45,19);
    rectMode(CENTER);
    rect(x,y,v,n);
  }
  
}
//this is how the candles should be done
class Candle {
  //Feilds
  float d, w, h, l, m;
  float f;
  //Constructor
  Candle (float dT, float wT, float hT, float lT) {
   d = dT;
   w = wT;
   h = hT;
   l = lT;
   m = random (215,300);
   f = random (8,230);
  }
  //Methods
  void drawCandle () {
    fill(142,123,19);
    ellipse(d,335,w,h);
    fill(252,248,222);
    rectMode(CORNERS);
    rect(l,m,d,335); 
    fill(250,f,8);
    ellipse(l+5,m,10,15);
  }
  void changeFlame () {
    fill(31,219,255);
    ellipse(l+5,m,10,15);
  }
}

  float C1d = random (30,460);
  float C1w = random (25,150);
  float C1h = C1w/3;
  float C1l = C1d-10;
  float C2d = random (30,460);
  float C2w = random (25,150);
  float C2h = C2w/3;
  float C2l = C2d-10;
  float C3d = random (30,460);
  float C3w = random (25,150);
  float C3h = C3w/3;
  float C3l = C3d-10;
 
 float m = random (215,300);
 
  float B1x = random (50,450);
  float B1y = 100;
  float B1v = random(10,75);
  float B1n = 140;
  float B2x = random (50,450);
  float B2y = 100;
  float B2v = random(10,75);
  float B2n = 140;
  float B3x = random (50,450);
  float B3y = 100;
  float B3v = random(10,75);
  float B3n = 140;
  
Book Book1;
Book Book2;
Book Book3;

Candle Candle1;
Candle Candle2;
Candle Candle3;

//so let's draw some shelves.
void setup() {
  size(500,500);
  background(82,45,19);
  fill(129,74,38);
  rectMode(CENTER);
  rect(250,175,500,15);
  rect(250,350,500,15);

  Book1 = new Book (B1x, B1y, B1v, B1n);
  Book1.drawBook();
  Book2 = new Book (B2x, B2y, B2v, B2n);
  Book2.drawBook();
  Book3 = new Book (B3x, B3y, B3v, B3n);
  Book3.drawBook();
  Candle1 = new Candle (C1d, C1w, C1h, C1l);
  Candle1.drawCandle ();
  Candle2 = new Candle (C2d, C2w, C2h, C2l);
  Candle2.drawCandle ();
  Candle3 = new Candle (C3d, C3w, C3h, C3l);
  Candle3.drawCandle ();
  
}
//these are pretty stubborn candles - you've got to stick with it.  
void draw() {
if (mouseX>=C1l-20 && mouseX<=C1l+15 && mouseY>=m-15 && mouseY<=m+15) {
  Candle1.changeFlame ();
  }
if (mouseX>=C2l-20 && mouseX<=C2l+15 && mouseY>=m-15 && mouseY<=m+15) {
  Candle2.changeFlame ();
  }
if (mouseX>=C3l-20 && mouseX<=C3l+15 && mouseY>=m-15 && mouseY<=m+15) {
  Candle3.changeFlame ();
  }
}
//keep trying - it takes a few clicks around.
void mousePressed() {
  if (mouseX>B1x && mouseX<B1x+B1v && mouseY>B1y && mouseY<B1y+B1n) {
  Book1.changeColor();
  }
  if (mouseX>B2x && mouseX<B2x+B2v && mouseY>B2y && mouseY<B2y+B2n) {
  Book2.changeColor();
  }
  if (mouseX>B3x && mouseX<B3x+B3v && mouseY>B3y && mouseY<B3y+B3n) {
  Book3.changeColor();
  }  
}
