
/**
 * Loop. 
 * 
 * The loop() function causes draw() to execute
 * continuously. If noLoop is called in setup()
 * the draw() is only executed once. In this example
 * click the mouse to execute loop(), which will
 * cause the draw() the execute continuously. 
 */
 
// The statements in the setup() function 
// execute once when the program begins
void setup() 
{

  size(300, 300);  // Size should be the first statement
  
  strokeWeight(4);
  smooth();
  background(0);
  noLoop();
}

float y = 100;

// The statements in draw() are run until the 
// program is stopped. Each statement is run in 
// sequence and after the last line is read, the first 
// line is run again.

void draw() 
{ 
  background(0); 
  stroke( random(255), random(255), random(255), 200 ); 
  
  line(0, random (0,300), width, y);  
  line(0, y, width, random (20,200)); 
  

} 

void mousePressed() 
{
  loop();
}

