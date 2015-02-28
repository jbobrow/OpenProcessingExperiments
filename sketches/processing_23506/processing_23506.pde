

//Red, Green, Blue//

//Sketch uses keyboard interaction, external library(Fonts),"if" statements//


PFont arial;  //stores Font "arial"

int r =255; // integer varible for red colour
int g =255; // integer varible for green colour
int b =255;// integer varible for blue colour


void setup() {
  size(500,500); //size of sketch
  arial = createFont("arial bold",24); // font name (looks in font library) and then builds bitmaps based on size 24
}

void draw() {

  background(r,g,b); //background color dependent on r, g, b varibles
  fill(0, 0, 0, 100); // fill colour of the text
  textFont(arial,24); // use this font and size
  text("PRESS one of the Letters ", 120, 60); // Everything in the quote is put in the sketch , 120 = xposition, 60=yposition

  text("on your keyboard", 160, 90);// Everything in the quote is put in the sketch , 160 = xposition, 90=yposition

  text(" R = RED ", 160, 150);// Everything in the quote is put in the sketch , 160 = xposition, 150=yposition

  text(" B = BLUE ", 160, 350);// Everything in the quote is put in the sketch , 160 = xposition, 350=yposition

  text(" G = GREEN ", 160, 250);// Everything in the quote is put in the sketch , 160 = xposition, 250=yposition
}

void keyPressed() {

  if (key == 'b') {  //if key 'b'is pressed overide g,r,b values to 0,0,255 respectively to create blue colour background
    g=0;
    r=0;
    b=255;
  }
  if (key == 'r') {//if key 'g'is pressed overide g,b,r values to 0,0,255 respectively to create red colour background
    g=0;
    b=0;
    r=255;
  }
  if (key == 'g') {//if key 'g'is pressed overide b,r,g values to 0,0,255 respectively to create green colour background
    b=0;
    r=0;
    g=255;
  }
}


