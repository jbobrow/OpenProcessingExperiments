
//Elaine_Project 1
//I made a shape that connected three point with a function called drawShape 
//After that I used for for loops to duplicate the same shape. 
//After that I made each of them rotate according to the mouse
//I wanted to make them rotate at different speed according to the distance between each shape. So the closer a shape is to the mouse the faster it turn. BUT i failed to figure it out So I just created a variable called shapeR that determines how many times each column of shape rotates in the same amount of time. 
//After making them rotate I realize I really enjoyed the traces of the shape after the program starts running so I layered a rectangular transparency on top of the background so you can see a little bit of trace.
//After accomplishing that I added a conditional statement so that when mousepressed you can change backgroun color and see what the shape looks like when theres no transparency/traces
//The end I changed the colors for my shape to add a little more life to this. 
//This would be cool if theres music to go with it
 
 
int rotation;                                       //variable for rotation
 
void setup() {
  size(640, 420);
  smooth();
  background(255);
}
 
void draw() {
 if (mousePressed) {
    background(random(0, 100));
  }                                                   //if mouse is pressed the background colour changes 
   fill(255, 130);
  rect(0, 0, width, height);                          //The rectangle on top of the background that allows that allows you to see trace of the shape rather than a constant white background
  rotation = (360* mouseX)/width;                     //This is for the direction of the rotation
 
  for (int i = 0; i < 9; i++) {                       //The for loop for duplicating my shape ( define variable, how many, 
    for (int j = 0; j < 6; j++) {
 
                                                     
      drawShape((70*i) +35, (70*j) +35, i+1);         //function call that calls the shape I made below
    }
  }
}              
 
                                                     //function code for the shape of three circles and the lines
void drawShape(int shapeX, int shapeY, int shapeR) {
  pushMatrix();                                      // this is for the rotation of the shape. This is what makes it rotates
  translate(shapeX, shapeY);
  rotate(radians(rotation* shapeR));                 //shapeR is the third variable that determines how many full circles each column is going to turn.
  strokeWeight(2);
 
  fill(60);
  line(0, -25, 0, 0);
  fill(60);
  line(0, 0, 25, 25);
  fill(60);
  line(-25, 25, 0, 0);
  fill(229, 0, 19);
  ellipse(0, -25, 10, 10);
  fill(0, 59, 229);
  ellipse(25, 25, 10, 10);
  fill(229, 176, 0);
  ellipse(-25, 25, 10, 10);
  popMatrix();                                        //pushing it back to the original spot
}
