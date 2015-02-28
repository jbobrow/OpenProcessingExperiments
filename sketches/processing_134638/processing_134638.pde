
float rotation=0;

void setup() {
  size(1800, 1200, P3D);
  frameRate(60);
}


void draw() {
  background(0);
  lights();
  
  float orbitRadius= mouseX/2+50;
  float ypos= mouseY/3;
  float xpos= cos(radians(rotation))*orbitRadius;
  float zpos= sin(radians(rotation))*orbitRadius;
  
  camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);


 
noFill();
//fill(200);
//stroke(random(150), 150, random(255));
 stroke(255);
 
 
 /**
sphereDetail(16,32);
sphere(25);
 
sphereDetail(8,16);
sphere(50);
 
sphereDetail(4,8);
sphere(100);
 
sphereDetail(2,4);
sphere(200);
 
sphereDetail(1,2);
sphere(400);
 **/
 
 sphereDetail(8,16);
sphere(75);
 
sphereDetail(4,8);
sphere(150);
 
sphereDetail(2,4);
sphere(300);
 
 
sphereDetail(1,2);
sphere(600);
 

  rotation++;
}
