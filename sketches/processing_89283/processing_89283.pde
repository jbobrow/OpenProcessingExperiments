
/*
 *  Title: P09_02_ClassesAndObjects
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that uses at least two objects 
 *    based on a class that you created; make sure the
 *    class includes some attribute or behavior that 
 *    changes over time or according to user input.
 */
 
PieGrow pie1;
PieGrow pie2;
PieGrow pie3;
PieGrow pie4;
PieGrow pie5;

void setup() {
  size(600, 200);
  smooth();
  
  // PieGrow(title, PI);
  pie1 = new PieGrow("Pie A", 0.75);
  pie2 = new PieGrow("Pie B", 1.40);
  pie3 = new PieGrow("Pie C", 1.65);
  pie4 = new PieGrow("Pie D", 1.95);
  pie5 = new PieGrow("Pie E", 1.10);
}

void draw() {
  background(240);
  
  pie1.update();
  pie1.display();

  pie2.update();
  pie2.display();

  pie3.update();
  pie3.display();

  pie4.update();
  pie4.display();

  pie5.update();
  pie5.display();
}

// ================================================================ //

class PieGrow {

  // Declare variables
  float x;
  float y;
  float d;
  float angleStart;
  float angleMid;
  float angleEnd;
  float speed;
  float r;
  float g;
  float b;
  String title;
  
  // Constructor to set initial values
  PieGrow(String titleTemp, float angleEndTemp) {
     d = random(50, 250);
     x = random(d/2, width-d/2);
     y = random(d/2, height-d/2);
     angleStart = 0;
     angleMid = 0;
     angleEnd = angleEndTemp * PI;
     speed = random(.005, .05);
     r = random(255);
     g = random(255);
     b = random(255);
     title = titleTemp;
     
  }
  
  // Update fields
  void update() {
    angleMid += speed;
    angleMid = constrain(angleMid, 0, angleEnd);
    
    if((dist(x, y, mouseX, mouseY) < d/2) && mousePressed) {
      x = x + (mouseX - pmouseX);
      y = y + (mouseY - pmouseY);
    }
  }  
  
  // Draw the arc
  void display() {
    noStroke();
    fill(r, g, b, 150);
    arc(x, y, d, d, 0, angleMid);
    fill(0);
    text(title, x+5, y+15);
  }
}

