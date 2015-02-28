
/* @pjs preload="bluewater.JPG"; */

PImage img; 
int rotcount=0;

void setup() {
  size(150, 150, OPENGL);
  noStroke();
  img = loadImage("bluewater.JPG");
}

void draw() {
  background(255);
  translate(width/2, height/2, -50);
  rotateX(mouseY+rotcount);
  rotcount+=0.01;
  rotateY(mouseX/3);
  rotateZ(rotcount/2);
  scale(15);

  beginShape(TRIANGLE_FAN);
  texture(img);
//  tint(#11D11C);

  vertex(0, 5, 0, img.width/2, 0); //1
  vertex(5, 0, 0, 0, img.height); //2
  vertex(0, 0, -5, img.width*0.25, img.height); //3
  vertex(-5, 0, 0, img.width*0.50, img.height); //4
  vertex(0, 0, 5, img.width*0.75, img.height); //5
  vertex(5, 0, 0, 0, img.height); //repeat to close the shape 6
  endShape();

  beginShape(TRIANGLE_FAN);
  texture(img);

  vertex(0, -5, 0, img.width/2, 0); //1
  vertex(5, 0, 0, 0, img.height); //2
  vertex(0, 0, -5, img.width*0.25, img.height); //3
  vertex(-5, 0, 0, img.width*0.50, img.height); //4
  vertex(0, 0, 5, img.width*0.75, img.height); //5
  vertex(5, 0, 0, 0, img.height); //repeat to close the shape 6
  endShape();
}



