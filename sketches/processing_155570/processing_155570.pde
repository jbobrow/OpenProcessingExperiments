




Ball[] balls;
float totalCount = 31;
float ballsR = 12;
String[] data;
float margin = 200;

PFont Bnanum;
PFont Mnanum;
PFont Snanum;




void setup() {

  size(1200, 800);
  smooth();

  Bnanum = createFont("NanumGothic", 24);
  Mnanum = createFont("NanumGothic", 16);
  Snanum = createFont("NanumGothic", 12);

  data = loadStrings("police.csv");
  balls = new Ball[data.length];
}


void draw() {
  background(255);
  fill(0);
  textFont(Bnanum);
  text("Local crime and arrest", margin, margin);


  stroke(60);
  strokeWeight(.5);  
  line(margin, height-margin, width-margin+10, height-margin);
  line(width-margin+10, height-margin, width-margin+10, margin-10);

  fill(0);
  textFont(Snanum);
  text("0", margin, (height-margin)+20);
  text("occurance", width-margin, (height-margin)+20);

  text("arrest", width-margin + 20, margin);

  noStroke();

  float xMax;


  for (int i = 0; i < totalCount; i++) {

    float[] values = float(split(data[i], ","));
    String[] names = split(data[i], ",");

    balls[i] = new Ball(values[3], values[4]);





    float d = dist(mouseX, mouseY, balls[i].x, balls[i].y);
    if (d < ballsR) {
      fill(0, 80);
      textFont(Mnanum);
      text(names[0], balls[i].x + 15, balls[i].y);
      textFont(Snanum);
      text("arrest count : " + int(values[4]), balls[i].x + 32, balls[i].y+20);
      text("crime occurrence : " + int(values[3]), balls[i].x + 32, balls[i].y+35);

      fill(255, 0, 0, 80);
    } else {
      fill(0, 80);
    }

    balls[i].display();
  }
}


class Ball {

  float x, y;  
  float valueX, valueY;

  float firstY;

  float driftY = -1;
  float yPos = height;


  Ball(float valueX_, float valueY_) {

    valueX = valueX_;
    valueY = valueY_;

    x = mapXpoint(valueX);
    firstY = mapYpoint(valueY);
    y = firstY;

    println("firstY : " + firstY);
    //    y = yPos - firstY;
  }

  void display() {

    ellipse(x, y, ballsR, ballsR);

  }

  float mapXpoint(float valueXX) {
    return map(valueXX, 0, 3922, margin, width-margin);
  }
  float mapYpoint(float valueYY) {
    //    return map(valueYY, 0, 3416, margin, height-margin);
    return map(valueYY, 0, 3416, height-margin, margin);
  }
}



