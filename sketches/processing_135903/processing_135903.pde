
/* @pjs font="BLACKOAKSTD.otf"; */
PFont blackoak;
PFont times;
PFont arial;
float x = 0;
float myscale = 1;
float myscalespeed = 0.01;
float xspeed = 1;
float rad = 0;
boolean runOnce = false;

PImage dropshadow;
        
void setup()
{
  size(500,500);

  times = createFont("Times New Roman",32);
  arial = createFont("Arial",32);
  blackoak = createFont("Blackoak Std",32);
}


void draw()
{
  background(255);
  
  // draw drop shadow image in top corner and store it as image
  if (runOnce == false)
  {
    // make drop shadow not too black
    fill(128);
    textFont(blackoak);
    textAlign(LEFT, TOP);
    
    // offset by 5px
    text("Blackoak", 5, 5); 
    
    // blur the result a bit
    filter(BLUR, 2);
    
    // get takes a screenshot of the area from 0,0 to 400, 200
    // and stores it in a PImage variable "dropshadow"
    dropshadow = get(0, 0, 400, 200);
    
    // set runOnce to true so this only happens the first time we draw
    runOnce = true;
  }

  // draw red text
  textFont(blackoak);
  
  // we can store text in variables
  String s = "Blackoak";
  
  // textWidth gets the width our text is taking up (useful for formatting and collision)
  float widthOfBlackoak = textWidth(s);
  
  // bounce off left and right
  if (x > width - widthOfBlackoak)
  {
    xspeed = -1;
  }
  else if (x < 0)
  {
    xspeed = 1;
  }
  
  // move left or right depending on speed
  x += xspeed;
  
  // change the angle of rotation
  rad += 0.01;
  
  // draw the blurred drop shadow we saved behind the text
  image(dropshadow, x, 400);
  
  // draw the red text
  fill(255, 0, 0);
  textAlign(LEFT, TOP);
  text(s, x, 400);  
  
  
  // set fill to black
  fill(0);
  
  pushMatrix();
  
  // move the times text to 100, 100
  translate(100, 100);
  
  // rotate by the angle in rad
  rotate(rad);
  
  // set font to times
  textFont(times);
  
  textAlign(CENTER,TOP);
  textSize(32);
  text("THIS IS IN TIMES", 0, 0, 200, 400);
  popMatrix();
  
  
  // set font to arial
  textFont(arial);
  
  // change alignment
  textAlign(RIGHT);
  textSize(12);
  
  // scale up and down depending on myscalespeed
  myscale += myscalespeed;
  
  // if our scale is above 10 flip the speed to go back down and vice versa
  if (myscale > 10)
  {
    myscalespeed = -myscalespeed;
  }
  else if (myscale < 1)
  {
    myscalespeed = -myscalespeed;
  }

  
  pushMatrix();
  
  // move arial text to 200, 200
  translate(200, 200);
  
  // scale it by myscale
  scale(myscale);
  
  // set drop shadow color to black
  fill(0);
  text("THIS IS IN ARIAL", 0, 0);  
  
  // translate by -0.5 to offset green text
  translate(-0.5, -0.5);
  
  // set color to green
  fill(0,255,0);
  text("THIS IS IN ARIAL", 0, 0);
  
  popMatrix();

}
