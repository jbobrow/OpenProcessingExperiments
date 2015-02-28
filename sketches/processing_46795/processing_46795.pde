
/* Trig is fun part 2!
 Let's use our Wave class*/
 
//declare the variable that will welcome our Wave type object
 
Wave vague;
 
// we set the stage
// ( don't forget to be in HSB color mode )
void setup() {
  size(700,160,P2D);
  
  smooth();
  noStroke();
  
  colorMode(HSB);
 
  vague = new Wave(height/2, height/3, PI/14, 0.0);
}
 
 
void draw() {
  refresh();
  vague.display();
  vague.update();
}
 
 
void refresh() {
  fill(0, 10);
  rect(0, 0, width, height);
}

