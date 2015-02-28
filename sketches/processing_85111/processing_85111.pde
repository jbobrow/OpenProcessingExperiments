
/*Reference: http://www.openprocessing.org/sketch/54911*/
 
float orbitDuration = 1.5*1000; // 1.5 second orbit
float orbitRad = 75; // Radius 50px
PImage img1;
 
 
void setup()
{
  size(500,500);
  smooth();
  noStroke();
  img1 = loadImage("image8.jpg");
}
  
void draw()
{
 image(img1,0,0);
  fill(255, 1); // background colour, alpha for motion blur
  rect(0,0,500,500); // background shape
  translate((width/2),height/2); // centers in window
  
  float ang = TWO_PI * millis() /orbitDuration; //equation for orbit
  float x = cos(ang)*orbitRad;
  float y = sin(ang)*orbitRad;
  float xPos = sin(ang)*orbitRad;
  float yPos = cos(ang)*orbitRad;
  
//circle one
fill(#C49A6C); //colour of orbiting circle
 ellipse(x*3,y*3,50, 50); //size of orbiting circle
 
//circle two
 fill(#F4C08E); //colour of orbiting circle
 ellipse(x*2.5,y*2.5,30,30); //size of orbiting circle
  
 //circle three
 fill(#F2B579); //colour of orbiting circle
 ellipse(x*2,y*2,30,30); //size of orbiting circle
   
    //CIRCLE four
  fill(#CC955E); //colour of orbiting circle
  ellipse(x*1.5,y*1.5,25,25); //size of orbiting circle
   
  //CIRCLE five
  fill(#EFB57B); //colour of orbiting circle
  ellipse(x,y,20,20); //size of orbiting circle
   
  //CIRCLE six
 
  fill(#D19152); //colour of orbiting circle
  ellipse(x/2,y/2,15,15); //size of orbiting circle
 
  //CIRCLE seven
  fill(#EAC09D); //colour of orbiting circle
  ellipse(x/3,y/3,10,10); //size of orbiting circle
   
  //CIRCLE eight
  fill(#EAA25C); //colour of orbiting circle
  ellipse(x/5,y/5,5,5); //size of orbiting circle
 
 
} 
  

 
     
 
 


   



