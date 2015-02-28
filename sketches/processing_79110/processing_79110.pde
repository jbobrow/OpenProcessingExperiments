
int dropperX = 0; //value for the dropper moving side to side
int dropperSpeed = 1; //speed of the dropper
float ballX; //balls position on X axis
float ballY; //balls position on Y axis
float ballSpeed = 0; //initial ball speed
float gravity = 0.1; //value of increments simulating gravity

void setup() { //sets up the sketch
  size (400, 400); //the size of the sketch window
  smooth(); //makes lines render smoothly
}

void draw() { //set up what will be drawn
  background(40, 100, 200); //set background colour to a blue
  rectMode(CENTER); //sets rectangle to be drawn from it's centre.
  rect(dropperX, 0, 50, 20); //draws a rectangle at the top of the sketch (the dropper)
  fill (0,150,50); //sets dropper and ball to green 
  
  
  dropperX = dropperX + dropperSpeed; //moves the dropper across the screen


  if ((dropperX > width-10) || (dropperX < 0)) { //sets the boundaries of the dropper
    dropperSpeed *= -1;
  }

  if (mousePressed == true) { //looks to see if the user presses the mouse

    println ("Mouse Pressed"); //Prints confirmation of the mouse being pressed
    

    ellipse(dropperX, ballY, 20, 20); //draws the ball

    ballY = ballY + ballSpeed; //makes the ball fall

    ballSpeed = ballSpeed + gravity;  //sets the speed of the falling ball, increasing it's speed exponentially

    if (ballY > height-10) { //ensures the ball doesn't bounce off the sketch, and bounce and falls convincingly
      ballY = height-10;
      ballSpeed = ballSpeed * -0.70;
    } 
    else {


      if (keyPressed == true) { //when a key is pressed it resets the values of the dropper and ball back to the start
        ballX = 0;
        ballY = 0;
        dropperX = 0;
      }
    }
  }
}


