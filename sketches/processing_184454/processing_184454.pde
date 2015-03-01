
/*-----------------------------
Random Lines - Squares
Randomizes Horizontal  Lines in specific sections

Created February 3, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 5, 2015

project URL
-----------------------------*/


//Setting up the Sketch
void setup()
{
  //Size of the page
  size(500,500);                                                                  
}

//The following code is for a vertical set of lines

void draw()
{
  //Line thickness
  strokeWeight(2);                                                                 
  //This is how fast the lines appear
  frameRate(500);                                                                  
  //Color of the background 
  background(0);                                                                  
  //margin
  float margin = width/10;
  //half margin
  float hMargin = margin/2;
  //half height
  float hHeight = height/2;
  //half width
  float hWidth = width/2;
 
  //Top Left
  stroke(250,220,0);     
  float X1=random(margin,hHeight-hMargin);
  //duplicate of X1 so that you do not have 2 of the same random variables 
  float X2=random(margin,hHeight-hMargin);     
  line(margin,X1,hWidth-hMargin,X2);                                                 

  //Top Right
  stroke(0,150,250);     
  line(hWidth+hMargin,X1,width-margin,X2);                               
  
  //Bottom Right
  stroke(255,0,0);     
  float X3=random(hHeight+hMargin,height-margin);   
  float X4=random(hHeight+hMargin,height-margin);   
  line(margin,X3,hWidth-hMargin,X4);                                                 
  
  //Bottom Left
  stroke(0,250,0);                                                                            
  line(hWidth+hMargin,X3,width-margin,X4);                                                  
}



