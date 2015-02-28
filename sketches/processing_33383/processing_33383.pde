
float xpos, ypos;
float xspeed, yspeed;
int xdirection, ydirection;
PImage bg;

void setup() {
  size (800, 800);
  frameRate(30);

  xpos=width/3;
  ypos=height/2;
  xspeed=2;
  yspeed=2;
  xdirection=1;
  ydirection=1;
  noStroke();
}

void draw() {
  background(150);
  PImage b;
  b = loadImage("plaid.jpg");
  background(b);

  ellipse(xpos, ypos, 20, 20);
  xpos+=xspeed*xdirection;
  println(xpos + ", "+ypos);

  if (xpos >=width || xpos<=0) {
    xdirection*=-1;
    fill(random(255), random(255), random(255));
  }

  ypos+=yspeed*ydirection;
  println(ypos + ", " +ypos);

  if (ypos >=width || ypos<=0) {
    ydirection*=-1;
    fill(random(255), random(255), random(255));
  }
}


