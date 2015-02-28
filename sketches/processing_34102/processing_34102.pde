
class Particle{
 float x,y;  //x and y locaiton of particle
 float xVel, yVel;  //x and y velocity of particle
 float ang;  //angle ind egrees that particle should be moving at

 //constructor
 Particle(float newX, float newY){
   x=newX;//random(width);
   y=newY;//random(height);
   ang=random(0,2*PI);  //we're using radians
   xVel=pSpeed*cos(ang);
   yVel=pSpeed*sin(ang);
 }
 
 //deals with the frame to frame changes of the particle
 void Update(){
   x+=xVel;
   y+=yVel;
   
   //is it out of range? if so, bounce it
   if (OutOfBounds()){
     Bounce();
   }
  
 }
 
 //draws the particle on screen
 void Draw(){
   point (x,y);
 }
  
 //selects a new angle at random for the particle to move in
 void Bounce(){
   //save the current location
   float tempX=x;
   float tempY=y;
   
   boolean good=false;  //stays false until we find a new angle that works
   
   //loops until it works
   while (!good){
     ang=random(0,2*PI);  //get a new angle new angle
     //set the velocities
     xVel=pSpeed*cos(ang);
     yVel=pSpeed*sin(ang);
     
     //try moving the particle along those velocities and see if it's still out of bounds
     x+=xVel;
     y+=yVel;
     if (OutOfBounds()){  //is it still out of bounds
       //then set the x and y values back to what they were
       x=tempX;
       y=tempY;
     }else{
       //the new direciton is good! Get out of the loop
       good=true;
     }
   }   
 }
   
 //returns true if the particle is outside the bounds of the letter
 boolean OutOfBounds(){
   if (pixels[GetPixel( int(x), int(y) )]!=testColor)
     return true;
   else
     return false;
 }
 
 //removes the particle from the array
 void Kill(){
  //first find the particle in the array
  for (int i=0; i<particles.length; i++){
    if (particles[i]==this){  //we found it
      Particle[] left=new Particle[particles.length];    //array to hold the left side
      Particle[] right=new Particle[particles.length];  //array to hold right side
      
      left=(Particle[])subset(particles,0,i);  //take everything to the left of k
      right=(Particle[])subset(particles,i+1);  //take everything to the right of k
      
      particles= (Particle[])concat(left, right);  //combine left and right and return it
    }
  }
 }
 
}

