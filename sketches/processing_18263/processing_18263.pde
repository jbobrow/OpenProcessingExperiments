
float i = 0;

void setup() {

  size(540,200);
  background(255);
  smooth();

}

void draw() {
  

  translate(width/2,height/2);
  pushMatrix();
  rotate(radians(i));
  translate(width/6,height/3);
  rotate(radians(i*3));
  scale(map(sin(radians(i*6)),-1,1,.5,1), map(sin(radians(i*3)),-1,1,.5,1));
  drawEllipse();
  popMatrix();

  i = i + 0.5;

  if(i > 360)
    i = 0;
}

void drawEllipse() {
  noFill();
  stroke(0,0,0,128);
  ellipse(0,0,120,80);
}
