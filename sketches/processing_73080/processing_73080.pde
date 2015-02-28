
/*****************************************
* Assignment 3
 * Name:        Karunya Venugopal
 * E-mail:      kvenugopal@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   10/02/2012
 * 
 * The main driver program for project 3. 
 * This program draws a sky background with
 * grass, flowers, clouds, and a pig. The main 
 * two objects are the clouds and the flowers.
 * When the user clicks on any of the flowers, 
 * the text "It's a beautiful day" is displayed 
 * near the bottom of the left-hand side of the 
 * screen. Additionally, when the user moves the 
 * mouse closer to the flower, the center of the
 * flower changes from a version of yellow to a 
 * version of purple. Each time the program runs,
 * the location and the size of both objects 
 * (clouds and flowers) slightly change. This change
 * takes place because the respective variables 
 * for each object uses randomization.
***********************************************/

//x position for green lines
int i = 0;

//randomized position and size for drawFlower
float x = random (60,440);
float y = random (410,470);
float flowerWidth = random(20,40);
float flowerHeight = random(20,40);

//randomized position and size for clouds
float x2 = random (60,440);
float y2 = random (40,80);
float cloudWidth = random(70,150);
float cloudHeight = random(20,50);


//randomized color variable for drawFlower as mouse gets closer
float c = random (100,255);



void setup () 
{
   smooth ();
   size (500,500);
}



void draw ()
  {
   //make background blue
   background (74,154,222); 
   
   
     //draw many green lines at bottom of screen
     stroke (5,245,74);
     for (int i = 0; i<500; i=i+3)
     {
       line (i,380,i,500);
     } 
   
     //call the drawFlower method
     drawFlower (x,y,flowerWidth,flowerHeight);
   
     //call the drawCloud method
     drawCloud (x2,y2,cloudWidth,cloudHeight);
   
     //call the drawPig method
     drawPig ();
  }
  


void drawFlower (float dx, float dy, float objectWidth, float objectHeight) 
{
  noStroke ();
 
    //draw mutiple flowers using for loop
    for (int x = 60; x<500; x=x+120)
    
    {
      //draw mutiple red ellipses to be flower petals around the center ellipse 
      fill (255,0,0);
      ellipse ((x+10),(y+18),(flowerWidth+7), (flowerHeight+7)); 
      ellipse ((x+18),(y+3),(flowerWidth+7), (flowerHeight+7));
      ellipse ((x-5),(y+22),(flowerWidth+7), (flowerHeight+7));
      ellipse ((x-8),(y-22),(flowerWidth+7), (flowerHeight+7));
      ellipse ((x+11),(y-20),(flowerWidth+7), (flowerHeight+7));
      ellipse ((x-18),(y+3),(flowerWidth+7), (flowerHeight+7));
    
      //make center ellipse yellow but as mouse approaches flower change center ellipse to purple
      if (dist(x,y,mouseX,mouseY) <= 60)
      {
        fill (c,0,c);
      }
      else
      {
        fill (c,c,0);
      }  
      
      //draw center of flower object
      ellipse (x,y,flowerWidth,flowerHeight);
    }
    
      //make text appear above left-hand side of green lines when mouse is pressed and held on any flower
         if (mouseX <= 500 && mouseY >= 410 && mousePressed == true)  
        {
          fill (255);
          text ("It is a beautiful day!",10,370); 
        }
}  
    
  

void drawCloud (float dx2, float dy2, float dcloudWidth, float dcloudHeight)
{
    //draw mutiple clouds using for loop
    for (int x2 = 60; x2<500; x2=x2+200)
    
    {
      //draw overlapping and transparent grey ellipses to make cloud object
      noStroke ();
      fill (200,200,200,200);
      ellipse ((x2+10),(y2+20),(cloudWidth+10), (cloudHeight+10)); 
      ellipse ((x2+22),(y2+5),(cloudWidth+10), (cloudHeight+10));
      ellipse ((x2-5),(y2+22),(cloudWidth+10), (cloudHeight+10));
      ellipse ((x2-8),(y2-22),(cloudWidth+10), (cloudHeight+10));
      ellipse ((x2+11),(y2-20),(cloudWidth+10), (cloudHeight+10));
      ellipse ((x2-18),(y2+5),(cloudWidth+10), (cloudHeight+10));
      ellipse (x2,y2,cloudWidth,cloudHeight);
    }
} 



void drawPig ()
{
  //make pink ellipse centered (on x-axis) about 2/3 down (on y-axis)
  noStroke ();
  smooth ();
  fill (255,200,200);
  ellipseMode (CORNERS);
  ellipse (125,150,375,380);
  
  //make a gray ellipse centered at the base of left half of pink ellipse
  fill (175);
  ellipseMode (CENTER);
  ellipse (200,355,70,70);
  
  //make a gray ellipse centered at the base of right half of pink ellipse
  ellipse (290,355,70,70);
  
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
  
  ///make black ellipse in the center of the right half of recent ellipse
  ellipse (268,180,15,15);
  
  //make tilted triangle on left top of outlined pink ellipse
  noStroke ();
  fill (255,200,200);
  triangle (115,45,180,130,190,65);
  
  //make tilted triangle on right top of outlined pink ellipse
  triangle (380,45,330,120,310,65);
}
