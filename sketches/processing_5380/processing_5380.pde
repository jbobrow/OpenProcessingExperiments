

// Based on code 43-02 (p. 409)


Ring[] rings;                  // Declare the array
int numRings = 100;
int currentRing = 0;
float one, two, three;

boolean record = false;

void setup() {
  size(513, 666);
  smooth();
  rings = new Ring[numRings];  // Construct the array
  for (int i = 0; i < numRings; i++) {
  rings[i] = new Ring();     // Construct each object
  }
}

void draw() {
 

  background(0);
  for (int i = 0; i < numRings; i++) {
    rings[i].grow();
    rings[i].change();
    rings[i].display();
  }

  if(record) {
    endRecord();
    record = false; 
  }

}

void change() {
   if(mousePressed) {
     one += 0.1;
     two += 0.2;
     three += 0.3;
     fill(one,two,three);
   }
 }

void keyPressed() {
  record = true; 
}

// Click to create a new Ring
void mousePressed() {
  rings[currentRing].start(mouseX, mouseY);
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
}

class Ring {
  float x, y, n;          // X-coordinate, y-coordinate
  float diameter;       // Diameter of the ring
  color c;  
  boolean on = false;  // Turns the display on and off

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos; 
    on = true;
    diameter = 10;
   }

  void grow() {
    if (on == true) {
      diameter += 0.5;
      
      if (diameter > height*2) {
        on = false;
       
      }
    }
  }
  
  void change() {
   if(mousePressed) {
     one += 0.1;
     two += 0.2;
     three += 0.3;
     c = color(one,two,three);
     fill(c);
   }
 }

  void display() {
    if (on == true) {
      noStroke();
      ellipse(x, y, diameter, diameter);
      }
  }
}





