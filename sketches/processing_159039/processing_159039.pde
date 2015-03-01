
/* @pjs preload="bluewater.JPG"; */

PImage img; 
int rotcount=0;

void setup() {
  size(350, 350, OPENGL);
  noStroke();
  img = loadImage("bluewater.JPG");
}

void draw() {
  background(255);
  translate(width/2, height/2, -50);
  rotateX(mouseX+rotcount);
  rotcount+=0.005;
  rotateY(mouseY-rotcount);
  scale(15);

  beginShape(TRIANGLE_FAN);
  texture(img);
//  tint(#11D11C);

  vertex(0, 10, 0, img.width/2, 0); //1
  vertex(10, 0, 0, 0, img.height); //2
  vertex(0, 0, -10, img.width*0.25, img.height); //3
  vertex(-10, 0, 0, img.width*0.50, img.height); //4
  vertex(0, 0, 10, img.width*0.75, img.height); //5
  vertex(10, 0, 0, 0, img.height); //repeat to close the shape 6
  endShape();

  beginShape(TRIANGLE_FAN);
  texture(img);

  vertex(0, -10, 0, img.width/2, 0); //1
  vertex(10, 0, 0, 0, img.height); //2
  vertex(0, 0, -10, img.width*0.25, img.height); //3
  vertex(-10, 0, 0, img.width*0.50, img.height); //4
  vertex(0, 0, 10, img.width*0.75, img.height); //5
  vertex(10, 0, 0, 0, img.height); //repeat to close the shape 6
  endShape();
}



