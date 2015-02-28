
/**
 * Redraw. 
 * 
 * The redraw() function makes draw() execute once.  
 * In this example, draw() is executed once every time 
 * the mouse is clicked. 
 
 
 remixed by mar_b
 */
 
 
// The statements in the setup() function 
// execute once when the program begins
void setup() 
{
  size(200, 200);  // Size should be the first statement
  stroke(0);
   // Set line drawing color to white
  noLoop();
}

float y = 100;

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() 
{ 
  background(#47C8EA);   // Set the background to black
  y = y - 1; 
  if (y < 0) { y = height; } 
   fill(120);
  beginShape();
  vertex( 9.0 , 71.0 );
  vertex( 33.0 , 59.0 );
  vertex( 54.0 , 58.0 );
  vertex( 74.0 , 45.0 );
  vertex( 88.0 , 45.0 );
  vertex( 80.0 , 60.0 );
  vertex( 96.0 , 57.0 );
  vertex( 111.0 , 40.0 );
  vertex( 128.0 , 39.0 );
  vertex( 116.0 , 57.0 );
  bezierVertex( 116.0 , 57.0 , 93.0 , 68.0 , 92.0 , 68.0 );
  vertex( 75.0 , 72.0 );
  vertex( 84.0 , 83.0 );
  vertex( 67.0 , 83.0 );
  vertex( 49.0 , 71.0 );
  vertex( 10.0 , 69.0 );
endShape();
 
  translate(y,50);
 fill(255);
   beginShape();
vertex( 10.0 , 47.0 );
bezierVertex( 10.0 , 47.0 , 9.0 , 9.0 , 53.0 , 16.0 );
bezierVertex( 53.0 , 16.0 , 89.0 , -26.0 , 138.0 , 16.0 );
bezierVertex( 138.0 , 16.0 , 221.0 , -6.0 , 205.0 , 71.0 );
bezierVertex( 205.0 , 71.0 , 194.0 , 123.0 , 134.0 , 95.0 );
bezierVertex( 134.0 , 95.0 , 68.0 , 137.0 , 47.0 , 82.0 );
bezierVertex( 47.0 , 82.0 , -16.0 , 106.0 , -13.0 , 63.0 );
bezierVertex( -13.0 , 63.0 , -11.0 , 40.0 , 9.0 , 48.0 );
endShape();

  




}


 
 


void mousePressed() 
{
  redraw();
}



