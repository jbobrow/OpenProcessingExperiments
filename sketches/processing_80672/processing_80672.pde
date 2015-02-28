
/**
 * changing colors and size by moving the mouse
 *   
 * MOUSE
 * position x          : size
 * position y          : color
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
boolean savePDF = false;
float x = 0.0;


void setup() {
  size(500, 500);
  noCursor();
}


void draw() {
  // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER); 
  noStroke();
  background(mouseY/3, 100, 100);

  fill(360-mouseY/2, 100, 100);
  ellipse(250, 250, mouseX+1, mouseX+1);

  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
  frameRate(40); //speed of the ellipse growing
  fill(random(255 - x), 255, 255); //red turning into black, blinking
  ellipse (250+x,250, 30 + x/2,  30 + x/2);  //east
  
  fill(random(255 - x), 255, 255); //red turning into black, blinking
  ellipse (250-x,250, 30 + x/2, 30 + x/2);  //west
  
  fill(random(255 - x), 255, 255); //red turning into black, blinking
  ellipse (250,250+x,30 + x/2,  30 + x/2);  //south
  
  fill(random(255 - x),255,255); //red turning into black, blinking
  ellipse (250,250-x, 30 + x/2, 30 + x/2);  //north
  
  fill(random(255 - x),255,255); //red turning into black, blinking
  ellipse (250+x, 250-x, 30 + x/2, 30 + x/2);  //northeast
  
  fill(random(255 - x),255,255); //red turning into black, blinking
  ellipse (250-x, 250-x, 30 + x/2, 30 + x/2);  //northwest
  
  fill(random(255 - x),255,255); //red turning into black, blinking
  ellipse (250+x,250+x, 30 + x/2, 30 + x/2);  //southeast
  
    fill(random(255 - x),255,255); //red turning into black, blinking
  ellipse (250-x, 250+x, 30 + x/2, 30 + x/2);  //southwest
  
  //radius
  if(x < 250) //if x is smaller than 250
  {
     x += 2; //increases value by 2
  }
  else
  {
     x = 0; //if x is bigger, returns to 0
  }
}



void keyPressed() {
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
