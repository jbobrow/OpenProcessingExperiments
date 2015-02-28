
//circle variables
int circleRadius = 60;      // size of the sun
int xStart = 235; // The initial x position
int yStart = 30;         // The initial y position
float xCircle = 235;     // the x position of the sun
float yCircle = 30;     // the y position of the sun

// Arc variables
float t = 0;   // Start time
float duration = 60 * 1000; // Complete a full circle every 60 seconds
float conversionFactor = 2 * 3.14 / duration; // A full circle (2*pi) occurs every duration milliseconds

void setup()
{
  size(500, 500); // Set window size
}

void draw()
{
  // Refresh background
  background(150);
  
  // Draw the circle
  fill(255);
  ellipse(xCircle, yCircle, circleRadius, circleRadius);
  line(xCircle,yCircle,250,250);
  // Update position
  // this method traces a curve using a parametric equation. 
  // To change the speed, adjust the value added to t
  //t += 0.01;
  
  // Convert t to radians
  t = millis() * conversionFactor;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float Rx = width/2 + circleRadius/2;
  float Ry = height/2 - circleRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  
  xCircle = cos(t) * Rx + centerX;
  yCircle = sin(t) * Ry + centerY;
  
  
  //numbers
  textSize(32);
text("12", 235, 30); 
fill(0, 102, 153);
text("3", 450, 250);
fill(0, 102, 153, 51);
text("6", 235, 480); 
fill(0, 102, 153);
text("9", 30, 250);
   
}




