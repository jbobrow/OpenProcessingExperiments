
float point = 0;
float size = 200;
float x = 400;
float y = 400;
color text = color(random(0, 255), random(0, 255), random(0, 255));
color ball;
float timetoclick = 120;
float time = timetoclick;
boolean alive = true;
float best = 0;


void setup() {
  size(800, 800);
  frameRate(60);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(64);
  ball = randomcolor();
  smooth(4);
}

void draw() {
  background(255);
  if (alive) {
    strokeWeight(12.0);
    if (point==0) {
      fill(ball);
      stroke(0);
      ellipse(x, y, 250, 250);
      fill(text);
      text("START", x, y);
      if (point_distance(x, y, mouseX, mouseY)<=150) {
        point += 100;
        jumprandom();
      }
    } 
    else {
      time--;
      strokeWeight(12.0);
      fill(ball);
      ellipse(x, y, size, size); 
      noFill();
      stroke(0);
      strokeWeight(6.0);
      ellipse(x, y, size+time*3, size+time*3);
      if (point_distance(x, y, mouseX, mouseY)<=size/2) {
        point += 100+time;
        size -= 3;
        jumprandom();
        timetoclick-=2;
        time = timetoclick;
      }
      fill(0);
      text(round(time), x, y);
    }
    if (time <= 0) {
      if (point > best) {
        best = point;
      }
      while (point_distance (x, y, mouseX, mouseY)<300) {
        jumprandom();
      }
      alive=false;
    }
    hud();
  } 
  else {
    deadhud();
  }
}



void deadhud() {
  fill(ball);
  strokeWeight(12.0);
  stroke(0);
  ellipse(x, y, size, size); 
  noFill();
  stroke(randomcolor());
  strokeWeight(6.0);
  ellipse(x, y, size+80, size+80);
  fill(0);
  text("RESTART", x, y);

  fill (0, 0, 0, 120);
  text("Final score: "+round(point), width/2, 60);
  text("Best score: "+round(best), width/2, 150);
  if (point_distance(x, y, mouseX, mouseY)<=size/2) {
    restart();
  }
}

void restart () {
  point = 0;
  size = 200;
  x = 300;
  y = 300;
  text = color(random(0, 255), random(0, 255), random(0, 255));
  timetoclick = 120;
  time = timetoclick;
  alive = true;
}

void hud () {
  fill(0, 0, 0, 120);
  text(round(point), width/2, 30);
}

void jumprandom() {
  x = random(0, width);
  y = random(0, height);
  ball = randomcolor();
}

color randomcolor() {
  color randomc = color(random(0, 255), random(0, 255), random(0, 255));
  return randomc;
}

float point_distance(float x1, float y1, float x2, float y2) {
  float dis = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return dis;
}



