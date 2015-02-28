
//Nathan Trevino  
//Homework 9
//Processing Wednesday, October 5th, 2011
//Copyright October 5th 2011
//Carnegie Mellon University. Pittsburgh PA

float depth = 400;
float angleInc;
void setup()
{
  
  size( 500, 500, P3D);
  background(0);
  angleInc = PI/300.0;
  lights();  
  
}

void draw()
{
  
    // center the middle and then spin? i dont know if it will work....
  translate(width/2, height/2, -depth);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  
  //YESSSS!!! it works!^
  
   for ( int i = 100; i <200; i += 50)
   {
  background(0);
  pushMatrix();
  stroke(130);
  fill(255,0,0);
  translate ( i, 200, -100);
  sphere(200);
  popMatrix();
   }
   
   
//    fill(255, 200, 200);
//  translate(width/2, height/2);
//  rotateX(frameCount * angleInc);
//  rotateY(frameCount * angleInc);
//  rotateZ(frameCount * angleInc);

  // initialize vertex arrays?/
 


   
}

