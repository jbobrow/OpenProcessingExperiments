
float time = 0;
float time2 = 0;
float inc = 0.005;
float col = 0.001;
boolean scrn;

Rib[] rib;

  // Static Images
/*  
void setup() {
  size (850, 313);
  colorMode(HSB, 360, 100, 100);
  background(360);
  

  rib = new Rib[1];
  for (int i = 0; i < rib.length; i++) {
   rib[i] = new Rib(-height*.1, width*.0006);
  }

  for (int count = 0; count < 2; count ++) {
  for (float z = -width*.1; z < width*1.1; z += rib[0].spd) {
  float n = noise(time)*height;
  for (int i = 0; i < rib.length; i++) {
    rib[i].disp();
    rib[i].move();
  }
  fill(0);
  time += inc;
  time2 += col;
  }
  }
}

void draw(){
}

void keyPressed() {
  
  if (key == ' ') {
    background(360);
    for (int count = 0; count < 2; count ++) {
  for (float z = -width*.1; z < width*1.1; z += rib[0].spd) {
  float n = noise(time)*height;
  for (int i = 0; i < rib.length; i++) {
    rib[i].disp();
    rib[i].move();
  }
  fill(0);
  time += inc;
  time2 += col;
  }
  }
  }
  
 if (key == 'p' && !scrn) {
    scrn = true;
  saveFrame();
  }
}
*/
  // Animated Process

void setup() {
  size (850, 313);
  background(255);
  colorMode(HSB, 360, 100, 100);

  rib = new Rib[1];
  for (int i = 0; i < rib.length; i++) {
    rib[i] = new Rib(-height*.1, width*.0006);
  }
}

void draw() {

  float n = noise(time)*height;
  for (int i = 0; i < rib.length; i++) {
    rib[i].disp();
    rib[i].move();
  }
  fill(0);
  time += inc;
  time2 += col;
}

class Rib {
  float lx;
  float ly;
  float r = 0.00;
  float spd = 0.00;
  float s;
  float n = noise(time)*height;
  float rs = .00628;
  float nc = random(15, 240);
  float cflow = .1;
  
  Rib(float tX, float tspd) {
    lx = tX;
    spd = tspd;
  }

  void disp() {
    pushMatrix();
    s = height/6+noise(time)*height/6;
    rectMode(CENTER);   
    translate(lx, ly);
    rotate(r);
    noStroke();
    fill(nc, 100, 100, 60);
    ellipseMode(CORNERS);
    ellipse(0, -s, .5, -s-random(5, 20)); 
    ellipse(0, s, .5, s+random(5, 20));
    
    //ellipse(0, -s, 1, 1);
    //ellipse(0, s, 1, 1);

    stroke(nc, 60, 100, 20);
    strokeWeight(5);
    noFill();
    //bezier(0, s, noise(time)*random(-width/8, -width/7.5), noise(time)*random(-height/3, -height/3.5), noise(time)*random(width/8, width/7.5), 0, 0, -s);
    bezier(0, s, -width/8, -height/3, width/8, 0, 0, -s);
    popMatrix();
    ly = -height*.1+noise(time)*height*1.2;
    nc += cflow;
    if (nc > 240) {
      cflow *= -1;
    }
    if (nc < 15) {
      cflow *= -1;
    }
  }

  void move() {
    lx += spd;
    r += rs;
    if (lx > width+100) {
      lx = -100;
      rs = rs*-1;
      nc = random(15, 240); 
    }
  }  
}

