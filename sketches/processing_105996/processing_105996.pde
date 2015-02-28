
int radius = 20;
int arraySize = 15;
float[] x = new float[arraySize];
float[] y = new float[arraySize];
float[] xSpeed = new float[arraySize];
float[] ySpeed = new float[arraySize];
float deceleration = 0.98;

color bg;
color[] ballColor = new int[arraySize];

// Stores which ball is being dragged
// Starts with a number, otherwise it would start with zero and the first one one be dragged
int draggingBall = -1;

void setup(){
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  
  bg = color(153, 60, 40);
  
  for(int i = 0; i < x.length; i ++){
    // Positioning the balls in random coordinates
    x[i] = int(random(0, width));
    y[i] = int(random(0, height));

    // Setting the same initial speed for every ball
    xSpeed[i] = 0;
    ySpeed[i] = 0;
    
    // Setting colors for each ball
    float hue = map(i, 0, x.length, 0, 360);
    ballColor[i] = color(hue, 100, 100);
  }
}

void mousePressed(){
  // Do the loop to check if any ball is being clicked
  for(int i = 0; i < x.length; i ++){
    // If the user clicks over one of the ball
    if(x[i] - radius < mouseX && mouseX < x[i] + radius  &&
       y[i] - radius  < mouseY && mouseY < y[i] + radius){
      
      // Sets this as the current square being dragged
      draggingBall = i;
      println(i);
    }
  }
}

void mouseReleased(){
  // Sets the distance from the mouse to the ball as the new speed
  xSpeed[draggingBall] = (x[draggingBall] - mouseX)/10;
  ySpeed[draggingBall] = (y[draggingBall] - mouseY)/10;
  // Releases the ball, resets the variable
  draggingBall = -1;
}

void drawBall(int i){
  
  // Detects collision to the walls
  if(x[i] - radius <= 0 || x[i] + radius >= width){
    xSpeed[i] = -xSpeed[i]; 
  }
  if(y[i] - radius <= 0 || y[i] + radius >= height){
    ySpeed[i] = -ySpeed[i]; 
  }
  
  // Checking collision
  // j is going to be the index for the other balls
  for(int j = 0; j < x.length; j ++){
    // Preventing it from checking the distance to itself
    if(i != j){
      // Checking if they overlap
      if( dist(x[i], y[i], x[j], y[j]) <= 2*radius){
        //int resultSpeed = (abs(xSpeed[i]) + abs(xSpeed[j]))/2;
        xSpeed[i] = -xSpeed[i];
        ySpeed[i] = -ySpeed[i];
        xSpeed[j] = -xSpeed[j];
        ySpeed[j] = -ySpeed[j];
      }
    }
  }
  
  // Draws the ball
  noStroke();
  // Shadow
  fill(0, 0, 0, 50);
  ellipse(x[i] - 0.5*radius, y[i], 2.5*radius, 2*radius);
  // Ball  
  fill(ballColor[i]);
  ellipse(x[i], y[i], 2*radius, 2*radius);
  
  // Draws the "speed" line
  if(i == draggingBall){
    stroke(0);
    line(mouseX, mouseY, x[i], y[i]);
  }
  
  // Always "moving" the balls, but sometimes the speed is 0
  x[i] += xSpeed[i];
  y[i] += ySpeed[i];  
  
  // Always decelerating as well
  xSpeed[i] *= deceleration;  
  ySpeed[i] *= deceleration;    
}

void draw(){
  background(bg);
  for(int i = 0; i < x.length; i ++){
    drawBall(i);
  }
}


