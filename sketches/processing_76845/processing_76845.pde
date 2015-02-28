
//Program modified from pp293 of the Processing textbook.

//variables affecting movement
float angle = random(1, 10);
//float speed = .001; //for checking movement of objects at a non-random speed
float speed = random(0.01, 0.02);
float radius = random(30.0, 100.0);
float sx = random(1.0, 3.0);
float sy = random(1.0, 3.0);
float s2x = random(1.0, 3.0);
float s2y = random(1.0, 3.0);
float s3x = random(1.0, 3.0);
float s3y = random(1.0, 3.0);

//color variables
float j; 
float k;
float l;
float q;
float w;
float a;

//size of the pink circle
float c;

//variables for wings
float u;
float h;
float g;
float i = 0;
float e = 0;
float r = 0;

boolean fear = false;
PImage img;

void setup () {
  size (300, 300);
  smooth();
  noStroke();

  //img = loadImage("img_8708_blue_sky2.jpg");
  img = loadImage("project1.jpg");
}

void draw () {

  //background image:
  //black background
  //fill(0, 10);
  //rect (0, 0, width, height);
  
  //image background
  tint(255, 140, 255, 30);
  image(img, 0, 0);

  //variables affecting movement and movement path:
  
  angle += speed;

  float sinval1 = sin(((angle)*sx)+2);
  float cosval1 = cos(((angle)*sy)+2);
  float sinval = sin(angle*sx);
  float cosval = cos(angle*sy);

  float x = 150 + (cosval*radius);
  float y = 150 + (sinval*radius);
  float x1 = 150 + (cosval1*radius);
  float y1 = 150 + (sinval1*radius);

  //variables affecting the pink circle's white wings
  if (i > 20) {
    u = -2;
  }
  if (i <= 0) {
    u = 2;
  }
  i += u;
  fill(255, 80);

  beginShape();
  vertex(x1, y1);
  vertex(x1+5+u, y1-6+u);
  vertex(x1+14+u, y1-12+u);
  vertex(x1+5+u, y1+u);
  endShape();

  beginShape();
  vertex(x1, y1);
  vertex(x1-5-u, y1-6+u);
  vertex(x1-14-u, y1-10+u);
  vertex(x1-5-u, y1+u);
  endShape();

  //these are an unused second set of wings
  /*
  beginShape();
  vertex(x1, y1);
  vertex(x1+2+u, y1+6+u);
  vertex(x1+7+u, y1+12+u);
  vertex(x1+2+u, y1+u);
  endShape();
   
  beginShape();
  vertex(x1, y1);
  vertex(x1-2+u, y1+6+u);
  vertex(x1-7+u, y1+12+u);
  vertex(x1-2+u, y1+u);
  endShape();
  */

  //small pink circle
  fill(j, k, l);
  ellipse(x1, y1, c, c);


  //variables for the movement of the second smallest circle, in comparison to the the first circle
  float x2 = x + cos(angle*s2x)*radius/2;
  float y2 = y + sin(angle*s2y)*radius/2;

  //variables for the movement of the second smallest circle's wings
  if (e > 60) {
    h = -1;
  }
  if (e <= 0) {
    h = 1;
  }
  e += h;

  //second smallest circle's wings
  fill(200-y2, 270-y2, 330-y2, 200);
  triangle(x2, y2, x2+12+h, y2-10+h, x2+2+h, y2+5+h);
  triangle(x2, y2, x2-12-h, y2-10+h, x2-2-h, y2+5+h);

  //second smallest circle
  fill(200-y2, 270-y2, 330-y2);
  ellipse(x2, y2, 8, 8);

  //variables for the movement of the largest circle
  float x3 = x + cos(angle*s3x)*radius/6;
  float y3 = y + sin(angle*s3y)*radius/6;

  //variables for the movement of the largest circle's wings
  if (r > 70) {
    g = -1;
  }
  if (r <= 0) {
    g = 1;
  }
  r += g;
 
  //the largest circle's wings
  fill(150-y3, 260-y3, 355-y3, 200);
  triangle(x3, y3, x3+15+g, y3-12+g, x3+4+g, y3+5+g);
  triangle(x3, y3, x3-15-g, y3-12+g, x3-4-g, y3+5+g);

  //the largest circle
  fill(150-y3, 260-y3, 355-y3);
  ellipse(x3, y3, 10, 10);

  //the fill variables of the small pink circle
  j = 242;
  k = 175;
  l = 175;
  c = 7;

  //fill variables as affected by proximity to other circles 
  if ((dist(x3, y3, x1, y1) < dist(x2, y2, x1, y1)) && dist(x3, y3, x1, y1)<20) {
    j = 240;
    k = 210;
    l = 210;
    c = 12;
  }

  if ((dist(x2, y2, x1, y1) < dist(x3, y3, x1, y1)) && dist(x2, y2, x1, y1)<30) {
    j = 185;
    k = 100;
    l = 100;
    c = 12;
  }
}


