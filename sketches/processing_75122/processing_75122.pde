
float angle = 0.0;
float offset = 200;
float speed = 0.9;
float diam = 2.0;
 
void setup() {
  size(500, 500);
  background (2, 194, 201);
  noFill();
  smooth();
  stroke (204, 255, 51, 70);
  strokeWeight(0.5);
}
 
 
void draw() {
  frameRate(200);
   
  ///// MAKE ELLIPSE
  float x = offset + cos(angle) * 5;
  float y = offset + sin(angle) * 5;
  diam = map(mouseX, mouseY, 1000, 2, 200);
  
  translate (mouseX, mouseY);
  ellipse (0, 0, diam, diam);
  
   
  ///// CHANGE Direction of MAKE ELLIPSE
  if (mousePressed) {
    pushMatrix();
    //angle -= speed;
    noStroke();
    fill(256*float(mouseX)/width,256-256*float(mouseX)/width,256/12*5, 200);
    ellipse (0, 0, diam*2, diam*2);
    popMatrix();
  }
}
