
float x =0;
float y =0;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0;i<=12;i++) {
    fill(255);
    float r = 180;
    pushMatrix();
    rotate(i*TWO_PI/12);
    translate(0, -r);
    quad(-10, -20, -20, 20, 20, 20, 10, -20);
    popMatrix();
  }
  popMatrix();
  
  float angle = atan2(mouseY-height/2, mouseX-width/2);
  pushMatrix();
  float deg = degrees(PI);
  translate(250, 250);
  rotate(angle);

  imageMode(CENTER);
  PImage img ;
  img = loadImage("croco boy.png");
  image(img, x, y, 300, 300);  

  popMatrix();
}






