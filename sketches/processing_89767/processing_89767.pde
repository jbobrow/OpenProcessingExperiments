
int fillStyle=0;
int squares = 9; //How many squares to a side?
int boardSize = 600; //Set pixel size for the board itself within the window.
float dx = boardSize/squares; //Size of each square in the board
int step = 0;
int row = 0;
int red = 0;
int green  = 0;
int turn = 1;
int interval = 1;
boolean isRed = true; //Determines if the first checker will be red or not


//The drawCheckerboard function separates the step of drawing the checkerboard
//from the rest of the function in case it needs to occur multiple times.
void drawCheckerboard(){
  //fill(0,0,255);
  //rect(0,0,boardSize+3,boardSize+3);
  for(int i = 0;i<squares;i++){  //Set up a nested loop for the rows & columns
    for(int j = 0;j<squares;j++){
      fill(fillStyle);  //Set the fill color to be the color stored in fillStyle
      rect(j*dx,i*dx,dx,dx); //Draw the square
      
      if(fillStyle==0){  //Switch the fill color variable after drawing each square
        fillStyle=255;
      } 
      else{
        fillStyle=0;
       
      }
    }
    if(squares%2==0 && fillStyle==0){ //If there is an even # of squares, switch the color at the end of the row. Otherwise, you get stripes!
        fillStyle=255;
      } 
      else if(squares%2==0 && fillStyle==255){
        fillStyle=0;
      }
    
  }
  
}

//This function sets the color of the checkers to be either red or green.
void setColor(){
  if(isRed){
    fill(255,0,0);
  }
  else{
    fill(0,255,0);
  }
}


void setup(){
  smooth(); //Uses smooth drawing function in Processing
  size(boardSize + 200,boardSize); //Sets up a 600 pixel square area for the checkerboard, plus an additional 200 pixels on the right side for the captions
  background(10);
  drawCheckerboard(); //Calls the drawCheckerboard function above. Since we are in the setup function, this only occurs once. 
  
  textFont(createFont("Myriad Pro",48)); //Lines below set up the font for printing out the colors and the scores, and prints out the names 'Red' and 'Green'.
  textAlign(CENTER, CENTER);
  fill(255,0,0);
  text("Red", 700, 150);
  fill(0,255,0);
  text("Green", 700, 450);
   
}

//This is where the checkers are actually drawn between frames.
void draw(){
  frameRate(1); //Sets there to be one checkerboard drawn per second. This can be increased to make things move more quickly.
  
  if(step<28){ //This can be changed to if(step<squares*squares) to fill up the entire board, or another arbitrary number to stop it before it finishes.
  fill(0);
  rect(600,0,200,600);
  fill(255);
  text("Step #:",700,300);
  text(turn,700,350);
  /*if(step%2==0){
    isRed=!isRed;
    green++;
  }
  else{
    red++;
  }
  */
  
  
  setColor(); //Sets the color as above to either Red or Green
 
  for(int k=1;k<=interval;k++){ //Places a number of checkers equal to the value of the variable 'interval'. Right now, this increments by one each time.
    ellipse((step%squares+1)*dx-.5*dx,row*dx+0.5*dx,0.5*dx,0.5*dx); //Draws a circle in the center of the square based on the settings above.
    if(step%squares==squares-1){
    row++;
    }
    if(isRed){
      if(step<squares*squares){
        red=red+1; //Adds one to the red variable if the checker placed is red, one to green if it is green.
      }
    }
    else{
    if(step<squares*squares){
      green = green+1;
    }
    }
    
    step++;
  }
  
  isRed=!isRed; //Switches the value of the boolean variable IsRed. This affects the setColor function above.
  turn++;
  interval = interval + 1; //This is where interval is incremented by one. If this was set instead to be equal to 1, the program would place one checker of each color at a time.
    
    
  
  fill(255,0,0);
  text("Red", 700, 150);
  text(red,700,200);
  fill(0,255,0);
  text("Green", 700, 450);
  text(green, 700, 500);
  
  
    
  }
  //saveFrame(); //Uncomment this line to save each changed frame as an image in the base directory.
  

}
