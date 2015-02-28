
//Variables that I want to use anywhere in the sketch.  **Define at top**  
int radius = 60;
float start;
float stop;
float x = radius;
float y = radius+100;
float speed = 1;
boolean opening;

//Setup runs only once, so it should contain things that will happen at the
//beginning of your sketch
void setup ()
{
  size(800,600);
  start = PI/4;
  stop = 7*PI/4;
  opening = false;
  frameRate(120);
  ellipseMode(RADIUS);
  
}

//Draw is the heartbeat of the program - what's inside here runs once every 
//frame (where there are many frames per second)
void draw()
{
  background(0);
  x +=speed;
  if (x> width+radius)
  {
    x = radius;
  }
  fill (0,0,255);
  arc(x, 180, radius, radius, start, stop); 

   y +=speed;
 if (y> width+radius){
    y = radius;
  }
  fill (255,204,0);
  arc(y, 180, radius, radius, start, stop); 
  
  if (opening)
  {
     //opening mouth
  start += PI/256;
  stop -= PI/256;
  }
  else 
 {
 //closing mouth
  start -= PI/256;
  stop += PI/256;
 }
   //if the mouth is closed
 if (start <= 0)
 {
  opening = true;
 }

// if mouth is open
if (start >= PI/4)
  {
    opening = false;
    
   }
    
}

