
/*
Random Color Circles
adalau85@gmail.com
October 3, 2009
*/
float rCircle, gCircle, bCircle, cSize;

void setup() {
  size(500,500);
  background(255);
  smooth();
  noStroke();
};

void draw() {
  //random color for r g b
  rCircle = random(0,255);
  gCircle = random(0,255);
  bCircle = random(0,255);

  //random cirlce size
  cSize = random(200);  
  
  fill(rCircle,gCircle,bCircle,120);
  ellipse(random(0,500),random(0,500),cSize,cSize);
};

