
Orb[] a = new Orb[30];
Oscillator[] b = new Oscillator[100];

void setup() {
  size(828, 579);

  for (int i = 0; i < a.length; i++) {
    a[i] = new Orb(random(-800, width/2), random(-600, height/2), random(0, 255));
    rotate(random(-90, 90));
  }

  for (int i = 0; i < b.length; i++) {
    b[i] = new Oscillator(i*4, i*5);
  }

  background(255);
}

void draw() {

  for (int i = 0; i < a.length; i++) {
    a[i].circle();
  }
  for (int i = 0; i < b.length; i++) {
    b[i].oscillate();
    b[i].display();
  }
}

// void mousePressed() {
//   for (int i = 0; i < a.length; i++) {
//     b[i].display();
//   }
// }

class Orb {

  //point of the orb
  float pointAx = 244.09;
  float pointAy = 244.09;
  float pointBx = 400;
  float pointBy = 179.51;
  float pointCx = 555.91;
  float pointCy = 244.09;
  float pointDx = 620.49;
  float pointDy = 400;
  float pointEx = 555.91;
  float pointEy = 555.91;
  float pointFx = 400;
  float pointFy = 620.49;
  float pointGx = 244.09;
  float pointGy = 555.91;
  float pointHx = 179.51;
  float pointHy = 400;
  float pointIx = 244.09;
  float pointIy = 244.09;
  float pointJx = 400;
  float pointJy = 179.51;
  //float pointKx = 555.91;
  float pointKx = 244.09;
  float pointKy = 244.09;
  float x, y, z;
  PImage stage;

  //constructor 
  Orb(float a, float b, float c) {
    x = a;
    y = b;
    z = c;
  }
  void circle() {
    //fill(30, 200, 150, 50);
    // fill(random(100, 150)*.05+map(cos(frameCount*0.05), -1, 1, -50, 50), random(100, 200)*0.05, map(cos(frameCount*0.03), -1, 1, -50, 50), 80);
    fill(x, y, z, 80);
    noStroke();
    //strokeWeight(0.1);
    //stroke(0, 0, 0, 100);
    // curveTightness(10);
    pushMatrix();
    translate(x, y);
    beginShape();
    curveVertex(pointAx+map(cos(frameCount*0.05), -1, 1, -50, 50), pointAy*2+map(cos(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointBx+map(sin(frameCount*0.02), -1, 1, -50, 50), pointBy+map(cos(frameCount*0.02), -1, 1, -50, 50));
    curveVertex(pointCx+map(cos(frameCount*0.05), -1, 1, -50, 50), pointCy+map(cos(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointDx+map(cos(frameCount*0.2), -1, 1, -50, 50), pointDy+map(cos(frameCount*0.2), -1, 1, -50, 50));
    curveVertex(pointEx+map(sin(frameCount*0.05), -1, 1, -50, 50), pointEy+map(cos(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointFx+map(cos(frameCount*0.02), -1, 1, -50, 50), pointFy+map(cos(frameCount*0.02), -1, 1, -50, 50));
    curveVertex(pointGx+map(sin(frameCount*0.05), -1, 1, -50, 50), pointGy+map(sin(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointHx+map(cos(frameCount*0.02), -1, 1, -50, 50), pointHy+map(cos(frameCount*0.02), -1, 1, -50, 50));
    curveVertex(pointIx+map(sin(frameCount*0.05), -1, 1, -50, 50), pointIy+map(cos(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointJx+map(cos(frameCount*0.02), -1, 1, -50, 50), pointJy+map(cos(frameCount*0.02), -1, 1, -50, 50));
    curveVertex(pointKx-map(sin(frameCount*0.05), -1, 1, -50, 50), pointKy+map(cos(frameCount*0.05), -1, 1, -50, 50));
    curveVertex(pointAx+map(cos(frameCount*0.03), -1, 1, -50, 50), pointAy+map(cos(frameCount*0.03), -1, 1, -50, 50));
    curveVertex(pointAx+map(cos(frameCount*0.03), -1, 1, -50, 50), pointAy*2+map(cos(frameCount*0.03), -1, 1, -50, 50));
    endShape(CLOSE);
    popMatrix();
  }
}

class Oscillator {

  PVector angle;
  PVector velocity;
  PVector amplitude;
  float a, b;

  Oscillator(float _x, float _y) {
    a = _x;
    b = _y;
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    //Random velocities and amplitudes
    amplitude = new PVector(random(width/2), random(height/2));
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display() {
    //Oscillating on the x-axis
    float x = sin(angle.x)*amplitude.x;
    //Oscillating on the y-axis
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(a, b);
    fill(random(0, 255), random(0, 255), random(0, 255), 100);
    ellipse(x, y, 5, 5);
    popMatrix();
  }
}


