
/*Aquarius paludum
Yuki
September 17, 2012                                         
I refered to the site below.
http://www.geijutsu.tsukuba.ac.jp/~fumiaki/class2009/processing/term2/processing17.pdf                                                        
*/

Ring[] rings; // Declare the array
int numRings = 50;
int currentRing = 0;

void setup() {
  size(700, 700);
  smooth();
  rings = new Ring[numRings]; // Create the array
  for (int i = 0; i < numRings; i++) {
    rings[i] = new Ring(); // Create each object
  }

}

void draw() {

  background(160,216,random(240,255));

  for (int i = 0; i < numRings; i++) {

    rings[i].grow();

    rings[i].display();

  }

}

// Click to create a new Ring

void mousePressed() {

  rings[currentRing].start(mouseX, mouseY);

  currentRing++;

  if (currentRing >= numRings) {

    currentRing = 0;

  }

}

//class definition

class Ring {
  float x, y; 
  float diameter;
  float theta = random(100);
  boolean on = false; 
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;

    on = true;

    diameter = 1;

  }

  void grow() {

    if (on == true) {

      diameter += 2.5;

      if (diameter > 400) {

        on = false;

      }

    }

  }

  void display() {

    if (on == true) {
      
      noFill();
      strokeWeight(1.5);

      stroke(random(220,230));
      ellipse(x+30*cos(theta+0.21), y+30*sin(theta+0.21), diameter, diameter);
      ellipse(x+30*cos(theta+0.21+PI), y+30*sin(theta+0.21+PI), diameter, diameter);
      ellipse(x+30*cos(theta+0.58), y+30*sin(theta+0.58), diameter, diameter);
      ellipse(x+30*cos(theta+0.58+PI), y+30*sin(theta+0.58+PI), diameter, diameter);
    }

  }

}

