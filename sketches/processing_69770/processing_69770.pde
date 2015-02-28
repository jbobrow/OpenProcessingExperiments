
/*****************************************
 * Assignment 1
 * Name:        Karunya Venugopal
 * E-mail:      kvenugopal@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   9/11/2011
 * 
 * The main driver program for project 1. 
 * This program creates a sketch of a pig 
 * by making use of drawing primitives
 * learned in class this week. 
 *
***********************************************/
void setup () 
{
   size (500,500);
   
   //make background cyan
   background (0,255,255,200); 
}

void draw() 
{ 
  //make pink ellipse centered (on x-axis) about 2/3 down (on y-axis)
  noStroke ();
  smooth ();
  fill (255,200,200);
  ellipseMode (CORNERS);
  ellipse (125,150,375,400);
  
  //make a gray ellipse centered at the base of left half of pink ellipse
  fill (175);
  ellipseMode (CENTER);
  ellipse (200,390,70,70);
  
  //make a gray ellipse centered at the base of right half of pink ellipse
  ellipse (290,390,70,70);
  
  //make a green rectangle at bottom of screen with width 500 and height 100
  fill (0,255,0);
  rect (0,400,500,100);
  
  //make outlined pink ellipse centered (on x-axis) and about 1/3 down (on y-axis)
  fill (255,200,200);
  stroke (255,100,100);
  ellipse (250,140,190,190);
  
  //make white ellipse in upper left-hand corner of outlined pink ellipse
  fill (255);
  stroke (0);
  ellipse (210,120,50,50);
  
   //make white ellipse in upper right-hand corner of outlined pink ellipse
   ellipse (285,120,50,50);
   
   //make black ellipse in lower right-hand corner of left white ellipse
   fill (0);
   ellipse (220,125,20,20);
   
   //make black ellipse in lower left-hand corner of right white ellipse
   ellipse (275,125,20,20);
   
   //make an outlined ellipse centered (on x-axis) on bottom half of outlined pink ellipse
   fill (255,200,200);
  stroke (0);
  ellipse (250,180,90,65);
  
  //make black ellipse in the center of the left half of recent ellipse
  fill (0);
  ellipse (235,180,15,15);
  
  //make black ellipse in the center of the right half of recent ellipse
  ellipse (268,180,15,15);
  
  //make tilted triangle on left top of outlined pink ellipse
  noStroke ();
  fill (255,200,200);
  triangle (115,45,180,130,190,65);
  
  //make tilted triangle on right top of outlined pink ellipse
  triangle (380,45,330,120,310,65);
} 


