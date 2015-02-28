
PImage theGuy;
PFont Tfont;
PFont myfont;
float x, y; // X and Y of the guy
float gx, gy; //horizontal and vertical radius 

void setup() {
  size(500, 400);
  Tfont = loadFont("Comfortaa-Bold-24.vlw");
  myfont = loadFont("AmericanTypewriter-24.vlw");
  
  theGuy = loadImage ("guy01.jpg"); 

  x =100;
  y =100;

}

void draw() {

  fill(255);
  rect(0, 0, width, height);
  image(theGuy, x, y);

  
  fill(0);
  textFont(Tfont,32);
  text("HAPPY WORLD", 10, 30);
  textFont(myfont,24);
  text("press any key from 1 to 9", 10, 60);
  
  mouseOnHim();
  chooseGuy();
  
  gx = theGuy.width;
  gy = theGuy.height;
}

void mouseOnHim() {
  if (mouseX > x && mouseX < x+gx && 
    mouseY >x && mouseY < y+gy) {
    x +=random(-5, 5);
    y +=random(-5, 5);
    println("mouseOn");
    mouseOnTitle();
  }
}

void mouseOnTitle() {
  fill(0);
  text("s: subtitle", 300, 400);
  if ( key == 's' || key == 'S' ) {
    subTitle();
  }
}

void chooseGuy() {
  if (keyPressed) {
    if (key == '1') {
      theGuy = loadImage ("guy01.jpg");
    }
    else if (key == '2') {
      theGuy = loadImage ("guy02.jpg");
    }
    else if (key == '3') {
      theGuy = loadImage ("guy03.jpg");
    }
    else if (key == '4') {
      theGuy = loadImage ("guy04.jpg");
    }
    else if (key == '5') {
      theGuy = loadImage ("guy05.jpg");
    }
    else if (key == '6') {
      theGuy = loadImage ("guy06.jpg");
    }
    else if (key == '7') {
      theGuy = loadImage ("guy07.jpg");
    }
     else if (key == '8') {
      theGuy = loadImage ("guy08.jpg");
    }
     else if (key == '9') {
      theGuy = loadImage ("guy09.jpg");
    }
    
  }
}

void subTitle() {
  for (int i=0; i<15; i++) {
    fill(0);
    text("HAHA", i*35, 100);
    text("!", i*35, 150 );
  }
}


