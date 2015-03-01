
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/55336*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//import processing.opengl.*;

PImage sphere_tex;

float rotx = 0.0;
float roty = 0.0;
float rotz = 0.0;
float deltax = 0.01;

float pushBack = 0; // z coordinate of the center of the sphere
float factor = 0.99; // magnification factor

PShape ball;

void setup(){
  size(512, 384, P3D);
  pushBack = height;
  sphere_tex = loadImage("360-panoramas-st-ives-pier-1200x600.jpg");
  noStroke();
  ball = createShape(SPHERE, 1);
  ball.setTexture(sphere_tex);  
}

void draw(){
  println(frameRate);
  
  background(0);
  
  translate(width / 2.0, height / 2.0, pushBack);
  if (abs(rotx) > PI / 2) {
    deltax = -deltax;
  }
  rotateX(rotx += deltax);
  rotateY(roty += 0.01);
  rotateZ(rotz);
  //rotateZ(rotz -= 0.02);
  textureMode(IMAGE);
  noStroke();
  scale(pushBack *= factor);
  shape(ball);
  if (pushBack < height / 2.0) {
    factor = 1.01;
  } else {
    if (pushBack > height) {
      factor = 0.99;
    }
  }
}

void mousePressed(){
saveFrame();
}



