
float rx = 0;
float ry = 0;
float z = 300;
float y = 325;
float speedZ = -2;

void setup() {  //setup function called initially, only once

  size(600, 600, P3D);
  smooth ();
  noStroke ();
}

void draw() {  //draw function loops 

background(255);
lights();

pushMatrix ();
translate (300, y, z);
rotateX (rx);
rotateY (ry);
sphere (28);
popMatrix ();

z += speedZ;

if (z < -165) {
 
  speedZ = speedZ * -1;
  
}

if (z > 420) {
  
  speedZ = speedZ * -1;
}

println (z);

}
void mousePressed() {
  fill (random(255), random(255), random (255));
}

void mouseDragged () {
  
  rx = mouseX * 0.05;
  ry = mouseY * 0.05;
  
}
  

