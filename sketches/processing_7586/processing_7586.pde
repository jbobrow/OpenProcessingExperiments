
/* This program was completed by (Jessie Wilkie jwilkie@ucsc.edu).

I did not spend any time working on this assignment with another student other
than the TA or one of the class tutors.

My assigned partner for program 4 and I were unable to coordinate our schedules
to find time to work together. */

String[] headlines = {
  "Will you be my valentine?"}; //headline
PFont f; //global font variable
float x; //Vertical location
int index =0;

PImage cute; // a variable for the image file
float j,k; //variables for image location
float rot; // variable for image rotation

float r = 255; //background and fill
float g = 219;
float b = 219;
float o = 150;

float c1 = 150;
float c2 = 255;
//float c3 = 190;

float c1dir = 0.5;
float c2dir = -0.5;
//float c3dir = .5;

void setup() {
  background (255);
  size (500,500);
  //load image, initialize variables
  cute = loadImage ("cupid.gif");
  j=width/2;
  k=height/2;
  rot=0;
  frameRate (25);
  f = createFont ("CurlzMT-35",35,true);
  //Initialize headline offscreen
  x = width;
}

//define draw heart
void drawHeart (float bv) {

  smooth();
  noStroke();
  //fill(255,0,0);
  beginShape();
  vertex(bv*10, bv*3);
  bezierVertex(bv*10, -bv, bv*18, bv, bv*10, bv*8);
  vertex(bv*10, bv*3);
  bezierVertex(bv*10,-bv, bv*2, bv, bv*10, bv*8);
  endShape(); 

}

void draw() {
  background (255);
  //black background flash!
  if (mouseX < width/2) {
    background (255);
  } 
  else {
    background (0);
  }

  //changing red triangles
  fill (c1, 0,0,c2);
  triangle (0,0,width/2,height/2,width,0);
  fill (c2,0,0,c1);
  triangle (0,height,width/2, height/2,width,height);

  c1 = c1 + c1dir;
  c2 = c2 + c2dir;
  //  c3 = c3 + c3dir;

  if (c1 < 150 || c1 > 255) {
    c1dir *= 1;
  }

  if (c2< 150 || c2 > 255) {
    c2dir *= -1;
  }

  // click first heart and print this text
  if (mousePressed && mouseX<55 && mouseX >10 && mouseY >5 && mouseY <55){
    fill (255);
    PFont font;
    font = loadFont("CurlzMT-35.vlw"); 
    textFont(font, 20); 
    String s = "I'll be sure to monitor your frequencies";
    text(s,width*.6,height*3.5, 150, 50);
  }

  //draw hearts 
  float bv = 5;
  float distance = abs(mouseX - bv);
  fill (distance);
  while (bv < width) {
    drawHeart (bv);
    bv = bv*2 ;
  }

  // click first heart and print this text
  if (mousePressed && mouseX<width*.14 && mouseX >width*.06 && mouseY >height*.01 && mouseY <height*.11){
    fill (255);
    PFont font;
    font = loadFont("CurlzMT-35.vlw"); 
    textFont(font, 25); 
    String s = "I'll be sure to monitor your frequencies";
    text(s,width*.67,height*.28, 150,height);
  }

  // click second heart and print this text
  if (mousePressed && mouseX<width*.25 && mouseX >width*.12 && mouseY >height*.05 && mouseY <height*.15){
    fill (255);
    PFont font;
    font = loadFont("CurlzMT-35.vlw"); 
    textFont(font, 35); 
    String s = "'I love you.' ... 'I know.'";
    text(s,width*.67,height*.28, 150,height);
  }

  //click third heart and print this text
  if (mousePressed && mouseX<width*.52 && mouseX >width*.27 && mouseY >height*.03 && mouseY <height*.3){
    fill (0);
    PFont font;
    font = loadFont("CurlzMT-35.vlw"); 
    textFont(font, 30); 
    String s = "I less than three you …     i < 3 you";
    text(s,width*.70,height*.28, 150,height);
  }

  //click fourth heart and print this text
  if (mousePressed && mouseX<width && mouseX >width*.52 && mouseY >height*.1 && mouseY <height*.6){
    fill (0);
    PFont font;
    font = loadFont("CurlzMT-35.vlw"); 
    textFont(font, 80); 
    String s = "Durr";
    text(s,width*.65,height*.25, 150,height);
  }

  //Will you be my Valentine? Text
  //Display headline at x location
  textFont (f,35);
  textAlign(LEFT);
  text (headlines [index],x,400);

  //Decrement x
  x = x - 3;

  //if y is less than 
  float w = textWidth (headlines [index]);
  if (x<-w) {
    x = width;
    index= (index + 1) % headlines.length;
  }

  //Translate and rotate CUPID 
  translate (width/2, height/2);
  rotate (radians (mouseY*360/500)); //make y axis like circle
  image (cute, 70,70,width/5,height/5);
}





