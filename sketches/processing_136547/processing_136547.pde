
int myState = 0;
int counter = 0;
float x = 0;
float y = 0;
float x1 = 1;
float x2 = 2;
float y1 = 3;
float y2 = 4;
PFont fonty ;
PImage books;
PImage guy;
PImage bookguy;
PImage flo;
PImage cali;
PImage tex;


void setup () {
  background(0);
  size ( 850, 400);
  fonty = createFont("BanglaMN.vlw",200);
  
  books = loadImage("book.png");
   guy = loadImage("smart.png");
   bookguy = loadImage("booksguy.png");
   flo = loadImage("florida.png");
   cali = loadImage("california.png");
    tex = loadImage("texas.png");
    frameRate(60);
}

void draw () {
  
 


switch(myState) {
  
  case 0:
 background(0);
  textFont(fonty, 50);
  text("Click to advance.", 50, 100);
  
  break;
  
  case 1:
  background(0);
   image(books, 400, 200);
    textFont(fonty, 50);
  text("The more that you read...", 50, 50);
  

      

  
  break;
  
  case 2:
  background(0);
  image(bookguy, 300, 80);
   textFont(fonty, 50);
  text("The more things you will know.", 50, 50);
  
  break;
  
  case 3:
  
  background(0);
  image(guy, 300, 200);
   textFont(fonty, 50);
  text("The more that you learn...", 50, 50);
  
  break;
  
  
  case 4:
     x = random(850);
     y = random(400);
      x1 = random(850);
     y1 = random(400);
      x2 = random(850);
     y2 = random(400);
  counter = counter + 1;
  if (counter > 60) {
  image(flo, x, y);
   image(cali, x1, y1, 100, 130);
  image(tex, x2, y2, 100, 100);
  counter = 0;
  }
  
  fill(255);
   textFont(fonty, 50);
  text("the more places you'll go!", 50, 150);
  
  break;
  


}
}

void mousePressed() {
  
    myState = (myState + 1) ;
  if (myState > 4) {
    myState = 0;
  }
  
}
  




