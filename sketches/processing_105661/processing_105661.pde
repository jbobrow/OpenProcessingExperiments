
void setup() {
  size(400, 400);
  // set background color to white
  background(255);
}

int dx = 2;
int dy = 3;

int x = 50;
int y = 50;

int paddleY = 50;


void draw() {

  //pong rect
  fill(255);
  background(255);
  

  for (int i=0; i<1; i++) {
    fill(6,255,6);
    rect(x, y+ i, 25, 25, 5);
    
    
  }

  x = x + dx;
  y = y + dy;

  if ( x < 25 || x > 380) {
    dx = -1 * dx;
  }
  if ( y < 0 || y > 360) {
    dy = -1 * dy;
  }


  //making the paddle
  if (keyPressed) {
    if (key == 'w'&& paddleY > 0) {
      paddleY -= 5;
    }
  
    if (key == 's'&& paddleY <340) {
      paddleY += 5;
    }  
  }
  fill(1,1,1);
  rect(5, paddleY, 25,55);
  

}

