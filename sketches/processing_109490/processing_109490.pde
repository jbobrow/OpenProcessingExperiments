
int xspd = 1;
int yspd = 3;
int x = 10;
int y = 20;

void setup() {
  size(720, 400);
}

void draw() {
  background(0);
  x = x + xspd;
  y = y + yspd;
  /*if(y > height || y < 0){
   yspd = -yspd;
   }
   else if(x > width || x < 0){
   xspd = -xspd;
   }
   */
  if (y > height) {
    yspd = -yspd;
  }
  else if (y < 0) {
    yspd = -yspd;
  }

  else if (x> width) {
    xspd = -xspd;
  }

  else if (x< 0) {
    xspd = -xspd;
  }

  ellipse(x, y, mouseX/2, mouseY/2);
}
