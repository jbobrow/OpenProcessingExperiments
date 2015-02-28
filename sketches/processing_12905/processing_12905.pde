
// *** 3267618 - Billy Tran - Interactive Display ***

// Metaphor - Sydney is a city packed like sardines

// Parts of the code were adapted from the "Bouncy Bubbles" tutorial example on processing.org

ArrayList Shape_List;
int Shape_Start = 0;

PFont f;

float Reaction = 0.1;
float Bounce = -0.75;
float Gravity = 0.6;

// Code setup
void setup() {
  size(600, 300); // If increasing screen size, consider placement of the onscreen text
  noStroke();
  smooth();
  frameRate(60); // High frame rate for a slicker animation
  
  f = createFont("Arial", 10, true); // Text font and size
  
  Shape_List = new ArrayList(); // Necessary for the mouse click interactive element
}

// Initialise code
void draw() {
  background(0);
  
  for (int i = Shape_List.size() - 1; i >= 0; i--) {
    Shape newShape = (Shape) Shape_List.get(i);
    newShape.Collision();
    newShape.Motion();
    newShape.Display(); 
  }
  
  // Text editor for onscreen instructions
  textFont(f);
  textAlign (LEFT);
  fill(255);
  
  // ("text", x, y);
  text("Gravity Controls", 510, 20);
  text("1 - Direction", 510, 36);
  text("3 - Increase", 510, 52);
  text("4 - Decrease", 510, 68);
  text("6 - Restore", 510, 84);
  text("7 - Zero", 510, 100);
  text("Left click - Small Shapes", 15, 20);
  text("Right click - Large Shapes", 15, 36);
  
  text("Shapes on screen:", 15, 284);
  text(Shape_List.size(), 115, 284); // Shows the number of shapes on display
}

// Mouse click event
// Allows user to add unlimited amount of objects, each click creates 2 shapes
// Left click creates small objects ranging between 5 and 12 in diameter
// Right click creates large objects from 20 to 33
void mouseClicked() {
  if (mouseButton == LEFT) {
    Shape_List.add(new Shape(mouseX, mouseY, random(5,10), Shape_Start, Shape_List));
    Shape_List.add(new Shape(mouseX, mouseY, random(7,12), Shape_Start, Shape_List));
  }
  else if (mouseButton == RIGHT) {
    Shape_List.add(new Shape(mouseX, mouseY, random(20,30), Shape_Start, Shape_List));
    Shape_List.add(new Shape(mouseX, mouseY, random(22,33), Shape_Start, Shape_List));
  }
}

// Key press event code for manipulating gravity effect
// Key changes must also correspond to the text above
void keyPressed() {
  switch(key) {
    case  '1'  : Gravity = Gravity * -1; break;           // gravity direction, up or down
    case  '3'  : Gravity = Gravity + 0.1; break;          // increase gravity
    case  '4'  : Gravity = Gravity - 0.1; break;          // decrease gravity
    case  '6'  : Gravity = Gravity * 0.0 + 0.6 ; break;   // wipes current gravity and restores to normal
    case  '7'  : Gravity = Gravity * 0.0; break;          // wipes all gravity regardless
  }
}

// Shape class
class Shape {
  float x, y, Shape_Width;
  float a = 0;
  float b = 0;
  int Shape_num;
  ArrayList Shape_pop;
 
  Shape(float tempX, float tempY, float swid, int snum, ArrayList spop) {
    x = tempX;
    y = tempY;
    Shape_Width = swid;
    Shape_num = snum;
    Shape_pop = spop;
  } 
  
  // Calculating and animating collisions between Shapes
  // Adapted from "Bouncy Bubbles" Processing tutorial example
  void Collision() {
    for (int i = Shape_num + 1; i < Shape_List.size() ; i++) {
	float dx = ((Shape) Shape_pop.get(i)).x - x;
	float dy = ((Shape) Shape_pop.get(i)).y - y;
	float distance = sqrt(dx*dx + dy*dy);
	float minDist = ((Shape) Shape_pop.get(i)).Shape_Width*0.5 + Shape_Width*0.5; 
	
        if (distance <= minDist) { 
	  float angle = atan2(dy, dx);
	  float targetX = x + cos(angle) * minDist;
	  float targetY = y + sin(angle) * minDist;
	  float c = (targetX - ((Shape) Shape_pop.get(i)).x) * Reaction;
	  float d = (targetY - ((Shape) Shape_pop.get(i)).y) * Reaction;
	  a = a - c;
	  b = b - d;
	  ((Shape) Shape_pop.get(i)).a += c;
	  ((Shape) Shape_pop.get(i)).b += d;
	}
    }   
  }
  
  // Boucing effect of Shapes when they make contact with the screen walls
  void Motion() {
    b = b + Gravity;
    x = x + a;
    y = y + b;
    
    if (x + Shape_Width/2 > width) {
	x = width - Shape_Width/2;
	a = a * Bounce; 
    }
    else if (x - Shape_Width/2 < 0) {
	x = Shape_Width/2;
	a = a * Bounce;
    }
    if (y + Shape_Width/2 > height) {
	y = height - Shape_Width/2;
	b = b * Bounce; 
    } 
    else if (y - Shape_Width/2 < 0) {
	y = Shape_Width/2;
	b = b * Bounce;
    }
  }
  
  // Visual display of the Shape
  // Can substitute ellipse for rectangle
  void Display() {
    fill(0, 0, random(150,250), random(180,255)); // Dark blue
    ellipse(x, y, Shape_Width, Shape_Width);
  }
}

