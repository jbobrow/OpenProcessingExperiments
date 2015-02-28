
//Alex Nelson

void setup() {
  size(300, 300);
}

void draw() {

//cite: if/else notes on moodle
 if (mouseY < height/(12/5)) {
   background(0);
   
  //center ball
  fill(0, 255, 255);
  ellipseMode(CENTER);
  ellipse(150, 150, 50+mouseY, 50);

  //top wall
  fill(255);
  rect(0, 0, 300, 0+mouseY);

  //bottom wall
  fill(255);
  rect(0, 300, 300, 0-mouseY);
}
  //ball explodes: screen becomes color of the ball
  else {
    background(0,255,255);
  }
}


