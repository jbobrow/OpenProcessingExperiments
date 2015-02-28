
//Official Property of Derek Gryga
//Generated 28 February 2013
//Cube-In Solar System Version 2.ERROR
//______________________________________________________________
int ballX = 200;
int ballXvelocity = 3;
//------
int ballY = 200;
int ballYvelocity = 3;
//---------------------
//int 2ballX = 230;
//int 2ballXvelocity = 3;
//------
//int 2ballY = 230;
//int 2ballYvelocity = 3;
//---------------------
//int 3ballX = 260;
//int 3ballXvelocity = 3;
//------
//int 3ballY = 260;
//int 3ballYvelocity = 3;
//______________________________________________________________
void setup(){
  size(1000,800);
  println("Cube-In Solar System: The planetary model for those who still believe the world is flat!");
  println("We are currently experiencing technical difficulties due to unknown logical phenomena, this should be alieved shortly.");
}
  void draw (){
//OPERATIONS AND STUFF LIKE THAT
//------------------------------------   
    ballX = ballX + ballXvelocity;
    ballY = ballY + ballYvelocity;
//------------------------------------    
//   2ballX = 2ballX + 2ballXvelocity;
//   2ballY = 2ballY + 2ballYvelocity;
//------------------------------------
   //3ballX = 3ballX + 3ballXvelocity;
   //3ballY = 3ballY + 3ballYvelocity;
//-------------------------------------------------------------------------------------------------------------------   
//THIS SECTION IS FOR PLANET1, THE GREEN PLANET.
    background(10);
    fill(98,175,48); 
    ellipse(ballX,ballY,50,50);
    
  if (ballX < 800)  {        //Until planet1 hits the right boundary, it will go to the right.
    ballXvelocity = 2;
  }
//--- 
  if(ballX >= 800)  {        //When planet1 hits the right boundary, movemement to the right stops.
    ballXvelocity = 0;
  }
//---  
  if (ballX < 800)  {        //Until planet1 hits the right boundary, it will not move in Y-axis direction.
    ballYvelocity = 0;
  }
//---  
  if (ballX >= 800)  {       //When planet1 hits right boundary, it moves down.
    ballYvelocity = 2;
  }
//---
  if(ballY >= 400)  {        //When planet1 hits bottom boundary, Y-axis direction(DOWN) stops.
    ballYvelocity = 0;
  }
//---
  if(ballY >= 400)  {        //Until planet 1 hits left boundary (400), it will go in negative Y-axis direction(UP).
    ballYvelocity = -0; 
  }
//---
  if(ballX <= 400)  {        //When planet 1 hits left boundary, it goes in positive Y-axis direction(UP).
    ballYvelocity = -2;      //Possible redundancy.
  }  
//---  
//THIS IS THE END OF CODE FOR PLANET_1, THE GREEN PLANET.
//-------------------------------------------------------------------------------------------------------------------
////THIS SECTION IS FOR PLANET 2, THE BLUE PLANET.
//    fill(75,125,247);
//    ellipse(2ballX,2ballY,65,65);
//    
//  if(2ballX < 850)  {         //Until planet 2 hits the right boundary, it will go to the right.
//    2ballXvelocity = 2;
//  }
////--- 
//  if(2ballX >= 850)  {        //When planet 2 hits the right boundary, movemement to the right stops.
//    2ballXvelocity = 0;
//  }
////---  
//  if (2ballX < 850)  {        //Until planet 2 hits the right boundary, it will not move in Y-axis direction.
//    2ballYvelocity = 0;
//  }
////---  
//  if (2ballX >= 850)  {       //When planet 2 hits right boundary, it moves down.
//    2ballYvelocity = 2;
//  }
////---
//  if(2ballY >= 450)  {        //When planet 2 hits bottom boundary, Y-axis direction stops.
//   2ballYvelocity = 0;
//  }
////---
//  if(2ballY >= 450)  {        //Until planet 2 hits left boundary (400), it will go in negative X-axis direction.
//    2ballXvelocity = -2;      //Possible redundancy.
//  }
////---
//-------------------------------------------------------------------------------------------------------------------
//THIS SECTION IS FOR PLANET_3, THE SUN.
    fill(98,175,48); 
    ellipse(ballX,ballY,50,50);
    
//  if (3ballX < 900)  {        //Until planet_3 hits the right boundary, it will go to the right.
//    3ballXvelocity = 2;
//  }
////--- 
//  if(3ballX >= 900)  {        //When planet_3 hits the right boundary, movemement to the right stops.
//    3ballXvelocity = 0;
//  }
////---  
//  if (3ballX < 900)  {        //Until planet_3 hits the right boundary, it will not move in Y-axis direction.
//    3ballYvelocity = 0;
//  }
////---  
//  if (3ballX >= 900)  {       //When planet_3 hits right boundary, it moves down.
//    3ballYvelocity = 2;
//  }
////---
//  if(3ballY >= 500)  {        //When planet_3 hits bottom boundary, Y-axis direction(DOWN) stops.
//    3ballYvelocity = 0;
//  }
////---
//  if(3ballY >= 500)  {        //Until planet_3 hits left boundary (400), it will go in negative Y-axis direction(UP).
//    3ballYvelocity = -2; 
//  }
////---
//  if(3ballX <= 500)  {        //When planet_3 hits left boundary, it goes in negative Y-axis direction (UP).
//    3ballYvelocity = -2;      //Possible redundancy.
//  }  
////---  
//  }
}
