
void setup() {
  size(640, 360); // background size
  noStroke(); //No border for shapes  drawn
  rectMode(CENTER); //draws rect according to the center point
}

void draw() {   
  background(0); //redraws a background so there's only 2 rect at a time
  if (mouseY < 180) {
    fill(0, 255, 0); //colors the square to green if our mouse is on the top half of the background
    greensq();
  } else {
    fill(0, 0, 255); //colors the same square blue if our mouse is on the bottom half of the background
    greensq();
  }
  if (mouseX > 320) {
    fill(255, 0, 0); //colors other square red if our mouse is on the right half of the background
    redsq();
  } else {
    fill(255); //colors other square white if our mouse is on the left half of the background
    redsq();
  }
}

void greensq() {
  int inverseX = width-mouseX;  //X point of this rect
  int inverseY = height-mouseY; //Y point of this rect
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10); //rect dimensions changes as we move our mouse up, down, left and right
}
 
void redsq() {
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10); //rect dimensions changes as we move our mouse up, down, left and right
}



