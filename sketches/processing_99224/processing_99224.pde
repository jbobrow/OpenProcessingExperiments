
int xPos = 0;        //establish variables to hold x&y position
int yPos = 0;

float rFactor = 0;  //establish non-integer values for scaling colours
float gFactor = 0; 

int speedFactor = 1; //switches between 1 and -1 to control direction of square placement


void setup()
{
  size(400,400);  //set window size
  background(0);  
  frameRate(400);
}

void draw()
{
//for each y-position (j), draw a sequence of squares across
//the x-direction.

 for (int j = 0; j < 20; j = j + 1) { 
   
   for (int i = 0; i < 20; i = i + 1) {
     
     float mouseDistance_x = i - mouseX/20;  //distance between pointer and current square.
     float mouseDistance_y = j - mouseY/20;
     float mouseDistance = sqrt(sq(mouseDistance_x) + sq(mouseDistance_y));
     
     float mouseBrightness = 1 - mouseDistance/sqrt(800); //establish brightness factor, in terms of % of maximum possible distance from  a square.
     fill(255*(mouseBrightness)*(i/20.), 255*(mouseBrightness)*(j/20.),random(255)*floor(mouseBrightness)); //sets R&G values - increasing across window, but modified by mouse if nearby. 
     stroke(0,0);
     rect(i*20, j*20, 20,20);
   }
 }

  

  

  


   
}




