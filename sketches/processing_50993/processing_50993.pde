
// Code Written By: Chukwudi T. Unonu
// Date: 02/02/2012
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
//

// "For Loop"


void setup()
{
  size(1080,840);
    
  
  
}

void draw()
{
// Black background
 background(0); 
  
  //Push Matrix
  //If you push the Marixlater on, you have to pop the matrix...
  pushMatrix();
  
  //for loop - iteration------
  //create a variable tostore a specific type of data/information. In this case the variable will be " i = 0 "
  for(int i = 0; i < 150; i++)
  //loop will run 150 times
  {
    //what happens here is repeated based on the above "for()" command information
    fill(200,0,0);
    ellipse( random(0,width), random(0,height), 10,10 );
    //"width" in this scenario is the width of the stage area ( [...] 10,y )
    //"height" in this scenario is the width of the stage area ( [...] x,10 )
  }
 
  
  //popping the matrix
  popMatrix();
  
  

}

