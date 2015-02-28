
float l = 60;
float m =440;
int radius = 45;
int bodyHeight = 240;
int neckHeight = 50;

float easing = 0.02;

void setup() {
  size(720, 480);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

void draw() {
  
  int targetX = mouseX;
  l += (targetX - l) * easing;
  
  if (mousePressed) {
    neckHeight = 80;
    bodyHeight = 300;
  } else {
    neckHeight = 50;
    bodyHeight = 240;
  }
  
  float nm = m - bodyHeight - neckHeight - radius;
  
  background (204);


int a = 460;
int b = 40;

//Head
fill(128);
int x = 100;
int y = 200;
rect(340, 100, y, x+20);
fill(0);
ellipse(2*y+50, 150, 10, 10);
ellipse(400, 150, 10, 10);
line(x+y+40, 100, 310, 60);
line(440, 100, 460, 60);
fill(0);
arc(2*y+x/2, 170, b+40, 40, radians(0), radians(180));


//Neck
fill(255);
rect(360, 220, neckHeight, 50);

//Body
fill(0);
rect(300, 260, bodyHeight, 150);

//Legs
fill(128);
rect(310, 410, 20, 40);
rect(360, 410, 20, 40);
rect(410, 410, 20, 40);
rect(460, 410, 20, 40);

//Feet
fill(255);
ellipse(320, a, b, b);
ellipse(370, a, b, b);
ellipse(420, a, b, b);
ellipse(470, a, b, b);
}

