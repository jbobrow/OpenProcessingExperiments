
//Samyukta Madhu
//Creative Computing
//8th April, 2013
//Spiral Universe


int numberObjects = 1000;
float degrees = 7200/numberObjects;
float offset = 0;
float distance = 10;
float rotation = 0;
void setup() {
  size(600, 600);
  noStroke();
}
void draw () {
  background(0);
  smooth();
  
  distance = 10;
  fill(255,100);
if(mousePressed==true){
      fill(random(0,255),random(0,255),random(0,255));

    }

  for ( int i = 0; i<numberObjects; i++) {
    float xOff = cos(radians(degrees*i+offset))*distance;
    float yOff = sin(radians(degrees*i+offset))*distance;
    pushMatrix();

  translate(300, 300);//defines new 'zero' coordinate
  rotate(radians(rotation));
  rect(-100 + xOff, -100 + yOff, 10, 10);
  rotation += .001;
  popMatrix();
    distance+=.5;
  }
  offset += .05;
}
