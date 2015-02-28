
float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
float flapSpeed = 0.2;
void setup(){
  size(200, 200, OPENGL);
  frameRate(50);
  noStroke();
}
void draw(){
  background(0);
  camera();
  // Flight
  px = sin(radians(ang3)) * 170;
  py = cos(radians(ang3)) * 300;
  pz = sin(radians(ang4)) * 500;
  translate(width/2 + px, height/2 + py, -700+pz);
  rotateX(sin(radians(ang2)) * 120);
  rotateY(sin(radians(ang2)) * 50);
  rotateZ(sin(radians(ang2)) * 65);
  
  // Body
  fill(153);
  box(20, 100, 20);
  // Left wing
  fill(204);
  pushMatrix();
  rotateY(sin(radians(ang)) * -20);
  rect(-75, -50, 75, 100);
  popMatrix();
  // Right wing
  pushMatrix();
  rotateY(sin(radians(ang)) * 20);
  rect(0, -50, 75, 100);
  popMatrix();
  // Wing flap
  ang += flapSpeed;
  if (ang > 3) {
    flapSpeed *= -1;
  } 
  if (ang < -3) {
    flapSpeed *= -1;
  }
  // Increment angles
  ang2 += 0.01;
  ang3 += 2.0;
  ang4 += 0.75;
}                                               
