

int x1 = 100;
int y1 = 200;
int x2 = 100;
int y2 = 200;
int speedX=1;
int speedY=2;
int speedX1 =5;
int speedY1 = 3;
int c=30;

 
void setup() {
  size(500, 500);
  smooth();
}
  
void draw() {
  fill(255,2);
  rect(0,0,500,500);

  if (x1>=width || x1<0) {
    speedX1 = speedX1 * -1;
  }
  if ((x1< x2+5) && (x1> x2)&& (y1< y2+6) && (y1> y2)) {
    speedX1 = speedX1 * -1;
  }
  if (x2>=width || x2<0) {
    speedX = speedX * -1;
  }
  if ( y1>=height || y1<0) {
    speedY1=speedY1 *-1;
  }
  if ( y2>=height || y2<0) {
    speedY=speedY *-1;
  }
  fill(255);
  ellipse(x2,y2,c/-2,c/-2);
  fill(0);
  ellipse (x1, y1, c, c);
  x1=x1+speedX1;
  y1=y1+speedY1;
  x2=x2+speedX;
  y2=y2+speedY;
  if (mousePressed && mouseButton==LEFT) {
    speedX1 =speedX1+1;
    speedY =speedY+1;
    c++;
  }
  if (mousePressed && mouseButton==RIGHT) {
    speedY1=speedY1+1;
    speedX =speedX+1;
    c--;
  }

 
 
}

