

float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
float flapSpeed = 0.2;

void setup(){
  size(640, 360, P3D);
  background(0);
  noStroke();
}

void draw(){
fill(0,15);
rect(0,0,width,height);
lights();

  // Flight
  px = sin(radians(ang3)) * 170;
  py = cos(radians(ang3)) * 300;
  pz = sin(radians(ang4)) * 500;
  translate(width/2 + px, height/2 + py, -700+pz);
  rotateX(sin(radians(ang2)) * 120);
  rotateY(sin(radians(ang2)) * 50);
  rotateZ(sin(radians(ang2)) * 65);
  
  // Body
  fill(255,200,5);
  ellipse(mouseX, mouseY, 60, 60);


  
  // Left wing
  fill(255,255,255);
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


