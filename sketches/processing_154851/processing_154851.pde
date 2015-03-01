
// Initializing x & y variables
float x = 0;
float y = 0;


void setup(){
  
  // Sets the size of the screen to 600x600
  size(600, 600);
  smooth();
}


// This method randomizes the x & y positions of the ellipse
// The width and height are given the variables x & y which moves
// the ellipses across the screen
void growCir(){
  ellipse(random(x), random(y), x, y);
  ellipse(random(x), random(y), y, x);
}



void draw(){
  
  // Sets the background black
  background(0);
  
  // Random colors for stroke and fill
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  
  // Prints the x and y coordinates
  println("the x position is: " + x + " the y position is: " + y);
  
  // Increments the x & y coordinates/variables by one 
  x++;
  y++;
  
  // Calling the growCir() method
  growCir();
  
  // If the values of x & y are equal to the height
  // and width of the screen, then the values are
  // reset to zero
  if(x == height || y == width){
    x = 0;
    y = 0;    
  } 
}
