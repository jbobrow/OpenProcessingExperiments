
//moving a small square allong the edges of a screen!!

int x=0;//x location of square
int y=0;//y ocation of square

int speed = 5; //speed of square
int state = 0; //variable keeping track of squares 'state'-depending on the state it will move either up,down,left or right

void setup () {
  size (200,200);
}
void draw () {
  background (100);
  
  //display the square
  noStroke();
  fill(255);
  rect(x,y,10,10);
  
  if (state == 0) {
    x = x+ speed;
    if (x > width - 10) {
      x = width - 10;
      state = 1;
    }
  } else if (state == 1) {
    y = y +speed;
  if (y > height - 10) {
    y = height - 10;
    state = 2;
  }
  } else if (state == 2) { 
    x = x- speed;
    if (x<0) {
      x = 0;
      state = 3;
    }
  }else if (state == 3) {
    y = y -speed;
    if (y<0) {
      y=0;
      state= 0;
    }
  }

}


