

PFont f; //initialising font, "f" is simply short for font

float ballX = 200; //initial horizontal position of ball
float ballY = 0; //initial vertical position of ball
// how much to move the circle on each frame
float moveX = 2; //moves 2pixels per frame (if frameRate is 60 then it will move across 2 pixels per frame, 
float moveY = -2; //moves -2pixels per frame 

void setup() {                                  
  size(400, 400); //size of the sketch window                               
  
  f = createFont("Arial",12,true); //creating a font, giving the font a size and making it true/ready
}
                              
void draw() {
  background(255); //white background                    
  noStroke(); //no stroke
  smooth(); //smooth edges

  if (mouseX < 200 && mouseY < 200) {  //during writeup change 200 values to height/width. explain that this would automatically adjust if sketch size was changed
    background(200); //very pale grey colour   
    fill(255,200,100); //orange colour                          
    rect(0, 0, 200, 200); //starts the rectangle at 0,0 and is 200 by 200 pixels
    
    textFont(f,16); //using the font created in setup, changes font size to 16
    fill(255); //gives font a white colour
    text ("This",325,100); //the text in speech marks represents what will be displayed on the sketch. The text will be shown 325 across the x axis, 100 down the y axis
    fill(100,255,100); //green colour    
  }
   
  else if (mouseX > 100 && mouseY < 200) { //if the horizontal value of the mouse is more than 100pixels and the vertical value of the mouse is less than 200pixels, then do the following...
    background(150); //pale grey colour  
    fill(100,200,255); //blue colour                        
    rect(200, 0, 200, 200); // starts rectange 200pixels across (200,0) and is 200 by 200 pixels

    textFont(f,16); //uses font created
    fill(255); //white font colour
    text ("is",325,300); // same as before, this time with a different y value (to change where the text will be displayed)
    fill(255,200,100); //shade of red        
  }
 
  else if (mouseX < 200 && mouseY > 100) { //if the horizontal value of the mouse is less than 200pixels and the vertical value of the mouse is more than 100pixels, then do the following...
    background(50); //dark grey colour
    fill(100,255,100); //green colour                        
    rect(0, 200, 200, 200); //starts rectange 200pixels across (200,0) and is 200 by 200 pixels

    textFont(f,16); //using the font created in setup, changes font size to 16
    fill(255); //white font colour
    text ("assignment",75,100); //same as before, this time with a different y value (to change where the text will be displayed)
    textFont(f,10); //using the font created in setup, changes font size to 16
    text ("(press mouse down for more)",50,110); //same as before, this time with a different y value (to change where the text will be displayed)
    fill(255,100,100); //red colour     
  }
  else if (mouseX > 200 && mouseY > 200) { //if the horizontal value of the mouse is more than 200pixels and the vertical value of the mouse is more than 200pixels, then do the following...
    background(100); //grey colour
    fill(255,100,100); //red colour                        
    rect(200, 200, 200, 200); //starts rectange 200pixels across (200,0) and is 200 by 200 pixels  

    textFont(f,16); //using the font created in setup, changes font size to 16
    fill(255); //white font colour
    text ("my",75,300); //same as before, this time with a different y value (to change where the text will be displayed)
    fill(100,200,255); //blue colour    
  }
  
    if (mousePressed) {  //during writeup change 200 values to height/width. explain that this would automatically adjust if sketch size was changed
    background(20); //very pale grey colour   
    fill(255,200,100); //orange colour                          
    
    textFont(f,16); //using the font created in setup, changes font size to 16
    fill(255); //gives font a white colour
    text ("This is another sketch",122,50); //the text in speech marks represents what will be displayed on the sketch. The text will be shown 325 across the x axis, 100 down the y axis
    
    fill(250,200,100,mouseY); //yellowish fill that changes fill value depending on the vertical value of the mouse (mouseY)
    ellipse(200,200,200,200); //ellipse starts at 200pixels across, 200 pixels down (middle of screen), and is 200by200pixels
    
    fill(mouseX+20,50,0); //RGB values, R value is depicted from mouseX + 20
    ellipse(160,160,30,30); //left eye
    ellipse(240,160,30,30); //right eye
     ellipse(200,250,100,40); //mouth

    fill(random(255), random(255), random(255), 40); //random colour, 40 transparency out of 255. (for the ball)  
  }
  
  stroke(10,10); //gives the ball/ellpise a stroke colour of 10, with a transparency value of 10. (this is only used so as you can still see the ball through the highlighted rectangles)
  ellipse(ballX, ballY, 50, 50); //creates ellipse with x and y values of ballX and ballY (values initialised at beginning of code), which is 50 by 50 pixels
  ballX = ballX + moveX; //the horizontal value of the ball is itself plus the value of moveX (which is 2)
  ballY = ballY + moveY; //the vertical value of the ball is itself plus the value of moveY (which is -2)
  
  if(ballX > width) { //if the horizontal value (ballX) is greater than the width of the sketch window, then...
    ballX = width; //ballX is equal to the value of the width of the sketch window
    moveX = -moveX; //moveX is now subtracting the value of itself so it bounces back
  }
  if(ballY > height) { //if the vertical value (ballY) is greather than the height of the sketch window, then...
    ballY = height; //ballY is equal to the value of the width of the sketch window
    moveY = -moveY; //moveY is now subtracting the value of itself so it bounces back
  }
  if(ballX < 0) { //if the horizontal value (ballX) is greater than the width of the sketch window, then...
    ballX = 0; //ballX is equal to the value of 0 (lowest horizontal value of sketch window)
    moveX = -moveX; //moveX is now subtracting the value of itself so it bounces back
  }
  if(ballY < 0) { //if the vertical value (ballY) is greather than the height of the sketch window, then...
    ballY = 0; //ballY is equal to the value of 0 (lowest vertical value of sketch window)
    moveY = -moveY; //moveY is now subtracting the value of itself so it bounces back
    
   }

}





