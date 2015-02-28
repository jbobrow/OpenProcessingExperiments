
/*
Arturo Steinberg
Studio E
Performative studio
Task 1
*/

/*
Experiment on math operations and mouse controlled behaviour
uploaded just because I'm quite obsesive and was not able to
stand areas of the drawing left in blank.
Those blank areas were due to the perspective simulation, which
did necessary to use a wider field of objects to scale.
*/


//--------------------------------------------------GLOBAL VARIABLES
//Define distance multiplier global variable
int maxDistance = 50;

//--------------------------------------------------SETUP

void setup(){
  //define size to be 600x600px and API to be P3D (Processing for 3D)
  size(600, 600, P3D);
}

//--------------------------------------------------DRAW LOOP

void draw() {
  //Define background to be black
  //set shapes to be smoothed
  //avoid stroke
  background(0);
  smooth();
  noStroke();
  
  //Define local variables for spacing and grid position X and Y
  int space = 25;
  int gridX;
  int gridY;
  
  //Create Y loop to start from zero until the width with "space" intervals
  for (gridY = -100; gridY <= 1.3*width; gridY += space) {

    //Create X loop to start from zero until the height with "space" intervals
    for(gridX = -100; gridX <= 1.3*height; gridX +=space) {

      //Define local variable
      float dia;

      //Set a vector position to the mouse position and every grid space in the matrix
      PVector mousePos, shapePos;
      mousePos= new PVector(mouseX, mouseY);
      shapePos = new PVector(gridX, gridY);
      
      //Assign the distance value from one vector to the other to the dia variable
      dia = PVector.dist(mousePos, shapePos);
      
      //Adjust the value of the dia variable through mathematical operations
      dia = sin(dia/maxDistance)*100+150;
      
      //Use pushMatrix to be able to set the points in height
      pushMatrix();
      
      //Set trDiff variable to locate the objects
      float trDiff = (sin(space/maxDistance)*100+150)/2;
      
      //Move the matrix spaces in 3 dimensions
      translate(gridX-trDiff, gridY-trDiff, 10*log(dia*3)-200);
      
      //Generate a color variation through a random collor generator
      float r = random(1);
      fill(dia*r*255, dia*r*255, dia*r*255);
      
      //Rotate the matrix
      rotate(45);
      
      //Generate rectangles in the matrix spaces
      rect(dia/4, dia/40, dia/2, dia/20);
      
      //rortate the grid back
      rotate(-45);
      
      //Pull back the matrix to the original position
      popMatrix();
      
    //Close the X loop
    }
  
  //Close the Y loop
  }

//End the Draw loop
}



