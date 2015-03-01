
//variables
int x=100;
int y=20;

int r=40;
int vx=2; //velocitat X
int vy=3; //velocitat Y

void setup() {
  size(600, 600);
  smooth();
  frameRate (200);
  colormode(HSB)
}

void draw() {
  background(100,mouseY,255);

  fill(mouseX,200,255);
  ellipse(x, y, r, r);
rect(x,y,r,r);
  //actualitzacio posicions
  y = y + vy;
  x = x + vx;

  //moviment

  //limits-posicio X
  if ((x>width-r/2)||(x<r/2)) {
    vx = -vx;
  }

  //limits-posicio Y
  if ((y>height-r/2)||(y<r/2)) {
    vy = -vy;
  }
}

