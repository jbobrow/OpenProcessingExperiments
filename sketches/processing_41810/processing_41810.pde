
PImage man, mow, fish;
float rx, ry;
float vx, vy;

void setup() {
  size(750, 500);
  man = loadImage("man.jpg");
  mow = loadImage("manofwar2.png");
  fish = loadImage ("fish.png");
  rx= 405;
  ry= 100;
  vx = noise (millis()/1000.0);
  vy = noise (millis()/2300.0);
}


void draw() {
  //background
  tint(255, 150);
  image (man, 0, 0);

  rx += vx;
  ry += vy;
  
  tint (255, 255);
  manOfWar(rx, ry);
  
  if (mousePressed == true) {
    rx = 0.99*rx + 0.01*mouseX;
    ry = 0.98*ry +0.02*mouseY ;
  }

  if ((rx < 100) || (rx > (width-145))) {
    vx = -vx;
  } 
  if ((ry < -10) || (ry > (height-145))) {
    vy = -vy;
  }
}

void manOfWar(float x, float y) {
  noStroke();
  smooth();

  //-------------------------------------------------
  pushMatrix();
  translate (x-55, y+150);
  fill (random(100, 255), random(100, 255), random(100, 255));
  for (int i=1; i<8; i++) {
    translate(0, 20); 
    rotate((0.5+(i/10))*sin(millis()/2000.0 ));
    rect(0, 0, 20, 20);
  }
  for (int i=1; i<8; i++) {
    translate(0, 20); 
    rotate((0.8 + (i/10))*cos(millis()/800.0 ));
    rect(0, 0, 20, 20);
  }
  popMatrix();
  //-------------------------------------------------
  pushMatrix();
  translate (x-80, y+150);
  fill (random(100, 255), random(100, 255), random(100, 255));
  for (int i=1; i<17; i++) {
    translate(0, 12); 
    rotate(((noise(0.1, 0.5))+(i/10))*sin(millis()/800.0 ));
    rect(0, 0, 12, 12);
  }
  for (int i=1; i<15; i++) {
    translate(0, 12); 
    rotate((0.5 + (i/10))*-cos(millis()/400.0 ));
    rect(0, 0, 12, 12);
  }
  popMatrix();
  //-------------------------------------------------
  pushMatrix();
  fill (random(100, 255), 150);
  translate (x-65, y+150);
  for (int i=1; i<8; i++) {
    translate(0, 20); 
    rotate(((noise(0.1, 1)) + (i/10))*cos(millis()/3500.0 ));
    rect(0, 0, 20, 20);
  }
  for (int i=1; i<8; i++) {
    translate(0, 20); 
    rotate((0.4 + (i/10))*sin(millis()/3000.0 ));
    rect(0, 0, 20, 20);
  }
  pushMatrix();
  scale (0.2, 0.2);
  image (fish, -500, -300);
  popMatrix();
  popMatrix();
    //-------------------------------------------------
  pushMatrix();
  fill (random(100, 255), 175);
  translate (x-68, y+150);
  for (int i=1; i<10; i++) {
    translate(0, 20); 
    rotate(((noise(0.1, 1)) + (i/10))*-cos(millis()/3040.5 ));
    rect(0, 0, 20, 20);
  }
  for (int i=1; i<11; i++) {
    translate(0, 20); 
    rotate((0.6 + (i/10))*-sin(millis()/2301.0 ));
    rect(0, 0, 20, 20);
  }
  popMatrix();
  //-------------------------------------------------
  pushMatrix();
  fill (random(100, 255), random(100, 255),random(100, 255),175);
  translate (x-40, y+150);
  for (int i=1; i<15; i++) {
    translate(0, 15); 
    rotate( (1 + (i/10))*-cos(millis()/5050.0 ));
    rect(0, 0, 15, 15);
  }
  for (int i=1; i<13; i++) {
    translate(0, 15); 
    rotate( 0.5+(i/10)*sin(millis()/2600.0 ));
    rect(0, 0, 15, 15);
  }
  popMatrix();
  //-------------------------------------------------
  pushMatrix();
  translate (x-50, y+150);
  pushMatrix();
  fill (random(100, 255), random(0, 255), random(100, 255));
  for (int i=1; i<30; i++) {
    translate(0, 10); 
    rotate( (0.3 + (i/10))*(-sin(millis()/3000.0 )));
    rect(0, 0, 10, 10);
  }
  popMatrix();
  for (int i=2; i<16; i++) {
    translate(0, 15); 
    rotate( (1 + (i/10))*-cos(millis()/4000.0 ));
    rect(0, 0, 15, 15);
  }
  for (int i=3; i<20; i++) {
    translate(0, 15); 
    rotate( (1 + (i/10))*-sin(millis()/2000.0 ));
    rect(0, 0, 15, 15);
  }
  popMatrix();
  //-------------------------------------------------
//head
  image (mow, x-155, y-15);
}


