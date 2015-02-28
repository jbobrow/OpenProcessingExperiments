
/******************************************************

* Assignment 1
* Name: Stephen Lazzaro
* Email: slazzaro@haverford.edu
* Course: CS110- Section 02
* Submitted: 1/26/2012
*
* The following file creates images that are related to the sport of basketball.
* It starts by creating a basketball in the middle of the screen, then
* creating a basketball court towards the top of the screen, then
* creating Nike symbols on both sides of the middle of the screen, and finally
* by creating a backboard, rim, and net towards the bottom of the screen.

*********************************************************/


void setup ( ) {
  
  size (600,800);
  float w=width; 
  float h=height; //rename width and height for quicker typing
  background (255);
  
  // The following code creates a basketball in the middle of the screen
  
  fill (255,150,0);
  strokeWeight (1.4);
  smooth();
  ellipse (w/2, h/2, 90,90);
  noFill();
  strokeWeight (1.2);
  curve (w/2-90, h/2+90, w/2-45,h/2,
          w/2+45, h/2, w/2+90, h/2+90);
  line (w/2, h/2-45, w/2, h/2+45);
  strokeCap(ROUND);
  arc (w/2-57, h/2,90,90, -.856,.856);
  arc (w/2+57, h/2,90,90, 2.284,3.996);

 /* The following code creates an orange basketball court outline towards the top of
    the screen
 */
  
  fill (255,100,0);
  strokeWeight(1.6);
  strokeCap(SQUARE);
  rect (w/2-150, h/2-250, 300, 150);
 
/* The following code creates a blue quadrilateral
   on the bottom of the basketball court
*/

  fill (0,0,190);
  strokeWeight(1.2);
  quad (w/2-100, h/2-100, w/2+100, h/2-100, 
        w/2+50, h/2-150, w/2-50, h/2-150);

/* The following code creates a blue quadrilateral
   on the top of the basketball court
*/

  fill (0,0,190);
  quad (w/2-100, h/2-250, w/2+100, h/2-250, 
        w/2+50, h/2-200, w/2-50, h/2-200);

/* The following code creates the lines and curves (3 point lines, half court lines, the free
   throw lines, and the paint) within the basketball court
*/

  stroke(0);
  strokeWeight(1.8);
  fill(255,100,0);
  ellipse(w/2, h/2-175, 50, 50); //half court circle
  line (w/2, h/2-250, w/2, h/2-100); //half court lines
  noFill();
  curve (w/2-750, h/2-150, w/2-150,h/2-240,
          w/2-150, h/2-110, w/2-750, h/2-200); //three point line on left side of court
  curve (w/2+750, h/2-150, w/2+150,h/2-240,
         w/2+150, h/2-110, w/2+750, h/2-200); //three point line on right side of court
  
  fill(0,0,150);
  beginShape();
  vertex(w/2-150, h/2-200);
  vertex(w/2-110, h/2-200);
  vertex(w/2-110, h/2-150);
  vertex(w/2-150, h/2-150);
  endShape(); 
  fill(120);
  curve(w/2-300, h/2-150, w/2-110, h/2-150, 
        w/2-110, h/2-200, w/2-300, h/2-200); //free throw, paint area on left side of court

  fill(0,0,150);
  beginShape();
  vertex(w/2+150, h/2-200);
  vertex(w/2+110, h/2-200);
  vertex(w/2+110, h/2-150);
  vertex(w/2+150, h/2-150);
  endShape(); 
  fill(120);
  curve(w/2+300, h/2-150, w/2+110, h/2-150, 
        w/2+110, h/2-200, w/2+300, h/2-200); //free throw, paint area on right side of court

  /* The following code creates the letters NYK (abbreviation for New York Knicks)
  inside the blue quadrilateral on the bottom of the court
  */
  
  // The following code creates the N
  
  noFill();
  stroke(250,100,0);
  strokeWeight(2.3);
  beginShape();
  vertex(w/2-50,h/2-105);
  vertex(w/2-50, h/2-145);
  vertex(w/2-25, h/2-107);
  vertex(w/2-25, h/2-147);
  endShape();

  // The following code creates the Y
  
  beginShape();
  vertex(w/2-15, h/2-146);
  vertex(w/2, h/2-125);
  vertex(w/2+15, h/2-146);
  endShape();
  line(w/2, h/2-125, w/2, h/2-107);

  // The following code creates the K
  
  beginShape();
  vertex(w/2+50, h/2-146);
  vertex(w/2+25, h/2-128);
  vertex(w/2+50, h/2-107);
  endShape();
  line(w/2+25, h/2-107, w/2+25, h/2-146);

  /* The following code creates a Nike symbol on the left side of the screen
     (with height around the center)
  */

  stroke(0);
  fill(0,0,50);
  beginShape();
  vertex(w/2-240, h/2-5);
  bezierVertex(w/2-260, h/2+30, w/2-210, h/2+30, w/2-150, h/2);
  bezierVertex(w/2-250, h/2+60, w/2-300, h/2+50, w/2-240, h/2-5);
  endShape();

  /* The following code creates a Nike symbol on the right side (backwards) of the screen
     (with height around the center)
  */
  
  beginShape();
  vertex(w/2+240, h/2-5);
  bezierVertex(w/2+260, h/2+30, w/2+210, h/2+30, w/2+150, h/2);
  bezierVertex(w/2+250, h/2+60, w/2+300, h/2+50, w/2+240, h/2-5);
  endShape();

  // The following code creates a backboard, rim, and net on the bottom of the screen

  // The following code creates the backboard
  
  fill(200);
  strokeWeight(9.0);
  stroke(0,0,50);
  beginShape();
  vertex(w/2-200, h/2+275);
  vertex(w/2-200, h/2+125);
  bezierVertex(w/2-100, h/2+30, w/2+100, h/2+30, w/2+200, h/2+125);
  vertex(w/2+200, h/2+275);
  vertex(w/2+100, h/2+320);
  vertex(w/2-100, h/2+320);
  endShape(CLOSE);
  
  rect(w/2-75, h/2+150, 150, 125);
  
  //The following code creates the rim, and then net
  
  strokeWeight(4.0);
  ellipse(w/2, h/2+295, 160, 15);
  stroke(50,0,0);
  
  smooth();
  strokeWeight(3);
  noFill();
  beginShape();
  vertex(w/2-80, h/2+295);
  vertex(w/2-50, h/2+350);
  vertex(w/2-40, h/2+380);
  vertex(w/2+40, h/2+380);
  vertex(w/2+50, h/2+350);
  vertex(w/2+80, h/2+295);
  endShape();
  
  beginShape(LINES);
  vertex(w/2-50, h/2+300);
  vertex(w/2-50, h/2+350);
  vertex(w/2-30, h/2+303);
  vertex(w/2-30, h/2+380);
  vertex(w/2-10, h/2+303);
  vertex(w/2-10, h/2+380);
  vertex(w/2+10, h/2+303);
  vertex(w/2+10, h/2+380);
  vertex(w/2+30, h/2+303);
  vertex(w/2+30, h/2+380);
  vertex(w/2+50, h/2+300);
  vertex(w/2+50, h/2+350);
  endShape();
  
  curve(w/2-80, h/2+280, w/2-65, h/2+325, w/2+65, h/2+325, w/2+80, h/2+280);
  curve(w/2-80, h/2+300, w/2-50, h/2+350, w/2+50, h/2+350, w/2+80, h/2+300);
  
}


