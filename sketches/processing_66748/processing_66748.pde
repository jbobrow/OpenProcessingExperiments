
// For creating ariables that I want to use anywhere in 
// the sketch
float start;
float stop;
boolean opening;
int x;
int y;
int rad = 250;

// Setup runs only once, so it should
// contain things that will happen at the
// beginning of your sketch
void setup()
{
  size(800,600);
  start = PI/4;
  stop = 7*PI/4;
  opening = false;
  frameRate(60);
  
}

// Draw is the heartbeat of the program - what's
// inside here runs once every frame (where there
// are many frames per second)
void draw()
{
  background(0);
  
  arc(width/2, height/2, 250, 250, start, stop);
  
 animate();
 
 float distance = dist(mouseX, mouseY, width/2, height/2);
 if (distance < 125)

 {
   println("I'm in!");
rad--;
 }

}
 
 void animate()
 {
  if(opening)
  {
    // Opening the mouth
    start += PI/256;
    stop -= PI/256;
  }
  else
  {
    // Closing the mouth
    start -= PI/256;
    stop += PI/256;
  }
  
  // If the mouth is closed  
  if (start <= 0)
  {
    opening = true;
  }
  
  //If the mouth is open
  if (start >= PI/4)
  {
    opening = false;
  }
}

