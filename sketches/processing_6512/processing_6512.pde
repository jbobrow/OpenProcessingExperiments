
/*
  What does this Processing sketch do?
      This sketch creates a flower like pattern around the mouse cursor 
      position using sin and cosine math functions. At startup, its created 
      at the center of the screen.
    
      By adding randomization, we add wiggly effect to our creation and also 
      a multi-colored output that changes over time.

  Usage:
      Click left mouse button and drag for the flower to move along with mouse    
    
*/

// Radius of the circle
float radius = 100;

float ox, oy;

// The coordinates of a point on circle
float x, y;

// Offset value for drawing flower pattern
float offset = 15;

// Variables for storing color of the circle drawn at (x,y)
float r, g, b;

/*
  Called once when the program is started. Used to define initial 
  enviroment properties such as screen size, background color, loading 
  images, etc. before the draw() begins executing. 
*/
void setup() {
  // Size of the application window
  size(720, 546);

  // Draw everything smoothly, without having any jaggies/aliasing
  smooth();
  
  // Call the draw() function below 12 times every second.
  frameRate(12);
  
  ox = width/2;
  oy = height/2;
}


/*
  Called directly after setup() and continuously executes the lines of 
  code contained inside its block until the program is stopped
*/
void draw() {
  // Clear the background color to balck
  background(0);
  
  // Draw at mouse cursor location
  translate(ox, oy);
  
  // Start drawing the flower pattern in a circular shape.
  for (int angle = 0; angle < 360; angle += offset) {
    // Calculate the coordinates of the points on circle using 
    // 'radius', 'sin' and 'cos'
    x = radius * cos(radians(angle));
    y = radius * sin(radians(angle));

    // Randmize the coordinates around 'offset'
    x += random(offset);
    y += random(offset);

    // Draw a white line from mouse cursor position to the point (x,y ) 
    // on circle
    stroke(255);    
    line(0, 0, x, y);

    // Calculate random values for red, green and blue hues    
    r = random(255);
    g = random(255);
    b = random(255);

    // Draw a circle at end of the line drawn before using white
    // outline and filled with r,g,b colors
    stroke(255, 255, 255);
    fill(r, g, b);    
    ellipse(x, y, offset, offset);
  }
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    ox = mouseX;
    oy = mouseY;
  }
}

