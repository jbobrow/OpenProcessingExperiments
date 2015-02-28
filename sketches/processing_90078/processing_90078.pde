
float ballX = 100;
float ballY = 0;
float h = 50;
int r,g,b;

//create a variable for speed
float speedY = 2;
 
void setup() {
  size(400,400);
  smooth();
  noStroke();
  r = 100;
  g = 100;
  b = 100;
  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
  if(keyPressed) {
    keyPressed();
  }
 
}
 
void draw() {
  //clear the background and set the fill colour
  background(255);
  fill(r,g,b);
   
  //draw the circle in it's current position
  ellipse(ballX, ballY, h,h);
  
  //add a little gravity to the speed
  speedY = speedY + 0.5; 
   
  //add speed to the ball's
  ballY = ballY + speedY;
   
   
  if (ballY > height - h) {
    // set the position to be on the floor
    ballY = height - h;
    // and make the y speed 90% of what it was,
    // but in the opposite direction
    speedY = speedY * -0.9;
     
    //switch the direction
    //speedY = speedY;
  }
  else if (ballY <= 0) {
    // if the ball hits the top,
    // make it bounce off
    speedY = -speedY;
  }

}
void mousePressed() {
  //redo the bounce
  ballX = mouseX;
  ballY = mouseY;
  h = 50;
}
void keyPressed() {
  println(key);
  if(key == 'a') {
    r = mouseY;
    g = b;
    b = b + mouseY;    
  
  if(r > 255) {
    r = 255;
  }
  
  if(g > 255) {
    g = 255;
  }
  
  if(b > 255) {
    b = 255;
  }
  
  if(r < 0) {
    r = 0;
  }
  
  if(g > 0) {
    g = 255;
  }
  
  if(b > 0) {
    b = 0;
  }
  println(r);
  println(g);
  println(b);
  println("=============");
  }
  
 
  else if(key == 'w') {
    speedY = random(5);
  }
}



