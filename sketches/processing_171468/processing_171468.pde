

//alter this variable to change the canvas size (does not work in JavaScript)
int sizeTimes=2;

//frameRate stuff
int num = 60;

int circX1, circX2, circY;
float secRad;
float minRad;
float hourRad;
float clockDiam;

float fr;

float sFake;
float mFake;
float hFake;

void setup() {
  size(1000, 500);
  stroke(0);

  int radius = min(width, height) / 4;
  secRad = radius * 0.72;
  minRad = radius * 0.60;
  hourRad = radius * 0.50;
  clockDiam = radius * 1.8;

  circX1 = width / 5;
  circX2 = width*4 / 5;
  circY = height / 2;

  sFake = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  mFake = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  hFake = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
}

void draw() {
  background(255);
  //the frameRate is equal to num
  frameRate(num);
  textSize(25*sizeTimes);
  //guestimate for simulating time in processing
  if (num<75){
  fr+=.017;
  }
  if (num>=75){
    fr+=.017*sq(sq(num/75));
  }
  // Draw the clock background
  fill(0);
  noStroke();
  ellipse(circX1, circY, clockDiam, clockDiam);
  //complicated clock stuff that I semi-understand
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  //simulated frame rate clock stuff; based on frame rate
  float s2 = map(fr, 0, 60, 0, TWO_PI) +sFake;
  float m2 = map(fr/60 + norm(fr, 0, 60), 0, 60, 0, TWO_PI) + mFake; 
  float h2 = map(fr/360 + norm(fr/60, 0, 60), 0, 24, 0, TWO_PI * 2) +hFake;


  // Clock hand
  stroke(100);
  strokeWeight(1);
  line(circX1, circY, circX1 + cos(s) * secRad, circY + sin(s) * secRad);
  strokeWeight(2);
  line(circX1, circY, circX1 + cos(m) * minRad, circY + sin(m) * minRad);
  strokeWeight(4);
  line(circX1, circY, circX1 + cos(h) * hourRad, circY + sin(h) * hourRad);

  // Minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = circX1 + cos(angle) * secRad;
    float y = circY + sin(angle) * secRad;
    vertex(x, y);
  }
  endShape();

  //clock2
  fill(0);
  noStroke();
  rect(width/2, 0, width, height);
  fill(255);
  ellipse(circX2, circY, clockDiam, clockDiam);

  // Clock Hand2
  stroke(100);
  strokeWeight(1);
  line(circX2, circY, circX2 + cos(s2) * secRad, circY + sin(s2) * secRad);
  strokeWeight(2);
  line(circX2, circY, circX2 + cos(m2) * minRad, circY + sin(m2) * minRad);
  strokeWeight(4);
  line(circX2, circY, circX2 + cos(h2) * hourRad, circY + sin(h2) * hourRad);

  // Minute Hand2
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = circX2 + cos(angle) * secRad;
    float y = circY + sin(angle) * secRad;
    vertex(x, y);
  }
  endShape();

  //draw hud stuff
  fill(75);
  //textMode(CENTER);
  noStroke();
  rect(0, 0, width, height/5);
  rect(0, height*4/5, width, height);
  if (num<80) {
    fill(int(255-(num*255/80)), 255, 255);
  } 
  if (num>=80 && num<140) {
    fill(0, int(255-((num-80)*255/60)), 255);
  } 
  if (num>=140 && num<255) {
    fill(0, 0, int(255-((num-140)*255/115)));
  }
  if (num>=255) {
    fill(0, 0, 0);
  }
  text("Frame Rate:" + num, width/3, height*10/11);
  text("Time Clock", width/11, height/10);
  text("Frame Rate Clock", width*5/9, height/10);
}
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      if (num <255) {
        num = num + 1;
      }
    }
    if (keyCode == DOWN) {
      if (num != 1) {
        num = num - 1;
      }
    }
  }
}



