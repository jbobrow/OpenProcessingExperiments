
float scale1;
float scale2;
float scale3;
float scale4;

void setup() {
  size(400, 400);

  scale1 = 3*width/4;
  scale2 = width-scale1;
  scale3 = scale1-scale2;
  scale4 = scale2*.5;

  //black stroke,thick
  stroke(0);
  strokeWeight(3);
}

void draw() {
mondrect(0, 0, scale1, scale1);
mondrect(0, scale1, scale2, scale2);
mondrect(scale2, scale1, scale4, scale3);
mondrect(scale2, scale1+scale3, scale4, scale3);
mondrect(scale1, scale2, scale3, scale4);
mondrect(scale1+scale3, scale2, scale3, scale4);
mondrect(scale1, 0, scale2, scale2);
mondrect(scale1, scale1, scale2, scale2);
  noLoop();
}

void mondrect(float posX, float posY, float sizeX, float sizeY) {
  fill(255*sizeX/width, 255*sizeY/height, 255*(posX+posY)/( width+height));
  rect(posX, posY, sizeX, sizeY);
  println("x="+sizeX+"Y="+sizeY);
}

