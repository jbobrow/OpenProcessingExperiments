
final int MAX_POINTS = 32000;
final int MAX_X_INC  = 5;
final int MAX_Y_INC  = 10;

ArrayList points;

void setup() {
  points = new ArrayList();  
  points.add(new PVector(0, 300));
  
  size(800, 600);
  background(0);
}

void draw() {
  if(points.size() < MAX_POINTS) { 
    // Get a positve random value to increment the x coordinate with
    int xInc = random(MAX_X_INC);
    
    // Get a positive or negative random value to increment the y coordinate with
    int yInc = random(-MAX_Y_INC, MAX_Y_INC);
    
    // The last point recorded is our starting point
    PVector currentPoint = (PVector) points.get(points.size() - 1);
    
    // Calculate the next line segments endpoint
    int newX = currentPoint.x + xInc;
    int newY = currentPoint.y + yInc;
    
    // Wrap around if the line goes off-screen
    if(newX >= width) {
      newX = 0;
    }
    
    // Add a new point to the list of points
    points.add(new PVector(newX, newY));
  }
  
  PVector last = (PVector) points.get(0);
  
  for(int i = 1; i<points.size(); i++) {
    // Get random blue color
    int red   = random(0, 128);
    int green = random(0, 128);
    int blue  = random(0, 255);

    // Set the line to draw with our random blue color    
    stroke(red, green, blue);
    
    PVector current = (PVector) points.get(i);
    
    // Get the absolute value of the length between the last x position and the current x position
    int xDiff = abs(current.x - last.x);
    
    // Draw lines ignoring ones which have gone offscreen and wrapped around
    if(xDiff < width / 2) {
      line(last.x, last.y, current.x, current.y);
    }
    
    last = current;
  }
}
