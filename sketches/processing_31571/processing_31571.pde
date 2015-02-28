
//--------------------------------------------------GLOBAL VARIABLES

//create a colour variable for our shape colour, 
//make it equal to 255
color shapecolor = color(0);

//create an integer variable for our shapes transparency, 
//make it equal to 80
int transparency = int(80);

//create an integer variable called maxDistance for 
//the falloff effect of the mouse, make it equal to 150
int maxDistance = int(150);

//create an integer variable called value for changing the
//fill colour to white when mousePressed is activated
int value = int(0);


//--------------------------------------------------SETUP

void setup() {

  size(900, 900, P3D);
}
//initialise the processing sketch by setting the 
//size to 900 x 900 and rendering engine to P3D 


//--------------------------------------------------DRAW LOOP


void draw() { 


  //Create a variable for the colours of the background and fill of the ellipses
  //call these variables x, y, respective of the Red and Green colour scale

  float x = float(mouseX);
  float y = float(mouseY);

  //set the background colour of our processing sketch to change according 
  //to mopuse postioin
  background(y, -x, 50, 80);

  //smooth the shapes to create a less pixelated image  
  smooth();

  //set the fill colours of the process sketch to change according to 
  //the mouse position or button pressed
  fill(x, y, value, 100);

  //set the stroke colour to our global variable
  stroke(shapecolor);

  //set the stroke weight to 2
  strokeWeight(2);

  //create a for loop starting at 0, 
  //ending at the width of the sketch, 
  //stepping by 25 pixels. call the iterating variable gridY
  for (int gridY = 0; gridY < 450; gridY = gridY + 25) {

    //within this loop create ANOTHER loop starting at 0,
    //ending at the height of the sketch, 
    //stepping by 25 pixels. call the iterating variable gridX
    for (int gridX = 0; gridX < 450; gridX = gridX + 25) {

      //create a variable for the size of the shape.      
      float diameter;

      //create a new PVector object called mousePos and make its 
      //x and y values equal to those of the mouse
      PVector mousePos = new PVector(mouseX, mouseY);

 //create a new PVector object called shapePos and make its
  //x and y values equal to gridX and gridY
      PVector shapePos = new PVector(gridX, gridY);

  //assign the diameter variable a value of the distance between
  //mousePos and shapePos
      diameter = mousePos.dist(shapePos);

//divide the value of the diameter variable by the global
      //maxDistance variable we created earlier then
      //multiply the diameter variable by 40 
      diameter = (diameter*20)/maxDistance;

//use pushMatrix to tell processing we are shifting the coordinates
      //of the sketch window. This lets us translate the the ellipses vertically
      //(normally ellipses can only be drawn in 2d)
      pushMatrix();

//translate the coordinates of the screen to gridX, gridY and diameter * 5
      translate(gridX, gridY, diameter*5);

//draw an ellipse at 0,0. width diameter, and height diameter
      ellipse(225, 225, diameter, diameter);

//run the popMatrix function to return the sketch coordinates to normal
      popMatrix();
      
      //end the gridY loop
    }
    
          //end the gridX loop
  }
  
  //close the draw loop
}

//create a custom function called mousePressed to change the colour of
//the ellipses if clicked
void mousePressed() {
  
  if (value == 0) {
    value = 255;
  } 
  else {
    value = 0;
  }
  
  //close the custom loop
}


