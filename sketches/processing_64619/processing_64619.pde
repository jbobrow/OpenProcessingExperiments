
/*
ACCD Summer 2012
ID02
Midterm Progress1
Charlene Chen
06/15/2012
*/


PImage img;
PImage H2;

void setup() {
 size(500, 500);
 smooth();
 noStroke();
 frameRate(3);
 img = loadImage("june.png");
 H2 = loadImage("H2.png");
 
 background(255);
}

void draw() {
// background(0);
// for (int x =0; x < img.width; x++) {
//  for (int y = 0; y < img.height; y ++) {
//    float xpos1 = random(x*10);
//    float xpos2 = width - random(y*10);
//    color c = img.get(x,y);
//    stroke(c);
//    //strokeWeight(3);
//    line(xpos1, 0, xpos2, height);
//    println(xpos2);

  int ix = int(random(img.width));
  int iy = int(random(img.height));
  color c = img.get(ix,iy);
  fill(c, 102);
  int xgrid = int(random(-2, 5)) * 100;
  int ygrid = int(random(-2, 5)) * 100;
  
  rect (xgrid, ygrid, 150, 150);
  
  tint(255, 200);
  image(H2, 0, 0);
  
  
//  }
// } 
 
//  tint(255, 240);
//  image(H, 0, 0);
}

