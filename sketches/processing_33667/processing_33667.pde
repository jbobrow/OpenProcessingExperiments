
//define variables
//want five balls and ONLY up to five balls...aka...mouseClickedCounter
int numberBalls = 5;
int mouseClickedCounter;

int xPos[] = new int[numberBalls];
int yPos[] = new int[numberBalls];


void setup() {
  size(500, 500);
}
//draw 5 balls
void draw() {
  background (124, 24, 12); 

 for (int i = 0; i < numberBalls; i++) {
   fill (0, 255, 0);
   ellipse (xPos[i], yPos[i], 10, 10);
   
 }
}
//want to move the circle
void mouseClicked() {
  mouseClickedCounter++;
 
  xPos[mouseClickedCounter%numberBalls] = mouseX;
  yPos[mouseClickedCounter%numberBalls] = mouseY;
  
  
}

 

