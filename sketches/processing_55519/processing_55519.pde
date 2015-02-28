
/* Done by Keya Vadgama
YSDN
Winter 2012
Reference: http://www.openprocessing.org/sketch/54911
*/

float orbitDuration = 1.5*1000; // 1.5 second orbit
float orbitRad = 75; // Radius 50px


void setup()
{
  size(400,400);
  smooth();
  noStroke();
}
 
void draw()
{

  fill(255, 10); // background colour, alpha for motion blur
  rect(0,0,400,400); // background shape
  translate((width/2),height/2); // centers in window
 
  float ang = TWO_PI * millis() /orbitDuration; //equation for orbit
  float x = cos(ang)*orbitRad; 
  float y = sin(ang)*orbitRad;
  float xPos = sin(ang)*orbitRad;
  float yPos = cos(ang)*orbitRad;

if (mousePressed) { //one the outermost circle will show first and then the rest if mouse is pressed

//circle one
fill(255, 0, 116); //colour of orbiting circle
 ellipse(x*3,y*3,50, 50); //size of orbiting circle

//circle two
 fill(255, 242, 0); //colour of orbiting circle
 ellipse(xPos*2.5,yPos*2.5,30,30); //size of orbiting circle
 
 //circle three
 fill(0, 122, 255); //colour of orbiting circle
 ellipse(x*2,y*2,30,30); //size of orbiting circle
  
    //CIRCLE four 
  fill(0); //colour of orbiting circle
  ellipse(xPos*1.5,yPos*1.5,25,25); //size of orbiting circle
  
  //CIRCLE five
  fill(255, 0, 116); //colour of orbiting circle
  ellipse(x,y,20,20); //size of orbiting circle
  
  //CIRCLE six

  fill(255, 242, 0); //colour of orbiting circle
  ellipse(xPos/2,yPos/2,15,15); //size of orbiting circle

  //CIRCLE seven
  fill(0, 122, 255); //colour of orbiting circle
  ellipse(x/3,y/3,10,10); //size of orbiting circle
  
  //CIRCLE eight
  fill(0); //colour of orbiting circle
  ellipse(xPos/5,yPos/5,5,5); //size of orbiting circle


} else {
  fill(255, 0, 116); //colour of orbiting circle
 ellipse(x*3,y*3,60,60); //size of orbiting circle
}
 
}

    


void keyPressed (){ //when you press the space bar the background is cleared and the animation starts again
   
  if (key == ' ');
  {
   background (255, 10);
  } 
    
  if (key == 'a'); //when you press the letter a the background turns to a light blue color
  {
  background (185, 238, 255);
 
  } 
  
}
  
