
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * Modified for Vera Molnar example
 * Added a slight twist on a single random cell
 * Offset the twist back to the original top left after rotation
 * 
 */

void setup() {
  size(622, 622);
  rectMode(CORNER);
  noStroke();
  frameRate(2);  // set the frame rate to 2 draw() call per second - quickly now
}


void draw() {
  
  frameRate(.25);  // now slow to 1 draw every 4 secs 
  
  background(210); // clear the screen to grey
  
  int num = 5;
  int gap = (int) random(0, 20); // select a random gap between each square
  int borderwidth = 11;
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellheight = ( height - (borderwidth*2) - (num + 1) * gap ) / (float)num;
  float cellwidth = ( width - (borderwidth*2) - (num + 1) * gap ) / (float)num;
  
  //current cell counter
  int currcell = 0;
    
  //use 0 to 30 for the possibility of no rotation 
  int rotcell = (int) random(0,30);
    
  //get a random rotation degrees + or - 5 will do
  int rotdeg = (int) random(-5,5);   
      
    for (int i=0; i<num; i++) {
      
      for (int j=0; j<num; j++) {
           
        //random coloured cell selector   
        int cellsel = (int) random(0,4);
        
        fill(100, 0, 0, 200); // rectangle
        if (j == cellsel) {
          fill(198, 0, 0, 200); // rectangle
        }
                
        float offsetx = 0;
        float offsety = 0;
        int gapval = 0;
        
        //We don't want the overlaps too close and need 
        //to prevent infinite loop in the next part 
        if (gap <= 1) {
            gapval = (int) random(2,20);
        } else {
            gapval = gap;
        }
          
        while ((offsetx>-1) && (offsetx<1))  {
          offsetx = (float) random(0 - gapval, gapval);
        }
        
        while ((offsety>-1) && (offsety<1)) {
          offsety = (float) random(0 - gapval, gapval);
        }  
        
        //just to make it easier to read
        float thisxVal = (borderwidth + gap * (i+1) + cellwidth * i + offsetx);   
        float thisyVal = (borderwidth + gap * (j+1) + cellheight * j+offsety);
            
        //count the current cell
        currcell++;
        //check is the current cell the random cell
        //yes - rotate by random degs        
        if (rotcell==currcell) {
                
            
            float sourceAngle = atan(  thisyVal / thisxVal );  //work out the original angle of inclination (in radians of course)
            float newAngle = sourceAngle + radians(rotdeg);    //add the rotation angle to get new angle
            float thisRadius = sqrt( (thisxVal*thisxVal) + (thisyVal * thisyVal)) ;  //find the radius
            
            float newxVal = cos (newAngle) * thisRadius;       //work out the new x value after rotation
            float newyVal = sin (newAngle) * thisRadius;       //work out the new y value after rotation
            
            float xOffset = newxVal - thisxVal;                //get x offset
            float yOffset = newyVal - thisyVal;                //get y offset
          
            pushMatrix();    
            rotate(radians(rotdeg));                           //rotate
            rect(thisxVal - xOffset, thisyVal - yOffset, cellheight, cellheight);  //and draw square in original position         
            popMatrix();
            
        } else {
            rect(thisxVal, thisyVal, cellheight, cellheight);
        }
 
      }
    }
 
} //end of draw 

void keyPressed() {
    // save your drawing when you press keyboard 's'
    if (key=='s') {
      saveFrame("TwistingVeraOffset.jpg");
    }
}


