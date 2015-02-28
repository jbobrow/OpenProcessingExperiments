
float lastax = random(500);
float lastay = random(400);
PFont font;
int opacity = 0;
int direction = 1;

void setup() {
  size(500,400);
  background(#FFFFFF);
  font = loadFont("EucrosiaUPC-48.vlw");
  textFont(font);
  smooth();
}

void draw(){
  
  noStroke();
  fill(#FFFFFF, 30);
  rect(0,0, width, height);
  noFill();
  
  float ax = random(500);
  float ay = random(400);
  float bx = random(500);
  float by = random(400);
  float cx = random(500);
  float cy = random(400);
  float dx = random(500);
  float dy = random(400);
  float ex = random(500);
  float ey = random(400);  
  float fx = random(500);
  float fy = random(400);
  float gx = random(500);
  float gy = random(400);
 
  PImage img;

  img = loadImage("workaholic.png");
  image(img, ax, ay, 60, 25);
  stroke(#037ead);
  line(ax+30, ay+12, bx+20, by+10);
   
  img = loadImage("busy.png");
  image(img, bx, by, 40, 20);
  stroke(#029c23);
  line(bx+20, by+10, cx+20, cy+10);

  img = loadImage("stressed.png");
  image(img, cx, cy, 40, 20);
  stroke(#fd081f);
  line(cx+20, cy+10, dx+20, dy+10);

  img = loadImage("tense.png");
  image(img, dx, dy, 40, 20);
  stroke(#7902d5);
  line(dx+20, dy+10, ex+10, ey+10);

  img = loadImage("sorority.png");
  image(img, ex, ey, 20, 20);
  stroke(#fd05b4);
  line(ex+10, ey+10, fx+20, fy+10);

  img = loadImage("double.png");
  image(img, fx, fy, 40, 20);
  stroke(#fd8005);
  line(fx+20, fy+10, gx+10, gy+10);

  img = loadImage("work.png");
  image(img, gx, gy, 60, 25);
  stroke(#1c05fd);
  line(gx+30, gy+12, lastax, lastay);
  
  lastax = ax+30;
  lastay = ay+12;
  
  opacity += 1 * direction;
  if((opacity < 0) || (opacity > 255)){
    direction = direction;
  }
  fill(0, opacity);
  text("RELAXED", 170, 200);
}


