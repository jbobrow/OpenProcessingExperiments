
boolean doIt; 
void setup() {
  size (600, 600);
  doIt = true;
}
void draw() {
  if (doIt) {
    background(255);
    smooth();

    for (int z=10; z<=600; z+=5) {
      //size
      float ry1 = random(1, 600);
      float rh1 = random(5, 10);
      float rw1 = random(5, 10);
      stroke(1);
      strokeWeight(1);
      fill(255);
      ellipse(z, ry1, rh1, rw1);
      doIt = false;
    }
    for (int q=10; q<=600; q+=5) {
      //size
      float ry2 = random(1, 600);
      float rh2 = random(5, 10);
      float rw2 = random(5, 10);
      stroke(1);
      strokeWeight(1);
      fill(255);
      rect(q, ry2, rh2, rw2);
      doIt = false;
    }
    for (int i=50; i<=600; i+=100) {
      //size
      float ry = random(1, 600);
      float rh = random(10, 300);
      float rw = random(10, 300);
      //color
      float chromr=random(0, 255);
      float chromg=random(0, 255);
      float chromb=random(0, 255);
      float tran=random(0, 255);
      noStroke();
      fill(chromr, chromg, chromb, tran);
      ellipse (i, ry, rw, rh);
      doIt = false;
    }
    for (int p=10; p<=600; p+=25) {
      //points
      float rx1 = random(0, 600);
      float ry1 = random(0, 600);
      float rx2 = random(0, 600);
      float ry2 = random(0, 600);
      float rx3 = random(0, 600);
      float ry3 = random(0, 600);
      float rx4 = random(0, 600);
      float ry4 = random(0, 600);
      //color
      float chromr1=random(0, 255);
      float chromg1=random(0, 255);
      float chromb1=random(0, 255);
      float tran1=random(0, 255);
      noStroke();
      fill(chromr1, chromg1, chromb1, tran1);
      quad (rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4);
      doIt = false;
    }
    for (int b=10; b<=600; b+=250) {
      //size
      float x1 = random(0, 600);
      float y1 = random(0, 600);
      float x2 = random(0, 600);
      float y2 = random(0, 600);
      float x3 = random(0, 600);
      float y3 = random(0, 600);
      stroke(1);
      strokeWeight(1);
      noFill();
      triangle(x1,y1,x2,y2,x3,y3);
      doIt = false;
    }
  }
}
void mousePressed() {
  doIt = true;
}

