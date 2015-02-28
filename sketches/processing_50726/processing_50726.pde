
//hw #3 responding to the user
//copyright kyree 2012

/*instructions: click anywhere to draw the shape. sizes will vary
depending on the location clicked. drag the mouse to fill the 
background with shades of black lines. when you click to make 
shapes the color of the shape will be the same as the last random 
line. to start over and clear the stage, press the space bar. 
*/

void setup()
  {
  size (400, 400);
  background(240);
  smooth();
  strokeWeight(3);
  stroke(0);
  frameRate = 10;
  }


void draw()
  {

  }


void mousePressed()
  {
  noFill();
  rect(mouseX, mouseY, mouseX*.5, mouseY*.5);
  rect(mouseX - 50,mouseY -50, 50,50);
  }


void mouseReleased()
  {
  fill(0);
  ellipse(pmouseX,pmouseY,25,25);
  }


void mouseDragged()
  {
 stroke( random(255));
 //, random(255), random(255) );
  ellipse(mouseX, mouseY, pmouseX*mouseX, 50); 
  }


void keyPressed()
  {
  background (245);
  stroke(0);
  }


                                
