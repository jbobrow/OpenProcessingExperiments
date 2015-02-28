
int x = 80;
int speedX = 3;

int x2 = 0;
int speed = 5;

void setup() {
  size(600, 200);
  background(0);
  smooth();
}

void draw() {
  background(0);
  noStroke();
  fill(255, 0, 0);
  rect(x, height/2-8, 35, 16);
  fill(136, 236, 237);
  rect(x+20, height/2-7, 5, 14);
  rect(x+4, height/2-7, 3, 14);
  fill(80);
  rect(x+4, height/2-10, 3, 2);
  rect(x+25, height/2-10, 3, 2);
  rect(x+4, height/2+8, 3, 2);
  rect(x+25, height/2+8, 3, 2);

  fill(255, 255, 0);
  rect(x2, height/3-8, 35, 16);
  fill(136, 236, 237);
  rect(x2+20, height/3-7, 5, 14);
  rect(x2+4, height/3-7, 3, 14);
  fill(80);
  rect(x2+4, height/3-10, 3, 2);
  rect(x2+25, height/3-10, 3, 2);
  rect(x2+4, height/3+8, 3, 2);
  rect(x2+25, height/3+8, 3, 2);


  if (keyPressed == true && keyCode == RIGHT) {
    if (x >= width) {
      // reset to 0
      x= 0;
    }
    if (x2 >= width) {
      // reset to 0
      x2= 0;
    }
    x= x+speedX;
    x2= x2+speed;
  }
    if (keyPressed == true && keyCode == LEFT) {
   x= x-speedX;
   if(x<0){x=600;}
   }
}


