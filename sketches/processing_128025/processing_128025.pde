
/*

  Title: Circles Sequential
  Author: Ray Elder
  Date: 13 January 2013
  Description: Based on Conditional Design project by Erin, Hayden and McKenzie.

*/

// set sketch width and height
size(500, 500);
// set sketch background color
background(255, 255, 255);

// set start diameter
float startDiameter = 100;

// build an array of colors
color[] penColors = {color(0,0,0), color(255,0,0), color(0,255,0), color(0,0,255)}; 

// draw pen dot
noStroke();
fill(0,0,0);
ellipse(width/2, height/2, 3, 3);

// draw 5 circles
noFill();
stroke(0,0,0);
strokeWeight(1);
for (int i = 0; i < penColors.length; i++) {
  stroke(penColors[i]);
  float diameter = startDiameter + 25 * i;
  ellipse(width/2, height/2, diameter, diameter);
  
}


