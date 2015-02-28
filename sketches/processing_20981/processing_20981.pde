
void setup() {
  // set some initital conditions
  size(600, 200);
  smooth();
  background(255);
  stroke(255);
  strokeWeight(4);
  fill(0);
}

void draw() {
  // remember the for loop structure:
  // for (<counter>; <end condition>; <increment>) {
  //    loop body -- this repeats until <end condition> is met
  //    usually you'll want to do stuff with the counter in here
  //    so that the loop ends at some point!
  // }

  // draw 10 circles, spaced equally with increasing size (based on i)
  int spacing = 50;
  for (int i=0; i < 10; i = i+1) {
    float x = spacing + i * spacing;  
    float y = height/2; 
    
    // i+1 gives us a multipler of 1 to 10 
    // mouseX/10 will be between 60 and 6 
    // the actual diameter for each circle is a combination of
    // i and mouseX for each circle 
    float diameter = (i+1) * (mouseX/10);
    ellipse(x, y, diameter, diameter);
  }
}

