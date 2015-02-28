
int x = 0;
int y = 0;
int speed = 3;
PImage img;
PFont font;
float l = 60;
float m =440;
int radius = 45;
int neckHeight = 50;
int headHeight = 100;
float easing = 0.02;

void setup() {
  size (700, 480);
  smooth();
  strokeWeight(2);
  background(200);
  ellipseMode (RADIUS);
  img = loadImage ("desert2.jpg");
  font = loadFont ("Shlop-Regular-40.vlw");
  textFont (font);
}

void drawrobot() {
  //Head
fill(128);
rect(x+40, headHeight, 100, 120);
fill(0);
ellipse(x+60, headHeight+50, 10, 10);
ellipse(x+100, headHeight+50, 10, 10);
line(x+40, headHeight, x+10, headHeight-40);
line(x+140, headHeight, x+160, headHeight-40);
fill(0);
arc(x+90, headHeight+70, 40, 40, radians(0), radians(180));


//Neck
fill(255);
rect(x+60, headHeight+120, 20, neckHeight+20);

//Body
fill(0);
rect(x, 260, 200, 150);

//Legs
fill(128);
rect(x+10, 410, 20, 40);
rect(x+60, 410, 20, 40);
rect(x+110, 410, 20, 40);
rect(x+160, 410, 20, 40);

//Feet
fill(255);
ellipse(x+20, 460, 20, 20);
ellipse(x+70, 460, 20, 20);
ellipse(x+120, 460, 20, 20);
ellipse(x+170, 460, 20, 20);
}

void draw () {
  x = x + speed;
    if ((x>500) || (x<0)) {
    speed = speed *-1;
  }

  image (img, 0, 0);
  textSize (50);
  text ("desertbot", 500, 50);
  drawrobot();
  int targetX = mouseX;
  l += (targetX - l) * easing;
  
  if (mousePressed) {
    neckHeight = 80;
    headHeight = 50;
  } else {
    neckHeight = 50;
    headHeight = 100;
  }
}

