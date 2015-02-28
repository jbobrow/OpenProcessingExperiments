
// Luke Diamantopoulos, Problem set 1, Question 6
int d = 35;

void setup() {
  size (400,400);
  background (#030303);
  noStroke ();
}
  
  void draw() {
  float spacing = height/50; 
    
  color from = color(#FFFFFF);
color to = color(#1CFC00);
color interA = lerpColor(from, to, .25);
color interB = lerpColor(from, to, .50);
color interC = lerpColor(from, to, .75);

    fill (from);
    rect (0, 0, 400, 400); // leftout
  
  
fill (interA);
rect (50, 50, 300, 300); // black left middle

fill (interB);
rect (100, 100, 200, 200); //  left inside middle


fill (interC);
rect (150, 150, 100, 100); // middle left

    }






