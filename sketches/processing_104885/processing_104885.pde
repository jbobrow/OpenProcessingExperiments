
// declaration of variables
float xPos; // x position of the ball
float yPos; // y position of the ball
float speed; 
float gravity;

// set up function
void setup() {
  size(200, 600); 
  background(0); 
  xPos = 100;
  yPos = 0;
  speed = 0;
  gravity = 0.6;
}

// draw function
void draw() {

  //display ball
  background(0);
  fill(255);
  ellipse(xPos, yPos, 60, 60);

  //display ground
  fill(255);
  noStroke();
  rect(0, 530, 200, 200);

  // Site from www.learningprocessing.com
  yPos = yPos + speed;
  speed = speed + gravity;
  
  // Condition to make the ball stop
  if ( speed < 0.65 && yPos > height-99.5) {
    println("bottom");
    speed = 0;
    gravity = 0;
  }
  else if (yPos > height-99.5) {
    println(speed);
    speed = speed * -0.65;
    println("Change Direction");
  } 
  
}



