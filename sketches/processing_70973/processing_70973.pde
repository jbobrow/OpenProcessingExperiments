
/*****************************************
* Assignment 2
 * Name:        Karunya Venugopal
 * E-mail:      kvenugopal@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   9/19/2011
 * 
 * The main driver program for project 2. 
 * This program draws and redraws a sky
 * background with snow. It is 
 * re-generated using randomness 
 * and iteration when any key is pressed. 
 * When user clicks on background using the
 * mouse, an face (with varying size and color)
 * is drawn at that location.
***********************************************/
//x position for green lines
int i = 0;

//x position for ellipses
int e = 500;

//variable for random distance between ellipses
int r = int(random (20));


void setup () 
{
   smooth ();
   size (500,500);
   
   //call the drawBackground() method
   drawBackground();
}


void draw () 
{
}


void mousePressed ()
{
  
  stroke (0);
  fill (255,255,0);
  
  // Use the mouseX, mouseY position to draw small yellow ellipse with eyes and upwards mouth
  if (mouseX <=250 && mouseY <=250)
  {
   ellipse (mouseX, mouseY, 50, 50); 
   fill (0);
   ellipse ((mouseX-7), (mouseY-7), 5, 5);
   ellipse ((mouseX+7), (mouseY-7), 5, 5);
   line ((mouseX-7), (mouseY+10), (mouseX+7), (mouseY+10));
   line ((mouseX-7), (mouseY+10), (mouseX-8), mouseY);
   line ((mouseX+7), (mouseY+10), (mouseX+8), mouseY);
  }
  
  
  // Use the mouseX, mouseY position to draw larger yellow ellipse with eyes straight mouth
  if (mouseX >=250 && mouseY >=250)
  {
    fill (255,255,0);
    ellipse (mouseX, mouseY, 100,100);
    fill (0);
    ellipse ((mouseX-30), (mouseY-7), 15, 15);
    ellipse ((mouseX+30), (mouseY-7), 15, 15);
    line ((mouseX-10), (mouseY+20), (mouseX+7), (mouseY+20));
  }
  

  // Use the mouseX, mouseY position to draw larger red ellipse with eyes and slanted mouth
  if (mouseX >=250 && mouseY <=250)
  {
    fill (255,0,0);
    ellipse (mouseX, mouseY, 120,120); 
    fill (0);
    ellipse ((mouseX-30), (mouseY-7), 15, 15);
    ellipse ((mouseX+30), (mouseY-7), 15, 15);
    line ((mouseX-10), (mouseY+15), (mouseX+7), (mouseY+20));
  }
  
  
  // Use the mouseX, mouseY position to draw largest yellow ellipse with eyes and slanted mouth
  if (mouseX <=250 && mouseY >=250)
  {
    fill (255,255,0);
    ellipse (mouseX, mouseY, 200,200);
    fill (0);
    ellipse ((mouseX-30), (mouseY-10), 20, 20);
    ellipse ((mouseX+30), (mouseY-10), 20, 20);
    line ((mouseX-20), (mouseY+25), (mouseX+15), (mouseY+17));
  }
}



void keyPressed ()
{
    //call the drawBackground() method
    drawBackground();
}


void drawBackground ()
{
   //make background dark blue
   background (0,0,random (50,255)); 
   
   
   //draw many green lines at bottom of screen
   stroke (0,255,0);
   for (int i = 0; i<500; i=i+3)
   {
     line (i,450,i,500);
   } 
  
  
  //draw randomly sized ellipses everywhere that's not covered with green lines 
  noStroke();
  fill (200,190);
  for (int e = 0; e<500; e=e+r)
  {
     ellipse (e, random (450),random (15),random (15));
  }
}
