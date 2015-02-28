
int x = 0;
int y=0;

int x1 = 400;
int y1 = 400;

int speedX=1;
int speedY=2;

int speedX1 =1;
int speedY1 = 10;



void setup() {

  size(400, 400);
  smooth();
  background (0, 3);
}

void draw() {
  fill( 200, 100);
  rect(0, 0, width, height);
  if (dist(x1, y1, mouseX, mouseY) < 20) {

    fill (255, 0, 0);
  }
  else { 
    fill (255);
  }
  ellipse(mouseX, mouseY, 20, 20);

  if (x1>=width || x1<0) {
    speedX1 = speedX1 * -1;
  }


  if ( y1>=height || y1<0) {
    speedY1=speedY1 *-1;
  }

  ellipse (x1, y1, 5, 5);



  x1=x1+speedX1;
  y1=y1+speedY1;
}


