
//01/26/2011 | Kelsey Falter | kfalter@nd.edu
//created for Emerging Formats for Digital Art, University of Notre Dame

////setup: this defines the size of the sketch

void setup() {
  size (500,500); //the size of my sketch in pixels
  smooth (); //turns on anti-aliasing for smoothing
}

////draw: this is the drawing

void draw() {
  //background color in RGB
  background(237, 145, 33); //background color: carrot
  
  //set so circle is referencing the center point of my circle
  ellipseMode(CENTER);
  
 /////// LINES
 //// ALL COMPONENTS OF Line 1 to 2
 stroke(126); 
 line(mouseX, mouseY, mouseX+35, mouseY-15);
 
 //// ALL COMPONENTS OF Line 2 to 3
 stroke(126);
 line(mouseX+35, mouseY-15, mouseX+70, mouseY-40);
 
 //// ALL COMPONENTS OF Line 3 to 4
 stroke(126); 
 line(mouseX+70, mouseY-40, mouseX+80, mouseY-60);

 /////// CIRCLES
 //// ALL COMPONENTS OF CIRCLE 1
  stroke (104, 34, 139); //color of stroke: dark orchid
  strokeWeight (2); //stroke will have a width of 3
  fill (244, 244, 244, 90); //color of 1/5 circle fill: light gray/bright white with 90% opacity
  ellipse(mouseX, mouseY, 15, 15); //first x&y variables are center pt, then width/height
  
  //// ALL COMPONENTS OF CIRCLE 2
  //outer circle of circle number 2 (2/5 circles)
  stroke (142, 56, 142); //color of stroke: purple/beet color
  strokeWeight (3); //stroke will have a width of 3
  fill (244, 244, 244, 90); //color of 2/5 circle fill: light gray/bright white with 90% opacity
  ellipse(mouseX+35, mouseY-15, 25, 25); //first x&y variables are center pt, then width/height
  
  //inner circle of the circle number 2 (2/5 circles)
  stroke (237, 145, 33); //color of stroke: carrot
  strokeWeight (1); //stroke will have a width of 1
  fill (255, 255, 255); //color of 2/5 circle fill: white
  ellipse(mouseX+35, mouseY-15, 15, 15); //first x&y variables are center pt, then width/height
  
  //circle number 2 glow ring (2/5)
  stroke (255, 255, 255, 50); //color of stroke: white with 50% opacity
  strokeWeight (1); //stroke will have a width of 1
  noFill (); //color of 2/5 circle fill: none
  ellipse(mouseX+35, mouseY-15, 35, 35); //first x&y variables are center pt, then width/height
  
  //// ALL COMPONENTS OF CIRCLE 3
  //circle number 3 (3/5)
  stroke (104, 34, 139); //color of stroke: dark orchid
  strokeWeight (1); //stroke will have a width of 1
  fill (255, 255, 255); //color of 3/5 circle fill: white
  ellipse(mouseX+70, mouseY-40, 10, 10); //first x&y variables are center pt, then width/height
  
  //// ALL COMPONENTS OF CIRCLE 4
  //circle number 4 (4/5)
  stroke (142, 56, 142); //color of stroke: purple/beet color
  strokeWeight (1); //stroke will have a width of 1
  fill (244, 244, 244); //color of 4/5 circle fill: light gray/bright white
  ellipse(mouseX+80, mouseY-60, 5, 5); //first x&y variables are center pt, then width/height
  
  //circle number 4 glow (4/5)
  noStroke (); //color of stroke: none
  fill (255, 255, 255, 50); //color of 4/5 circle fill: white
  ellipse(mouseX+80, mouseY-60, 10, 10); //first x&y variables are center pt, then width/height
  
  
  
  
  
 
  
}

