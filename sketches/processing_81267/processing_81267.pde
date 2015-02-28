
/*Title: Chinese Knot
 Description: Using beginShape()and endShape(), create a composition with seven or more vertices.
 Created: September 25, 2012
 by: Min Fan
 Email:mfan1028@gmail.com
 */


/*Declare and assign values to x positons for the vertexs in left-up corner*/
//Declare an array named xpos with type of integer and assign values to each element
int[] xpos = {
  200, 160, 160, 190, 190, 140, 110, 115, 140, 150, 
  150, 110, 80, 80, 97, 90, 70, 70, 80, 80, 
  110, 110, 100, 100, 90, 90, 60, 60, 135, 195, 
  195, 170, 170, 200
};

/*Declare and assign values to y positon for the vertexs in left-up corner.*/
//Declare an array named ypos with type of integer and assign values to each element
int[] ypos = { 
  110, 110, 80, 80, 70, 70, 95, 100, 80, 80, 
  110, 140, 140, 130, 116, 109, 125, 185, 185, 150, 
  150, 200, 200, 160, 160, 195, 195, 120, 60, 60, 
  90, 90, 100, 100, 90
};

//Declare the setup method 
void setup() {
  //Set the size of canvas
  size(400, 400);
  //Set the background color as grey
  background(50);
  //Set the stroke to red
  stroke(255, 0, 0);
}

//Declare the draw method to draw the pattern
void draw() {
  //Scaling and repeating the whole pattern by for loop
  for (float j=0.6;j<100;j++) 
  {
    /*Draw the 1/4 shape in left-up corner*/
    //Start to draw lines
    beginShape(LINES);
    //For loop:draw lines from xpos[i], ypos[i] to xpos[i+i], ypos[i+1]
    for (int i=0; i<33;i++)
    {
      /*Draw two vertexs to connect a line*/
      //Draw vertex at position xpos[i]/j, ypos[i]/j
      vertex(xpos[i]/j, ypos[i]/j);
      //Draw vertex at position xpos[i+1]/j, ypos[i+1]/j
      vertex(xpos[i+1]/j, ypos[i+1]/j);
    }
    //Finish drawing lines
    endShape(LINES);

    /*Mirror the 1/4 shape by x-axis*/
    //Start to draw lines
    beginShape(LINES);
    //For loop:draw lines from xpos[i], ypos[i] to height-ypos[i], height-ypos[i+1]
    for (int i=0;i<33;i++)
    { 
      //Draw two vertexs to connect a line
      //Draw vertex at position xpos[i]/j, height-ypos[i]/j
      vertex(xpos[i]/j, height-ypos[i]/j);
      //Draw vertex at position xpos[i+1]/j, height-ypos[i+1]/j
      vertex(xpos[i+1]/j, height-ypos[i+1]/j);
    }
    //Finish drawing lines
    endShape(LINES);

    /*Mirror the 1/4 shape by y-axis*/
    //Start to draw lines
    beginShape(LINES);
    //For loop:draw lines from width-xpos[i], ypos[i] to width-xpos[i+1], ypos[i+1] 
    for (int i=0;i<33;i++)
    { 
      //Draw two vertexs to connect a line
      //Draw vertex at position width-xpos[i]/j, ypos[i]/j
      vertex(width-xpos[i]/j, ypos[i]/j);
      //Draw vertex at position width-xpos[i+1]/j, ypos[i+1]/j
      vertex(width-xpos[i+1]/j, ypos[i+1]/j);
    }
    //Finish drawing lines
    endShape(LINES);

    /*Mirror the 1/4 shape by x and y axes*/
    //Start to draw lines
    beginShape(LINES);
    //For loop:draw lines from width-xpos[i], height-ypos[i] to width-xpos[i+1], height-ypos[i+1]
    for (int i=0;i<33;i++)
    { 
      //Draw two vertexs to connect a line
      //Draw vertex at position width-xpos[i]/j, height-ypos[i]/j
      vertex(width-xpos[i]/j, height-ypos[i]/j);
      //Draw vertex at position width-xpos[i+1]/j, height-ypos[i+1]/j
      vertex(width-xpos[i+1]/j, height-ypos[i+1]/j);
    }
    //Finish drawing lines
    endShape(LINES);
  }
}



