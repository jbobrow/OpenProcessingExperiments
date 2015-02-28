
// IN AND OUT 
//FLUX TUNNEL
//HIT ESC TO EXIT
float ball = 0;
float toggle = 1;

void setup() {
smooth();
frameRate(120);
size(600, 400);
noCursor();
background(0);
}

void draw() {
  noStroke();
  fill(random (255), random(255), random(255));
  ellipse (width/2, height/2, ball, ball); 
  if (toggle == 1) { 
    ball = ball + 3;
    if (ball >= 800) 
    toggle = 2;
  }
  if (toggle == 2) { 
    ball = ball - 3; 
    if (ball <= 1) 
     toggle = 1;
    }
  }
