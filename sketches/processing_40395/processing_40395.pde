
/*
  Short program that draws a static Image using lines 
  and generates a random colour for each shape.
  
  Submission Date: 03/10/11
          Authors: Group 5      
*/

//Global Variable Definitions
boolean done;
float [] rgbTop;
float [] rgbBottom;
float [] rgbLeft;
float [] rgbRight;
float [] rgbCentre;
float [] rgbCorner;
  
/*
  Main setup function for the program.
  
  Parameters: None
  Returns:    None
*/
void setup(){
  // Setup Canvas
  size(600,600);
  background(0,0,0);
  stroke(255,255,255);
  
  //Draw x and y axis on canvas
  line(0,300,600,300);
  line(300,0,300,600);
  
  //Initialise Global Variables
  done = false;
  rgbTop = setColour();
  rgbBottom = setColour();
  rgbLeft = setColour();
  rgbRight = setColour();
  rgbCorner = setColour();
  rgbCentre = setColour();
}

/*
  Main draw function for the program. This Function loops until the program is exited
  
  Parameters: None
  Returns:    None
*/
void draw(){
  // while loop so drawing only occurs once
  while (done == false){
   for (int counter=10;counter <=300;counter=counter+10){
     drawCentre(counter);
     drawCorners(counter);
     drawOuter(counter, 1);
     drawOuter(counter, 2);
     drawOuter(counter, 3);
     drawOuter(counter, 4);
   }
   //Sets exit condition for while
   done = true;
  }
}

/*
  This function sets ups an array to be used for an RGB value and returns it.
  
  Parameters: None
  Returns:    an array of float values to be used as an RGB referance.
*/
float [] setColour(){
  float [] temp = new float[3];
  
  temp[0] = random(255);
  temp[1] = random(255);
  temp[2] = random(255);
  
  return temp;
}

/*
  This Function draws the shape around the corners of the screen.
  
  Parameters: intger representing current counter number
  Returns:    None
*/
void drawCorners(int counter){
  stroke(rgbCorner[0], rgbCorner[1],rgbCorner[2]);
  line(0,300-counter,counter,0);
  line(600,300+counter,600-counter,600);
  line(0,300+counter,counter,600);
  line(600,300-counter,600-counter,0);
}

/*
  This Function draws the shape around the centre of the screen.
  
  Parameters: intger representing current counter number
  Returns:    None
*/
void drawCentre(int counter){
  stroke (rgbCentre[0], rgbCentre[1], rgbCentre[2]);
  line(300,counter,300+counter,300);
  line(300,counter,300-counter,300);
  line(300,600-counter,300-counter,300);
  line(300,600-counter,300+counter,300);
}

/*
  This function draws the shapes at the top bottom left and right
  of the canvas.the shape drawn is determined by number passed in.
  1 - draws top shape
  2 - draws bottom shape
  3 - draws left shape
  4 - draws right shape
  
  Parameters: intger representing current counter number
              integer to determine which shape is to be drawn
  Returns:    None
*/
void drawOuter(int counter, int x){
  if (x == 1){
    // if 1 is passed in then the top shape is drawn
    stroke (rgbTop[0], rgbTop[1], rgbTop[2]);
    line(counter,0,300,counter);
    line(600-counter,0,300,counter);
  }else if (x == 2){
    // if 2 is passed in the bottom shape is drawn
    stroke (rgbBottom[0], rgbBottom[1], rgbBottom[2]);
    line(counter,600,300,600-counter);
    line(600-counter,600,300,600-counter);
  }else if (x == 3){
    // if 3 is passed in the left shape is drawn
    stroke (rgbLeft[0], rgbLeft[1], rgbLeft[2]);
    line(300-counter,300,0,300-counter);
    line(300-counter,300,0,300+counter);
  }else if (x == 4){
    // if 4 is passed in the right shape is drawn
    stroke (rgbRight[0], rgbRight[1], rgbRight[2]);
    line(300+counter,300,600,300-counter);
    line(300+counter,300,600,300+counter);
  }    
}

