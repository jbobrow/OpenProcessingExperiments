
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Kim Sunmin
// ID: 201420066
 
boolean Shape = true;
 
float x = 0;
float y = 0;
float xL, yL;
float xSpeed = 3;
float ySpeed = 5;
 
void setup() {
  size (600, 600);
  smooth();
  background(0);
}
 
void draw() {
  stroke(#22741C, 30);
  noFill();
  x = x + xSpeed;
  y = y + ySpeed;
 
  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }
  ellipse(x, y, xL, yL);
  xL = lerp(0, mouseX, 0.5);
  yL = lerp(0, mouseY, 0.5);
  title();
}
 
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key=='c') background(0);
}
 
void title() {
  fill(127);
  textSize(10);
  textAlign(LEFT);
  text("S=save / C=Clean", 20, height-20);
  textAlign(RIGHT);
  text("Kim Sunmin, Green, Dynamic Media, 2014", width-20, height-20);
}
