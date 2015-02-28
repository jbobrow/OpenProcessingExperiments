
/******************************************************************
   Programmed by Jason Barles
   
  Licence: Creative Commons Attribution 3.0 Unported 
  http://creativecommons.org/licenses/by/3.0/deed.en_US   
  
  Artworks created from this code must be give attribution to
  Jason Barles. 
   
   How to use:
   The keyboard is your mode of input and allows you to 
   change the following; Colour - red, green, blue values; 
   Size - width, height; Shape - circle, rectangle, triangle.
  The colour is selected by most of the keys on the keyboard
  (mainly alphanumeric). The size can be altered using the arrow
  keys. The shape can be selected by pressing either 1, 2, or 3. 
  The screen is cleared with delete, backspace or the 'c' key.  
  
******************************************************************/
// variables for colour
int keyPress = 0;
int alpha = 32;
float redColour = 0;
float greenColour = 0;
float blueColour = 0;

// variables for size
float shapeWidth = 20;
float shapeHeight = 20;

// variable for shape
int shapeNumber = 1;

// variable to start drawing
boolean start = false;

  
void setup() {
  size(400, 400);
  background(204);
  displayTips();
}

void draw() {
  if(mousePressed==true)
     start = true;
	 
  if(start==true)
	drawShape();  
}

void displayTips(){
  fill(255,19,19);
  textSize(15);
  text("Click on this window", 10, 30);
  text("Press arrow keys to change the size", 10, 50);  
  text("Press numkeys 1, 2 or 3 to change the shape", 10, 70);
  text("Press any other key to change the colour", 10, 90);
  fill(255,255,255);
}

void keyPressed(){
  changeColour();
  changeSize();
  changeShape();

  // clear screen
  if(key == 'c' || key == DELETE || key == BACKSPACE){
      background(204);    // clear the screen
  }   
}

/*
  drawShape():
  draws the shape according the the shape number, hence the key number pressed.
*/
void drawShape(){
  int centerX = width/2;
  int centerY = height/2;
  
  if(shapeNumber == 1){
    ellipse(centerX, centerY, shapeWidth, shapeHeight);
  }else if(shapeNumber == 2){
    rect(centerX -(shapeWidth/2), 
         centerY -(shapeHeight/2), 
         shapeWidth, shapeHeight); 
  }else if(shapeNumber == 3){
    triangle(centerX-(shapeWidth/2), centerY+(shapeHeight/2), 
             centerX+(shapeWidth/2), centerY+(shapeHeight/2), 
             centerX, centerY-(shapeHeight/2));    
  }else
    ellipse(centerX, centerY, shapeWidth, shapeHeight);    
}

/*
  changeShape:
  change the shape according to the number pressed on the keyboard
*/
void changeShape(){
  if(key == '1')
    shapeNumber = 1;
  else if(key == '2')
    shapeNumber = 2;
  else if(key == '3')
    shapeNumber = 3;
}

/*
  changeSize:
  change the size of the shape using the arrow keys
*/
void changeSize(){
  if(key == CODED){
    if(keyCode == UP)
      shapeHeight+=10;
    else if(keyCode == DOWN)
      shapeHeight-=10;
    else if(keyCode == RIGHT)
      shapeWidth+=10;
    else if(keyCode == LEFT)
      shapeWidth-=10;   
  }
}

/*
  changeColour: 
  Alters the colour based on key presses using the values of the keys to change the 
  colour value.
      The first key press changes the red colour value
      The second key press changes the green colour value
      The third key press changes the blue colour value
*/
void changeColour(){  
  if(key != CODED) {
    // key press is not a number, and hence not a shape
    if(key != '1' || key != '2' || key != '3' ){    
      keyPress++;    
      if(keyPress > 3)
        keyPress = 0; // reset
          
      // map the key value to a colour range
      float Colour = map(key, 35, 123, 0, 255);
      if(keyPress == 0)
        redColour = Colour;
      else if(keyPress == 1)
        greenColour = Colour;
      else
        blueColour = Colour;
      
      // change the fill colour according the keys pressed
      fill(redColour, greenColour, blueColour, alpha);
    }
  }
}



