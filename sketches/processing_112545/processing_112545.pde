
float x = 100;
  
// The statements in the setup() function
// run once when the program begins
void setup() {
  size(400, 600);  // Size should be the first statement
  stroke(175,11,11);     // Set stroke color to white
  
  noLoop();
   
  x = height * 0.5;
}
 
// The statements in draw() are run until the
// program is stopped. Each statement is run in
// sequence and after the last line is read, the first
// line is run again.
void draw() {
  background(0);   // Set the background to black
  line(0, x, width, x); 
  fill(175,11,11);
  rect(0,x,width,50);
   
  x = x - 1;
  if (x < 0) {
    x = height;
  }
}

 
void mousePressed() {
  loop();
}



