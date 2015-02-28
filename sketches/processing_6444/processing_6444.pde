
// An object give a name to a (messy) collection of variables, data, and possibly other objects. 
// This is like saying "city" to refer to the colelction of people, buildings, and roads  
 
 

 
// tell Processing we want to name our object type Square 
 
class Square 
{ 
  // width in pixels 
  int w; 
   
  int x; 
  int y; 
   
  // colors 
  int r; 
  int g; 
  int b; 
   
  boolean over; 
 
  // this is the "constructor" for a new Square 
  Square() 
  { 
    x = 0; 
    y = 0; 
    w = 50; 
    r = 0; 
    g = 0; 
    b = 0; 
    over = false; 
  } 
 
  Square(int _x, int _y, int _w, int _r, int _g, int _b) 
  { 
    x = _x; 
    y = _y; 
    w = _w; 
    r = _r; 
    g = _g; 
    b = _b; 
    over = false; 
  } 
 
 
  void draw() 
  { 
     
    // set the fill color for the 1st square 
    if (over) 
    { 
       fill(255);  
    } 
    else 
    {    
      fill( r, g, b ); 
    } 
   
    // draw the rectangle starting at 10,10  
    rect(x,y, w,w);   
  } 
   
  void mousePressed() 
  { 
   if ( (mouseX > x) && (mouseX < x+w) && 
       (mouseY > y) && (mouseY < y+w)) 
      { 
         over = true; 
      } 
     else 
     { 
         over = false; 
     } 
  } 
  
} 
 
 
 
 
// tell processing we want space for 100 Square objects, called "square" 
Square[] squares = new Square[100];
  
Square secretSquare;

// maximum  number of attempts to click on the secret square
int maxAttempts = 5;

// current number of attempts
int attempts = 0;


 
void setup() 
{ 
  size(100, 100); 

  for (int index=0; // start condition - runs once at the start of the loop
       index < 100; // loop condition - loop runs while this is true
       index = index + 1 // runs every time the loop is finished
       )
  {
    // now create a new Square objects and give it values
    
    // Note: floor() jut chops off the decimal point, leaving a whole number (int)
    squares[index] = new Square(index*10 % 100, floor(index/10)*10, 10/*pixels wide*/, 18, 86, index*2+20);
  }
 
 secretSquare = squares[int(random(100))]; 

} 
 
void draw() 
{ 
   
  background(100); 
   
  // black outlines 
  stroke(0); 
 
  for (int index=0; // start condition - runs once at the start of the loop
       index < 100; // loop condition - loop runs while this is true
       index = index + 1 // runs every time the loop is finished
       )
  {
    // look to see if the secretSquare 
    // has been pressed!
        
    if (secretSquare == squares[index] && secretSquare.over )
    {
      
      println("Caught the secret square!");
    }
        
    squares[index].draw();
  } 

} 
 
 
void mousePressed() 
{
  
  for (int index=0; // start condition - runs once at the start of the loop
       index < 100; // loop condition - loop runs while this is true
       index = index + 1 // runs every time the loop is finished
       )
  {
    // now create a new Square objects and give it values
    squares[index].mousePressed();
  }

  // add 1 to number of attempts
  attempts++;
  
  if (attempts > maxAttempts)
  {
    exit();
  }
 
  
  
} 
 
 
 
void mouseMoved() 
{ 
} 

 
 
void mouseReleased() 
{ 
  /*
  s1.over = false; 
  s2.over = false; 
  s3.over = false; 
  */
}

