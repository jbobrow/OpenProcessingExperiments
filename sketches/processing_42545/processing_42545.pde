
int x=200;
int y=150;
int speedX=5;
int speedY=4;

int a=200;
int b=100;
int speedA=3;
int speedB=4;

int z=200;
int t=150;
int speedT=2;
int speedZ=3;

float d=20;

void setup() {
  size(400, 300);
  noStroke();
}


///////////////////////////////////
void draw() {
  rectMode(CENTER);

  background (200,205,155);
  fill (120, 180, 140);

  //rec1 movement
  if (x > width - d/2 || x < d/2) {
    speedX = speedX *- 1;
  }

  if (y > height - d/2 || y < d/2) {
    speedY=speedY*-1;
  }
  fill(90,165,215);
  rect(x, y, d, d);

  //rec2 movement
  if (t > width - d/2 || t < d/2) {
    speedT=speedT*-1;
  }
  if (z > height - d/2 || z < d/2) {
    speedZ=speedZ*-1;
  }
  fill(80,140,175);
  rect(t, z, d, d);

  
  //rec3 movement
   if (a > width - d/2 || a < d/2) {
   speedA = speedA*-1;
   }
   if (b > height - d/2 || b < d/2) {
   speedB = speedB*-1;
   }
   fill(25,110,160 );
   rect(a, b, d, d);
   
  // verify that the rectangles are on the stage and prevent them from sticking on the edge
  if (x < width - d/2 && x > d/2 && y < height - d/2 && y > d/2 && 
      t < width - d/2 && t > d/2 && z < height - d/2 && z > d/2 &&
      a < width - d/2 && a > d/2 && b < height - d/2 && b > d/2) {

    //IF mouse pressed
    if (mousePressed && (mouseButton==LEFT)) {
      d = d + 1;
    }
  }

  if (mousePressed && (mouseButton==RIGHT)) {
    // check that d will not turn negative
    if(d > 1)
      d = d - 1;
  }

  // IF key pressed
  // mac user need to make right click to press ctrl (keyCode == 17) and the mouse
  if (keyPressed && keyCode != 17) {
    t=t+speedT*2;
    z=z+speedZ*2;
    x=x+speedX*2;
    y=y+speedY*2;
    a=a+speedA*2;
    b=b+speedB*2;
  }

  // speed 
  t=t+speedT;
  z=z+speedZ;
  x=x+speedX;
  y=y+speedY;
  a=a+speedA;
  b=b+speedB;
}


