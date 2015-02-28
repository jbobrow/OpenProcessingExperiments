
//code generated by Yosub Jack Choi

PImage bg;

//background settings
void setup() {
  size(467,700);
  frameRate(8);
  smooth();

  bg = loadImage("drum.jpg"); 
   background(bg);
}

//
float b = 250;
float c = 550;
float d = 7;
//determines variable direction the redrawn ellipses move in and the rate they increase by
void draw() 
{
  noFill();
  ellipse(b,550,d,d);
   stroke(255,0,0);
  ellipse(250,c,d,d);
   stroke(200,150,50);
  ellipse(b,c,d,d);
   stroke(255);
   strokeWeight (0.5);
  ellipse(250,550,d,d);
   stroke(0,255,0);
//determines variable rate of change; can determine speed
  b = b+7;
  c = c-7;
  d = d+2;
}

