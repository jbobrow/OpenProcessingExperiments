
//These numbers store the position of a sort of
//virtual pen, representing where we will draw
//something each frame.
float penX, penY;

//This is how "fast" the pen will move, i.e. how
//far it moves across the canvas in each frame.
float xSpeed;

//This is how big to draw the ball.
float ellipseWidth, ellipseHeight;

void setup() {
  size(300, 300);
  background(128,128,128);
  fill(230,230,230);
  penX = 0;
  penY = 150;
  xSpeed = 2;
  ellipseWidth = 30;
  ellipseHeight = 30;
}

void draw() {
  //This line moves the "pen". With the randomness,
  //it will move somewhere between 2 and 10 pixels.
  penX += xSpeed + random(0,8);
  ellipse(penX, penY, ellipseWidth, ellipseHeight);
}




