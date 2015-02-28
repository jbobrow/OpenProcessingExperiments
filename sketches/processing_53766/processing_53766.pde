
// Global variables
// Retain value across all methods
int timeWaiting = 0;
int b = 100;
int lastmouseX =-1;
int lastmouseY =-1;

void setup(){
  size (1000,800);
}

void draw(){
  if (timeWaiting == 100)
  {
        // Create a new random number generator called "rand"
        Random rand = new Random();
        // Set b to a random number between 0 and 256
        b = rand.nextInt(256);
        // Reset wait
        timeWaiting = 0;
  }
    else
  {
    // add one to time waiting
     timeWaiting = timeWaiting + 1; 
  }
  
  if (lastmouseX == mouseX && lastmouseY == mouseY)
  {}
  else{
  background(mouseX,mouseY,b);}
 lastmouseX = mouseX;
 lastmouseY = mouseY;
}
                
                
