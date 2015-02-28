
void setup() {
  size(800,800);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}

void draw() {
  float arms = 8;
  int eSize = mouseX;
  int circles = 3;
  
  int r = 255;
  int g = 150;
  int b = 200;
  
  background(0);
  
  // repeats rotate arm
  pushMatrix();
  translate(width/2,height/2);
  for (int i = 0; i < arms; i++) {
    rotate((2*PI)/arms);
    fill(255);
    noFill();
    stroke(255);
    strokeWeight(2);
  
    float sFill = 0;
    float w = width/(2*circles);
    for (int j = 0; j < circles ; j++) {
      if (j % 3 == 0) {
        sFill = w*r/255;
      }
      else if( j % 3 == 1) {
        sFill = w*b/255;
      }
      else if (j % 3 == 2) {
        sFill = w*g/255;
      }
      ellipse(0,j*w+sFill,sFill,sFill);
    }
    //rectangle
    rect(0,0,width/2,height/2);
  }
  popMatrix();
}



