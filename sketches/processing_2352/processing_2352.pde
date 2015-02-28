
import processing.opengl.*;
import guicomponents.*;

float sigma = 10.0, rho = 28.0, beta = 8.0/3.0;

float theta = PI/4, phi = PI/4;
PVector eye = new PVector();
PVector center = new PVector(0, 0, rho-1);
float dist = 100;

boolean play = false;

LorenzAttractor lorenz;
LorenzController control;

void setup(){
  size(600, 600, P3D);
  
  lorenz = new LorenzAttractor();
  control = new LorenzController(this, lorenz);
}

void draw(){
  background(0,0,0);

  if (keyPressed && keyCode == DOWN && phi < PI/2) phi += 0.1;
  else if (keyPressed && keyCode == UP && phi > -PI/2) phi -= 0.1;
  if (keyPressed && keyCode == LEFT) theta += 0.1;
  else if (keyPressed && keyCode == RIGHT) theta -= 0.1;

  eye.x =  dist * sin(theta) * cos(phi);
  eye.y = -dist * sin(phi);
  eye.z =  dist * cos(theta) * cos(phi); 
  eye.add(center);

  background(0);

  camera(eye.x, eye.y, eye.z,
  center.x, center.y, center.z,
  0.0, 1.0, 0.0); // upX, upY, upZ

  if (play) {
    lorenz.update();
    control.update();
  }
  lorenz.display();
  lorenz.drawOrigin();
  lorenz.drawP();
  //lorenz.displayField(new PVector(control.x, control.y, control.z), 10, 4, 100);
}


