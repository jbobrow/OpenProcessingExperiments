
float posX;
float posY;
float nz = 0.05;


void setup() {
  size (800,600);
  background(0);
  smooth();
  frameRate(12);
}

void draw() {
 
  linea();
  linea2();
  nz = nz + 0.01;
  float n = 6;
  n = noise(nz)*n;
  posX = random(width)+n;
  posY = random (height)+n;
  float sz;
  sz = random(50);
  noStroke();
  fill (255,255,255,127);
  ellipse (posX, posY, sz,sz);
  fill (5,127,5,127);
  ellipse (posX, posY, sz-20,sz-20);
 rotate (90);

  
}


void linea() {

  strokeWeight(10);
  stroke(255,5,10,random(10));
  line (random(400),random(300),random(-500),0);
  line (random(width/2), random(height/2), random(800),0);
  

}
void linea2() {

  strokeWeight(8);
  stroke(10,random(10),255,random(10));
  line (random(-400),random(-300),random(500),0);
  line (random(-800),0,random(width), random(height));
  

}



