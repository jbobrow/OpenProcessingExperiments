
//draw an eye on the screen. use the arrow keys to move the eye on the screen. Use mouseClicks to increase the speed at which the eye moves.

int x;
int y;
int diameter = 50;
int speed = 1;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
}

void draw() {
  background(255);
  drawEye();
}

void keyPressed(){
  if(key == CODED) { // use the arrow keys to move the eye around
    if(keyCode == UP){
       moveUp(); 
    }
    else if(keyCode == DOWN){
       moveDown();
    }
    else if(keyCode == RIGHT) {
      moveRight();
    }
    else if(keyCode == LEFT) {
      moveLeft();
    }
  }
  else{}
}

void mouseClicked() { // use mouse clicks to keep track of the speed
  speed++;
}
void drawEye(){
  fill(0);
  ellipse(x, y, diameter, diameter);
  fill(255);
  ellipse(x, y, diameter, diameter-10);
  fill(0);
  ellipse(x, y, diameter/2, diameter/2);
}

void moveUp(){
  
  if(y < 0){ //if off screen do nothing
  }
  else { //if on screen move up
    y= y - speed;
  }
}

void moveDown() {
  if(y > height){ // if off screen do nothing
  }
  else{ // if on screen move down
    y= y+ speed;
  }
}

void moveRight() {
  if(x>width){//if off screen do nothing
  }
  else { //if on screen move right
    x = x+ speed;
  }
}

void moveLeft() {
  if(x<0) { //if off screen do nothing
  }
  else{
    x = x - speed; //if on screen move left
  }
}


