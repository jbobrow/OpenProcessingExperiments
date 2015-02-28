
//Global variables
//movement variables
int x = 0; //variable for the x direction
int y = 0; //variable for the y direction
int speedX = 5; //variable for the horezontal speed
int speedY = 1; //varable for the virtical speed
int gravity = 1; //variable for gravity

//interaction variables
boolean click = false; //variable for click
boolean pressed = false; //variable for key pressed
int xMouse; //variable to record the x click position
int yMouse; //variable to record the y click position

//setup
void setup() {
  size (500, 500); // sets the page size
  smooth(); //gives averything smooth edges 
}

//drawing
void draw() {
  background (255); //refreshes screen
  for (int i = 14; i < height; i = i+100) {
    strokeWeight (30);
    stroke(0, 120, 255);
    line (i, 0, i, height);
  }
  for (int i =2; i < width; i = i +200) {
    strokeWeight(6);
    stroke(0, 255, 120);
    line (0, i, width, i);
  } 
  
  speedY = speedY+gravity; //applies gravity
  x =x +speedX; //moves the robot horezontally
  y =y +speedY; //moves the robot virtically
  
  if (xMouse > 80 //ensured that the robot cannot be spawned/drawn outside the screen
  && xMouse  < width-80 
  && yMouse < height-30 
  && yMouse > 165 
  && pressed) { 
  
    spawnRobot(); //draws the robot
    
  //side boundaries
    if (x < 80 || x > width-80) { 
      speedX *= -1; //reverses polarity/direction
    }
    if (y < 165 || y > height-130) { //top and bottom boundaries
      speedY *= -1; //reverses direction
    } 
    if (y > height-130) { //constrain y to floor
      y = height-130;
    }
  } else {
    //reset movement variables
      x = 0; 
      y = 0; 
      speedX = 5; 
      speedY = 1; 
      gravity = 1; 
  } 
  
  if (pressed && click) { //lasers cannot be fired unless the robot has been spawned 
    drawLazer();
}
  drawCrosshairs(); //draws the crosshairs
}
  

void mousePressed() { //switches the state of "click" when the mouse is clicked
  click = !click;
  
}
  
void keyPressed() { 
  //switches thw state of 'pressed' when a key is pressed
  pressed = !pressed;
  click = false;
  //sets start position
  y = mouseY;
  x = mouseX;
  //records the mouse position on click
  xMouse = mouseX;
  yMouse = mouseY;
  
}

void drawCrosshairs() { //function to draw the crosshairs
  strokeWeight(2);
  stroke(255, 0, 0);
  noFill();
  ellipse (mouseX, mouseY, 25, 25);
  line (mouseX, mouseY-4, mouseX, mouseY- 18);
  line (mouseX, mouseY+4, mouseX, mouseY+ 18);
  line (mouseX-4, mouseY, mouseX- 18, mouseY);
  line (mouseX+4, mouseY, mouseX+ 18, mouseY);
}

void drawLazer() { //function to draw the lasers
  //left laser
  strokeWeight (6);
  stroke (255, 0, 0, 150);
  line (x-30, y-105, pmouseX-2, pmouseY);
  strokeWeight(2);
  stroke (255);
  line (x-30, y-105, pmouseX-2, pmouseY);
   //right laser
  stroke (255, 0, 0, 150);
  strokeWeight(6);
  line (x+30, y-105, pmouseX+2, pmouseY);
  stroke (255);
  strokeWeight(2);
  line (x+30, y-105, pmouseX+2, pmouseY);
}

void spawnRobot() { //function to draw the robot
 
//head
  fill (150); // sets the fill colour to medium grey
  stroke (0); // sets the outline to black
  strokeWeight (2); // sets the line width to 2px
  rectMode (CENTER); // sets the rect mode to center
  rect (x, y-95, 100, 75); // draws the main rectangle of the head
  rect (x-53, y-95, 6, 20); //draws the left side "ear"
  rect (x+53, y-95, 6, 20); //draws the right side "ear"
//face
  fill (0); //sets the mouth fill colour to black
  rect (x, y-75, 50, 10); // draws the mouth
  fill (255, 0, 0); // sets the eye fill colour to red
  ellipse (x-30, y-105, 20, 20); // draws the left eye
  ellipse (x+30, y-105, 20, 20); // draws the right eye
//antennae
  strokeWeight (4); // sets the line width to 4px
  line (x-10, y-134, x-30, y-165); //draws the left antennae 
  line (x+10, y-134, x+30, y-165); //draws the right antennae
//neck
  fill (100); //sets the fill colour to dark grey
  strokeWeight (2); //sets the line width to 2px
  rect (x, y-53, 50, 10); //draws the neck

//body
  fill (150); //sets the fill colour to medium grey
  rect (x, y, 80, 100); // draws the main body
  fill (170); // sets the fill colour to light grey
  rect (x, y-10, 60, 60); //draws the chest panel
  fill (255, 0, 0); // sets the fill colour to red
  ellipse (x-20, y+35, 10, 10); //draws the left red light
  ellipse (x, y+35, 10, 10); //draws ht e middle red light
  ellipse (x+20, y+35, 10, 10); //draws the right red light

//legs
  fill (100); //sets the fill colour to dark grey
  rect (x-20, y+75, 20, 50); //draws the left leg
  rect (x+20, y+75, 20, 50); //draws the right leg
  fill (150); //sets the fill colour to medium grey
  rect (x-20, y+105, 30, 10); //draws the left ankle
  rect (x+20, y+105, 30, 10); //draws the right ankle
  rect (x+22, y+120, 40, 20); //draws the left foot
  rect (x-22, y+120, 40, 20); //draws the right foot

//arms
  fill (100); //sets the fill colour to dark grey
  rect (x-55, y+5, 20, 100); //draws the left arm
  rect (x+55, y+5, 20, 100); //draws the rigth arm
  fill (170); //sets the fill colour to light grey
  triangle (x-40, y-45, x-40, y-25, x-80, y-45); //draws the left shoulder
  triangle (x+40, y-45, x+40, y-25, x+80, y-45); //draws the right shoulder
}


  


