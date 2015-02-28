
SinWave sinWave;
SinWave[] sinWaves = new SinWave[50];
color[] colorOptions = {
  color(242, 242, 242, 100), color(5, 175, 242, 100), color(5, 199, 242, 100), color(5, 219, 242, 100), color(89, 75, 70, 100)
}; 

void setup() {
  size(860, 480);
  //size(displayWidth, displayHeight, OPENGL);
  frameRate(60);
  rectMode(CENTER);
  smooth();
  noCursor();

  for (int i = 0; i < sinWaves.length; i++) {
    sinWaves[i] = new SinWave(colorOptions[1], random(1, 100), random(0, 3), random(-width, 0), random(2, 8));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < sinWaves.length; i++) { 
    sinWaves[i].updateWave();
  }

  pushMatrix(); 
  translate(0, height/2);

  for (int i=0; i<sinWaves.length; i++) {

    PVector point0 = (PVector) sinWaves[i].wavePoint; 
    beginShape(TRIANGLE_STRIP);
   
    for (int c=0; c<sinWaves.length; c++) {
      PVector point1 = (PVector) sinWaves[c].wavePoint;

      if (dist(point0.x, point0.y, point1.x, point1.y) < 100) { 
        noStroke();
        //stroke(255, 255, 255, map(dist(point0.x, point0.y, point1.x, point1.y), 0, 100, 100, 0));
        fill(colorOptions[1], map(dist(point0.x, point0.y, point1.x, point1.y), 0, 100, 250, 0));
        //stroke(255);
        vertex(point0.x, point0.y);
        vertex(point1.x, point1.y);
      }
    }

    endShape(CLOSE);
  }
  
  for (int i=0; i<sinWaves.length; i++) {

    PVector point0 = (PVector) sinWaves[i].wavePoint; 

    for (int c=0; c<sinWaves.length; c++) {
      PVector point1 = (PVector) sinWaves[c].wavePoint;

      if (dist(point0.x, point0.y, point1.x, point1.y) < 100) { 
        stroke(colorOptions[2], map(dist(point0.x, point0.y, point1.x, point1.y), 0, 100, 255, 0));
        //stroke(255);
        line(point0.x, point0.y, point1.x, point1.y);
      }
    }
  }
  popMatrix();
}

class SinWave {

  float theta = 0;
  PVector wavePoint;
  float myY;
  float myX;
  float c;
  float speed;

  SinWave(color tempC, float startAngle, float startSpeed, float startX, float startY) {
    theta = startAngle;
    myY = startY;
    myX = startX;
    c = tempC;
    speed = startSpeed;
  }

  void updateWave() {
    theta += 0.02;
    fill(c);
    noStroke();

    float angle = theta;
    float y = sin(angle)*height/myY;
    myX = myX+speed; 
    wavePoint = new PVector(myX, y);

    //point(wavePoint.x, wavePoint.y);
    ellipse(wavePoint.x, wavePoint.y + height/2, 2, 2);

    if (wavePoint.x > width) {
      theta = random(-width, 0);
      myX = 0;
    }
  }
}

