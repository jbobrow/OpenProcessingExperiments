
float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
float flapSpeed = 0.2;
float r = 0;


void setup(){
  size(640,360,OPENGL);
  noStroke();
  
}

void draw(){
 camera();
  lights();
  background(25,173,250);

  // Flight
  px = sin(radians(ang3)) * 170;
  py = cos(radians(ang3)) * 300;
  pz = sin(radians(ang4)) * 500;
  translate(width/2 + px, height/2 + py, -700+pz);
  rotateX(sin(radians(ang2)) * 120);
  rotateY(sin(radians(ang2)) * 50);
  rotateZ(sin(radians(ang2)) * 65);
  
  // Body
  fill(246,255,13);
  box(20, 100, 20);

  
  // Left wing
  fill(253,255,139);
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


  ambientLight(64, 64, 128);
  directionalLight(200, 200, 200, 0, 1, 0.5);

  translate(20, 100, 20);
  
  strokeWeight(1);
  
 for(int i = 0; i < 15; i++){
    fill(i * 10, 0, 0);
    noStroke();
    pushMatrix();
    translate(i-10, -6, 0);
    translate(0,sin(frameCount/5.0 + i),0);
    rotateX(i/10.0 + frameCount/20.0);
    box(1, 1, 3);
    translate(2, 5, 0);
    fill(0, 150 - i* 10, 0);
    sphere(15);
    popMatrix();
  }
}

  



