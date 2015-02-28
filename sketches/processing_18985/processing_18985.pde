
// conditionals III
// basically b_variables_2, revisited 

int x = 0;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  noFill();
  stroke(255); // white
  strokeWeight(2);
}

//--------------------------------------------------------
void draw() {
  background(64); // dark gray
  ellipse(x, 150, 100, 100);
  if ( x < width ) {
    x = x + 1;
  }  
}
