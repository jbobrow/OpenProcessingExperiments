
/*    This example generates a single circle inscribed by a set of points, and a box around the design in the lower right corner or center.
    With one of the generated designs, one can laser cut it to made a necklace or another piece of jewelry. Modified by Alexa Saccone, original code from http://newtextiles.media.mit.edu/?p=1906/
    I wrote the drawRectangles function as well as the drawCenterRectangle function, and edited the original code as well, adding float variables and changing the already given variables.
    To use, download the Voronoi library from the above link along with this code. The voronoi_generator sketch, from the above website, needs to run with this code in order to work: simply follow the instructions on the aforementioned website, and replace one of included sketches with the code below.
    
Picture of two finished necklaces: http://www.flickr.com/photos/117106014@N04/12439745954/ */



void setup()
 {
 size(300,300,P2D); //size of your intended pattern
 noLoop(); // don't need to use the draw loop
 
 /*unique name for your file. if left unchanged,
 will simply save file with current milisecond*/
 String fileName= "voronoi"+millis()+".pdf";
  
  beginRaw(PDF, fileName); //enables you to save your design to a pdf
  
   
  setupVoronoi(); // create your voronoi generator
    
    
  // =========GENERATE SPIRAL=============== //
   
   
  int centerLimit = 400; // variable to control the maximum diameter of the spiral
  float theta = 0; //like the diameter of your circle, but increases with every point in your spiral, producing the spiral effect.
  float x = (random(0,10)); //random number, can use for "drawPoint" below (drawPoint=decides placement of points)
  float y = (random(0,10)); //same as float x, another random number, can use for "drawPoint" below
 
  //this will draw one spiral
  
  for(int k=0;k<centerLimit;k++)
      {     
       theta +=0.6; //change to alter the tightness of your spiral
       //drawPoint(150,150,theta/2,theta/2); //(points for design example 2, where theta +=1)
       drawPoint(width/2,height/2,theta/2,theta/2); //(points for design example 1, where theta +=0.6)
      } 

}

void drawPoint(float orgX, float orgY, float theta, float diameter) 
{ //function that generates and adds circular points
 
  float xPos = sin(theta)*diameter+orgX;
  float yPos = cos(theta)*diameter+orgY;
  
  voronoi.addPoint(new Vec2D(xPos, yPos)); 

}

void draw()
{
  drawVoronoi(); //renders your voronoi
  //drawCenterRectangle(150, 150, 150, 150); //draws a recentangle in the center
  drawRectangles(150, 150, 150, 150); //draws rectangle in the lower right corner, going around the design, and makes boundaries
   endRaw();
}
//Note: drawRectangles works best if its a square and 1/2 the background dimensions, or one can just remove the draw rectangle function to generate the entire drawing


void drawRectangles(int centerX, int centerY, int squareWidth, int squareHeight) //makes squares around design in lower right corner
 {
   rect(centerX, centerY, squareWidth, squareHeight);
   fill(240);
   noStroke();
   rect(0, 0, 300-squareWidth, 300); //300=height of background, replace accordingly.
   rect(0, 0, 300, 300-squareHeight); 
 }

void drawCenterRectangle(int centerX, int centerY, int squareWidth, int squareHeight)
{
  noFill();
  rectMode(CENTER);
  rect(centerX, centerY, squareWidth, squareHeight);
  
}
 
//Other points to try for new designs, replace accordingly above
//drawPoint(x+1,x+1,theta,theta);
//drawPoint(x-6,x-6,theta,theta);
//drawPoint(x-5,x-5,theta,theta);
