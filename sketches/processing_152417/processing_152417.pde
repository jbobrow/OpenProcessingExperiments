
int minRadius = 5;  // Min Radius of Element0
int maxRadius = 50;  // Max Radius of Element0
float minSpeed = 0.01;  // Min Speed of Element0
float maxSpeed = 5;  // Max Speed of Element0
int borderWidth = 3;  // Closest Element0 can approach to edge

// Declare an Element0 class
// Primarily to avoid declaring arrays for x[], y[] etc
// Although it does allow movement mechanism to be hidden
// from the publc
class element0 {
  public float x;
  public float y;
  public float radius;
  private float dx;
  private float dy;
  
  // Constructor - Allocate random spped and size when created
  public element0(float initX, float initY) {
    x = initX;
    y = initY;
    radius = random(minRadius, maxRadius);
    dx = random(minSpeed, maxSpeed);
    dy = random(minSpeed, maxSpeed);
  }
  
  // Movement - stays in a straight line, then bounces off border
  public void move() {
    x += dx;
    y += dy;
    constrain(0,0,width,height,5);
  }
  
  // Mechanism for bouncing off of border
  private void constrain(int xMin, int yMin, int xMax, int yMax, int border) {
    if ((x-radius <= xMin+border && dx<0) || (x+radius >= xMax-border && dx>0)) {
      dx = -dx;
    }
    if ((y-radius <= yMin+border && dy<0) || (y+radius >= yMax-border && dy>0)) {
      dy = -dy;
    }
  }
}

// Hold elements in an ArrayList instead of an array so that
// new elements can be added at will
ArrayList <element0> elements = null;

void setup() {
  size(500, 500);
  colorMode(HSB);
  elements = new ArrayList<element0>();
  background(0);
  
  // Start with four elements since that is the minimum necessary
  // to produce every colour variation
  for (int i=0; i<4; i++) {
   elements.add(new element0(random(width),random(height)));
  }
}

void draw() {
  // Fade old lines into background
  noStroke();
  fill(0,32);
  
  // Update the position of all of the elements
  for (int i=0; i<elements.size(); i++) {
    element0 updateElement = elements.get(i);
    updateElement.move();
    
    // Uncomment Following Lines to show Elements
    /*
    stroke(255,4);
    noFill();
    ellipse(updateElement.x, updateElement.y, updateElement.radius, updateElement.radius);
    */
  };
  
  // Draw lines between any elements that intersect
  for (int i=0; i<elements.size()-1; i++) {
    int oddCount = (i%2) * 2;
    element0 firstElement = elements.get(i);
    for (int j=i+1; j<elements.size(); j++) {
      element0 secondElement = elements.get(j);
      float minDistance = firstElement.radius + secondElement.radius;
      float actualDistance = dist(firstElement.x, firstElement.y, secondElement.x, secondElement.y);
      if (actualDistance < minDistance) {
        oddCount += j%2;
        stroke (oddCount * 63, 127 + actualDistance/minDistance * 128, 127 + minDistance/maxRadius * 64, 32);
        line(firstElement.x, firstElement.y, secondElement.x, secondElement.y);
      }
    }
  }
}

// Add a new element every time the mouse is clicked
void mouseClicked() {
 elements.add(new element0(mouseX,mouseY));
 println(elements.size());
} 

// Save output if the s key is clicked
void keyReleased() {
  if (key == 's') {
    saveFrame("YourName.jpg");
  }
}


