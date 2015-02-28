
float theta = 0;
int radius = 80;
float x, y, centerX, centerY;
float bx, by;
float speed;


void setup() {
  size(400, 400);
  bx=x;
  by=y;
  centerX = width/2;
  centerY = height/2;
  smooth();


  speed = .05;
}

void draw() {
  background(100);

 
  stroke(255);
  strokeWeight(10);

  line(x, y, 0, 200);
  line(x,y,200,0);
  line(x,y,400,200);
   line(x,y,200,400);


x = cos(theta) * radius +200;
y = sin(theta) * radius +200;
noStroke();
fill(255);
ellipse(x, y, 50, 50);
theta = theta + speed;

}


