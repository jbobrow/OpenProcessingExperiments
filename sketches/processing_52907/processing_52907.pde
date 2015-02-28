
// Luke Diamantopoulos, Problem set 1, Question 6
int d = 35;

void setup() {
  size (400,400);
  background (#030303);
  noStroke ();
}
  
  void draw() {
  float spacing = height/50; 
    
   
    fill (#FFFFFF);
    rect (0, 0, 200, 400); // leftout
  
  
fill (#030202);
rect (50, 50, 150, 300); // black left middle

fill (#FFFFFF);
rect (100, 100, 100, 200); //  left inside middle


fill (#030202);
rect (150, 150, 50, 100); // middle left

fill (#030202);
rect (200, 150, 50, 100); //middle right





fill (#FFFFFF);
rect (200, 50, 150, 300);

fill (#030202);
rect (200, 100, 100, 200);

fill (#FFFFFF);
rect (200, 150, 50, 100); //middle right


//------ loop ----- circles move along middle.
/*
int counter = 0;
  while( counter <= width ) {
    rect(counter, height/2, d, d);
    counter = counter + d; 
    */
    
    int counter = 0;
    smooth();
    fill (180,150,250);
     while (counter <= width ) {                 
    ellipse (width/2, counter, 20,20);      // height
    counter = counter +50;                 // animating it to move + 60
    }


  }



/* I got this idea from the ying yang symbol, even though not completely symetrical,
I really liked the idea behind it! I wanted the shapes to be symetrical yet not as much 
the colours. I wanted a heavy contrast, thus the black and white. The black and white 
emphasize the mirroring line in the middle of the picture. 

*/


