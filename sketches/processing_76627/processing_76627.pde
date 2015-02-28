
/*****************************************
 * Assignment 4
 * Name:        Karunya Venugopal
 * E-mail:      kvenugopal@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:   10/24/2012
 * 
 * The main driver program for project 4. 
 * This program draws a sky background with
 * blades of grass at the bottom of the 
 * screen. Then bees that are drawn wherever
 * the user clicks on the sketch and travel
 * to the right-hand side of the screen. The
 * sun also continuosly moves from the top 
 * left-hand corner to the right-hand corner.
***********************************************/
//variable for x location of sun
int sx = 0;

// the maximum number of bees that can be displayed at once (your sketch must work if this value is changed!)
int MAX_NUM_BEES = 20;

//loop variable for testing each element in array
int i=0;

//variable for index for array
int idxMyBees = 0;

// an array of all the created snowflakes
MyBee[] myBees = new MyBee[MAX_NUM_BEES];


class MyBee 
{
      // the bee's x-coordinate
      int x;

      // the bee's y-coordinate
      int y;


    // constructor for bee
    // @param xCoordinate the initial x coordinate of the bee
    // @param yCoordinate the initial y coordinate of the bee
    MyBee (int xCoordinate, int yCoordinate) 
    {
      x = xCoordinate;
    
      y = yCoordinate;
    }
    

    
void display() 
    {
       // drawing code for bee
       noStroke ();
       smooth ();
       fill (255, 255, 0);
       ellipse (x, y, 45, 20); 
       stroke (0);
       strokeWeight(10);
       fill (0);
       line ((x+3),(y-7),(x+3),(y+7)); 
       line ((x-10),(y-7),(x-10),(y+7)); 
       point ((x+15),y); 
       strokeWeight(1);
       stroke (0);
       fill (255);
       ellipse ((x-5),(y-11),20,20);
       ellipse ((x+3),(y-11),20,20);
   }



// advance the bee's animation  
void step (int speed) 
    {
      // increment the animation  
      x = x + speed;
    }  
}
  


void setup() 
{
    size(500,500);
    smooth ();
}



void draw() 
{
  //set background to sky blue
  background (135,227,242); 
  
  //drawing code for sun
   noStroke ();
   smooth ();
   fill (242,220,20);
   ellipse (sx,0,200,200);
   
   //make sun move at across top of screen
   sx = sx + 3;
   
   //constrain sun to stay on screen
  if (sx < 0 || sx > 500)
  {
    sx = 0;
  }  
  
   //draw many green lines at bottom of screen
    stroke (70,245,26);
    strokeWeight(1);  
       for (int g = 0; g<500; g=g+3)
       {
         line (g,450,g,500);
       } 
    
   // cycle from 0 to MAX_NUM_OBJECTS and then reset to begin again at 0
   // use for loop to display max num of bees and advance their animations
   for (int i = 0; i<MAX_NUM_BEES; i++)
         {
            // this loop tests each element of the myBees array to see if it is a bee or is empty
            if (myBees[i] != null) 
           {
              myBees[i].step (2);
             myBees[i].display ();
             
           }  

         }
}  



void mousePressed() 
{
   // create a new bee based on the location clicked and store it into myBees[idxMyBees] 
   myBees[idxMyBees] = new MyBee (mouseX, mouseY);
   
   // increment the index into myBees, keeping it in the range 0...MAX_NUM_BEES
    idxMyBees = (idxMyBees+1) % MAX_NUM_BEES;
}
