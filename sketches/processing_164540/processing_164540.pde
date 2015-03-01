

float radius = 50.0;
//sets the radius for the 14th pulsing rect to 50px

void setup(){
  // runs the code only once
  size( 500, 400 );
  //sets the size of the sketch to 500 px in width and 400 px in height
  strokeWeight( 4 );
  //sets the weight of the stoke on the rect to 4 points
  frameRate( 15 );
  //sets the defualt frame rate to 15
  
}


void draw(){
  // runs the code as a loop at the default frame rate
  radius = radius + sin( frameCount / 4 );
  //determins the pulsing and speed of pulsing of the 14th rect
  
  background( 100 );
    // Fill canvas grey
  
  fill( 0, 121, 184 );
  // Set fill color to blue
      
  stroke(255); 
  // Set stroke color to white
  
 rect( 325, 325, 50, 50); 
  // Draws rectangle 
  
 rect( 225, 325, 50, 50);    
   // Draws rectangle
   
 rect( 125, 325, 50, 50);
  // Draws rectangle 

 rect(25, 325, 50, 50); 
  // Draws rectangle 
 
  rect( 425, 325, 50, 50);   
  // Draws rectangle
  
  rect( 425, 225, 50, 50); 
  // Draws rectangle
  
 rect( 325, 225, radius, radius);    
    // Draws pulsing rectangle
    
 rect( 225, 225, 50, 50);    
   // Draws rectangle
   
 rect( 125, 225, 50, 50);   
  // Draws rectangle
 
 rect(25, 225, 50, 50);     
  // Draws rectangle

 rect( 325, 125, 50, 50);    
    // Draws rectangle 
 
 rect( 225, 125, 50, 50);    
   // Draws rectangle

 rect( 125, 125, 50, 50);   
  // Draws rectangle

 rect(25, 125, 50, 50);     
   // Draws rectangle
 
  rect( 425, 125, 50, 50);  
   // Draws rectangle

 rect( 325, 25, 50, 50);    
    // Draws rectangle

 rect( 225, 25, 50, 50);    
  // Draws rectangle 

 rect( 125, 25, 50, 50);   
  // Draws rectangle

 rect(25, 25, 50, 50);     
   // Draws rectangle

  rect( 425, 25, 50, 50);    
    // Draws rectangle
}




