
/*http://www.openprocessing.org/sketch/54911
*/

float orbitDuration = 1.5*1000; // 1.5 second orbit
float orbitRad = 75; // Radius 50px
 
void setup()
{
  size(250,250);
  smooth();
  noStroke();
}
 
void draw()
{
  fill(#E9B6D4, 20); // background colour, alpha for motion blur
  rect(0,0,250,250); // background shape
  translate((width/2),height/2); // centers in window
  float ang = TWO_PI * millis() /orbitDuration; //equation for orbit
  float x = sin(ang)*orbitRad;
  float y = cos(ang)*orbitRad;
  float xPos = cos(ang)*orbitRad;
  float yPos = sin(ang)*orbitRad;
  
  fill(#417FC2); //colour of orbiting circle
  ellipse(x,y,40,40); //size of orbiting circle
  ellipse(xPos/4,yPos/4,10,10); //size of orbiting circle
}


