
float x = 60;
float y = 440;
int radius = 45;
int bodyHeight = 220;
int orangeHeight = 170;
int w = 3;

float easing = 0.02;

void setup() {

size(700, 500);
smooth();
background(154,234,133);
ellipseMode(RADIUS);
}

void draw() {
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed) {
    orangeHeight = 100;
    bodyHeight = 170;
    w = 9;
  } else {
    orangeHeight = 170;
    bodyHeight = 220;
    w = 3;
  }
  
  float ny = y - bodyHeight - orangeHeight - radius;
  
  background(154,234,133);
  
// antenna
strokeWeight(3);
fill(0);
line(230,140,180,30);
ellipse(180,30,w,w);
line(230,140,210,18);
ellipse(210,18,w,w);

// body
int b = 200;
noStroke();
fill(245,250,114);
rect(b,150,180,bodyHeight);
noStroke();
fill(250);
rect(b,160,180,10);
noStroke();
fill(250,80,20);
rect(b + 20,175,20,orangeHeight);

// body deco
noStroke();
fill(250,30,126);
ellipse(b + 150,250,20,20);
rect(b + 100,248,50,5);

//head
noStroke();
fill(0,26,100);
arc(290,145,90,95,PI,TWO_PI);

fill(250);
int c = 30;
rect(b + 90,100,c,c+5);

fill(0);
ellipse(305,117,13,13);

// base
noStroke();
fill(242,64,64);
arc(b + 90,370,30,30,0,PI);
}

