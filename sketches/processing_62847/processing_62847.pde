
//Declare and initialize two global arrays and one variable that will be used to
//hold the array index:
int[] xpos = new int [1];
int[] ypos = new int[1];
int startIndex = 0;

//Initialize the screen 
void setup() { 
  size(400,400); 
  background (255,0,0);
  stroke (0);
  strokeWeight(5);
  }

 
//Make a draw() loop that does nothing because drawing is only done when the mouse is clicked. 
void draw() {
// nothing happening in draw // since drawing is triggered by the mouse
}

//When mouse is pressed draw a line to it.
//Append array so that an infinite number of lines can be drawn.
void mousePressed () {
  startIndex++;
  xpos = (int[]) append (xpos, mouseX);
  ypos = (int[]) append (ypos, mouseY);
  line (xpos[startIndex -1], ypos [startIndex -1], xpos[startIndex], ypos[startIndex]); 
  }
  



