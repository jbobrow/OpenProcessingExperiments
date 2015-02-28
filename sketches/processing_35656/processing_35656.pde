
//parametric ellipses
//by Gina DeMatteo
//Sep.3.11

void setup(){
  size(300,300);
  background(78,80,78);
  smooth();
  
}

//The following codes create the rectangles that move along the edge of the drawing
//by clicking the mouse and dragging they are controlled
//the color is changed as they move through the parameters
void mouseDragged() {
 
  colorMode(HSB,30);
  fill(mouseX,20,mouseY,20);
  noStroke();
  rect(5,mouseX,5,mouseY);
  rect(mouseX,5,mouseY,5);
  
}

//I chose to use void draw in order to create a flexibility in the composition
//this allows the user to get creative with the fixed objects
void draw(){
  
  colorMode(RGB,300);
   
  //The following commands establish the large ellipse in the corner
  //the color changes as the ellipse is drawn in it's parameters
  stroke(0); 
  fill(mouseX,mouseY,40,40);
  ellipse(250,250,-mouseX,-mouseY);
  
  //The following commands establish the 2 moving ellipses that frame the composition
  //The code used for the fill allows the colors of these ellipses move within their parameters
  stroke(19,162,10);
  fill(mouseX,mouseY,40,40);
  ellipse(40,mouseX,40,mouseY);
  ellipse(mouseX,40,mouseY,40);
  
    
}



