
//Xia, Huang-jing
//541009408@qq.com
//Flowering flowers
//Flowers surrounded 
//They have different color and size, shining and beautiful
//Click mouse to clean background
//reference: from "Anita Chen."




float maxDistance;

void setup() {
  size(600, 500);
  background(255);
  smooth();
  frameRate(3);
  //noLoop();
  maxDistance = dist(0, 0, width/2, height/2);
}

void draw() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  flower();
  //flower2();
}

void flower() {
  noFill();
  strokeWeight(0.5);
  color strokeCol=color(random(255), random(255));
  stroke(strokeCol);
  int n=50;
  int n2=n/2;
  for (int i = 0; i <= width; i += n ) {
    for (int j = 0; j <= height; j += n) {
      float mouseDist = dist(mouseX, mouseY, i, j);
      float diameter = (mouseDist / maxDistance) * 50;
      float radius=diameter /2;
      int centX=i+int(random(-n2, n2));
      int centY=j+int(random(-n2, n2));
      float x, y;
      float radiusNoise=random(10);
      int startangle=int(random(360));
      int endangle=720+int(random(720));
      int anglestep=1+int (random(3));
      fill(random(255), random(155));

      beginShape();
      for (float ang=startangle;ang<=endangle; ang+=anglestep) {
        radiusNoise+=0.05;
        radius-=0.02;
        float thisRadius=radius+(noise(radiusNoise)*15);
        float rad=radians(ang);
        x=centX+(thisRadius*cos(rad));
        y=centY+(thisRadius*sin(rad));
        curveVertex(x, y);

        strokeWeight(0);
        line(centX, centY, x, y);
        strokeWeight(0.5);

        for (int p = 0; p<100; p++) {                                         
          float lastx = -999;
          float lasty = -999;
          stroke(random(200), 80);



          if (lastx > -999) {
            line(x, y, lastx, lasty);
          }
          lastx = x;
          lasty = y;
        }
      }

      endShape();
    }
  }
}

void clearBackground() {
  background(0);
}

void mousePressed() {

  clearBackground();
}



