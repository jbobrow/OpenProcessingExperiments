
//Homework 4.2_Nested Loops & Transforms
//Created by Adrianne Blossom
//September 19, 2011

//Below is the coding for a nested loop that simulates the rotation of the hour and minute hands about a clock face.
//Bottom half of coding (rects and ellipses) is actually from an old sketch I attempted weeks ago but could not figure out how to get the clock hands to rotate.
//So it is coded the long way, but at least now I can get the rotation I had desired earlier.

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(255);

  pushMatrix(); //This transformation matrix controls the second hand on the clock. 

  translate(width/2, height/2);
  fill(0);
  ellipse(0, 0, 10, 10);

  rotate(frameCount * PI/6 * 0.0085); //Adjusts rotation direction & speed.
  translate(55, 0); //Controls distance from center of sketch.
  fill(160, 160, 160);
  rect(0, 0, 100, 5);

  popMatrix(); //End of first transformation matrix.


  pushMatrix(); //Start of second transformation matrix which controls the hour rotation.
  translate(width/2, height/2);

  rotate(frameCount * PI/6 * 0.0008); //Again, adjusts rotation direct & speed.
  translate(40, 0);
  fill(160, 160, 160);
  rect(0, 0, 70, 5);
  popMatrix(); //End of second transformation matrix.

  noStroke(); //The following mark the places of the 12 hours.
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(width/2, 25, 10, 30);
  rect(width/2, 275, 10, 30);
  rect(25, height/2, 30, 10);
  rect(275, height/2, 30, 10);

  fill(0);
  ellipse(width/2+60, 40, 10, 10);
  ellipse(width/2+110, 90, 10, 10);
  ellipse(width/2-60, 40, 10, 10);
  ellipse(width/2-110, 90, 10, 10);


  ellipse(width/2+60, height-40, 10, 10);
  ellipse(width/2+110, height-90, 10, 10);
  ellipse(width/2-60, height-40, 10, 10);
  ellipse(width/2-110, height-90, 10, 10);
}


