
/**
 Random Coloured Square Painting (STUDY)
 28/08/2013
 */

float x, y;
float w, h;

float c;
float o;
float l;
float trans;

void setup() {
  frameRate(30);
  size(420, 594);
  noStroke();
  //background(255,255,255);
  background(random(0,255), random(0,255), random(0,255));
}

void draw() {

  x = random(-width, width);  
  y = random(-height, height);


  w = random(1, width/3);
  h = random(1, height/3);
  if(width-10 > x+w && x > 10 && height-10 > y+h && y > 10){
      fill(c, o, l, trans);
      rect(x, y, w, h);
  }
  c = random(0.0, 255.0); 
  o = random(0.0, 255.0);
  l = random(0.0, 255.0);
  trans = random(0.0, 255.0);
  
  
  if (mousePressed){
     if (mouseButton == LEFT){
    background(random(0,255), random(0,255), random(0,255));
    //background(126,126,126);
     }
  }
}



