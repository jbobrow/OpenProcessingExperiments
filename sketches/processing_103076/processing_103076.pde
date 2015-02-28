
int alph;
PVector t1;
PVector t2;
PVector t3;
PVector t4;
int w = 1000; // nb set size in setup for js export
int h = 800;
int d = 300;

int      level1 = 7;
int      level2 = 20;
int      sweepNum = 12;

float    offsetX = -0.2;
float    offsetY = -0.1;
float    offsetZ = -0;
int      colIncr = -10;
float    fcIncr = .002;
float    scaleIncr = .0075;
float    rotX = 1;
float    rotY = 1;
float    rotZ = 1;
float    rotXIncr = PI/16; // in radians
float    rotYIncr = PI/64;
float    rotZIncr = 0;

void setup() { 
  size(1000, 800, P3D); 
  background(30);
  t1 = new PVector(0, 0, 0);
  t2 = new PVector(0, 0, 0);
  t3 = new PVector(0, 0, 0);
  t4 = new PVector(0, 0, 0);
  //  noStroke();
  noFill();
}

void draw() {
  background(64);
  stroke(0);

  t1.set(map(noise(fcIncr*frameCount+ 5), 0, 1, -40,  500), 
         map(noise(fcIncr*frameCount+10), 0, 1, -60, -1200), 
         map(noise(fcIncr*frameCount+20), 0, 1, -340,   40)); // anchor point 1
  t2.set(map(noise(fcIncr*frameCount+25), 0, 1, -30, -800), 
         map(noise(fcIncr*frameCount+30), 0, 1,  60,  500),
         map(noise(fcIncr*frameCount+35), 0, 1,  800,  200)); // anchor point 2
  t3.set(map(noise(fcIncr*frameCount+40), 0, 1,    0,  200),
         map(noise(fcIncr*frameCount+45), 0, 1,    0,  300), 
         map(noise(fcIncr*frameCount+50), 0, 1,    0,  300)); // control point 1
  t4.set(map(noise(fcIncr*frameCount+55), 0, 1,  200,  20),
         map(noise(fcIncr*frameCount+60), 0, 1,    0,  300), 
         map(noise(fcIncr*frameCount+65), 0, 1,  240,  300)); // control point 2

  for (int k=0; k<sweepNum; k++) {

    stroke(150+colIncr*k, 75-colIncr*k, 40+colIncr*k);
//    pushMatrix();
    translate(width/2+width*offsetX, height/2+height*offsetY, d/2+offsetZ);
    scale(.5-(k*scaleIncr));
    rotateX(TWO_PI/rotX+rotXIncr*frameCount/45);
    rotateY(TWO_PI/rotY+rotYIncr*frameCount/600);
    rotateZ(TWO_PI/rotZ+rotZIncr*frameCount/300);
//    line(-200, 0, 0, 200, 0, 0);     text("x", 210, 5, 5);     text("x", -210, 5, 5);
//    line(0, -200, 0, 0, 200, 0);     text("y", 5, 210, 5);     text("y", 5, -210, 5);
//    line(0, 0, -200, 0, 0, 200);     text("z", 5, 5, 210);     text("z", 5, 5, -210);
    for (int i=0; i<level1; i++) {
      pushMatrix();
      rotate(map(i, 0, level1, 0, TWO_PI));
      translate(100, 100);
      for (int j=0; j<level2; j++) {
        pushMatrix();
        rotate(map(j, 0, level2, 0, TWO_PI));
        //draw here
        bezier (t1.x, t1.y, t1.z, t2.x, t2.y, t2.z, t3.x, t3.y, t3.z, t4.x, t4.y, t4.z);
        popMatrix();
      }
      popMatrix();
    }
//    popMatrix();
  }
}


void refreshScreen (float alph) {
  fill(0, alph);
  noStroke();
  rect(0, 0, width, height);
}

void mouseClicked() {
  noiseSeed(int(random(frameCount)));
  setup();
}



