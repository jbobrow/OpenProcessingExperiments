
//import processing.opengl.*;

float rota=0;
float dista=0;

void setup() {
  size(800, 400, P3D);
  background(0);
  smooth();
}

void draw() {
  noStroke();
  fill(0, 5);
  translate(width/2, height/2); 
 // rotateX(15*millis()*0.02);

  stroke(200);
  strokeWeight(0.2);

  float noivel=noise(dista)*800;

  rotate(rota);

  float maxdis=height*0.45;

  line(noivel, 0, maxdis, 0);
  line(noivel*0.5, 0, noivel*0.2, 0);
  noStroke();
  fill(255);
  ellipse(noivel*0.2, 0, 1, 1);
  ellipse(noivel*0.5, 0, 1, 1);
  fill(random(0, 255));
  ellipse(maxdis, 0, 2, 2);
  // popMatrix();
  rota+=0.01;
  dista+=noivel;
}


