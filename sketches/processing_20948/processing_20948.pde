
void setup() {
  size(400,400,P3D);
}

int orbit = 0;

void draw() {
  camera(width/2,0,350,width/2,height/2,-200,0,1,0); 
  lights();
  background(10);

  //Sun
  translate(width/2,height/2,-200);
  fill (255,159,0);
  sphere(width/3);

  //Earth
  pushMatrix();
  rotateY(frameCount*PI/3*0.01);
  translate(250,0,0);
  noStroke();
  fill(135,196,250);
  sphere(20);
  rotateZ(orbit*-PI/6*0.05);

  orbit++;

  //Moon
  translate(50,10,0);
  noStroke();
  fill(123,126,121);
  sphere(10);
  rotateY(frameCount*PI/2*.1);
  popMatrix();
}


