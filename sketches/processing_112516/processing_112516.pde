
float x = 0;
  
// The statements in the setup() function
// run once when the program begins
void setup() {
  size(400, 600);  // Size should be the first statement
  stroke(252,15,198);     // Set stroke color to white
  
  loop();
   
  x = height * 0.5;
}
 
// The statements in draw() are run until the
// program is stopped. Each statement is run in
// sequence and after the last line is read, the first
// line is run again.
void draw() {
  background(0);   // Set the background to black
  fill(252,15,198);
  rect(50,x,100,100);
  rect(50,x+200,100,100);
  rect(50,x+400,100,100);
  rect(250,-x+500,100,100);
  rect(250,-x+300,100,100);
  rect(250,-x+100,100,100);
   
  x = x - 1;
  if (x < 0) {
    x = height;
  }
}
 
void mousePressed() {
  loop();
}


