
float maxheight, baseheight;
int numlines = 100;
int linelen = 30;
int offset = 10;
Star[] stars = new Star[4];
boolean active = false;


void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  background(0, 0, 125);
  maxheight = height/5;
  baseheight = 2*height/3;
  for (int x = 1; x < 4; x++) {
    stars[x] = new Star();
  }
}


void draw() {
  background(0, 0, 0);
  for (int x = 1; x < 4; x++) {
    stroke(0, 0, 125);
    strokeWeight(2);
    line(x * width/4, height, x * width/4, baseheight);
    strokeWeight(4);
    line(x * width/4, baseheight, x * width/4, maxheight);
    if (active) {
      stars[x].display(x*width/4, maxheight);
    }
  }

  if (active) {
    maxheight++;
  }

  if (maxheight >= baseheight) {
    background(0, 0, 0);
    for (int x = 1; x < 4; x++) {
      stroke(0, 0, 125);
      strokeWeight(2);
      line(x * width/4, height, x * width/4, baseheight);
      active = false;
    }
  }
}

void mousePressed() {
  active = true;
}

void keyPressed(){
 if (key == 'r'){
    maxheight = height/5;
 } 
}



class Star {
  int[] xx = new int[numlines];
  int[] yy = new int[numlines];
  int[] zz = new int[numlines];

  Star() {
    for (int p = 0; p<numlines; p++) {
      xx[p] = int(random(-linelen, linelen));
      yy[p] = int(random(-linelen, linelen));
      zz[p] = int(random(-linelen, linelen));
    }
  }

  void display(float x, float y) {
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    rotateY(frameCount/100.0);

    for (int p = 0; p<numlines; p++) {
      stroke(random(255), 255, 255);
      line(0, 0, 0, xx[p]+random(-offset, offset), yy[p]+random(-offset, offset), zz[p]+random(-offset, offset));
    }
    popMatrix();
  }
}

