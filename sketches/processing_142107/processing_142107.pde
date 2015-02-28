
float maxheight, baseheight;
int numlines = 100;
int linelen = 30;
int offset = 10;
int coloroffset = 30;
boolean active = false;
int[] cols = {  0, 30, 70, 140 };

void setup() {
  size(500, 500, P3D);
  colorMode(HSB);
  background(0, 0, 125);
  maxheight = height/5;
  baseheight = 2*height/3;
}

void draw() {
  background(0, 0, 0);
  for (int x = 1; x < 4; x++) {
    stroke(0, 0, 125);
    strokeWeight(2);
    line(x * width/4, height, x * width/4, baseheight);
    strokeWeight(5);
    line(x * width/4, baseheight, x * width/4, maxheight);
    if (active) {
      pushMatrix();
      translate(x*width/4, maxheight);
      //rotateY(frameCount/200.0);
      for (int p = 0; p<numlines; p++) {
        stroke(cols[x] + random(-coloroffset, coloroffset), 100, 255);
        strokeWeight(2);
        line(0, 0, 0, random(-linelen, linelen) + random(-offset, offset), random(-linelen, linelen) + random(-offset, offset), random(-linelen, linelen) + random(-offset, offset));
      }
      popMatrix();
    }
  }

  if (active) {
    maxheight+=1;
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
  //  if (frameCount % 3 == 0) {
  //    saveFrame("frames/####.png");
  //  }
}

void mousePressed() {
  active = true;
}

void keyPressed() {
  if (key == 'r') {
    maxheight = height/5;
  }
}

