
/*

Attempt to reproduce this artwork pattern: http://newyorkcitylights.tumblr.com/post/21932025765

@author Rafael Rinaldi (rafaelrinaldi.com)
@since Apr 28, 2012

*/

// Max distance between lines.
int MAX_DISTANCE = 18;

// Position Y.
float y;

// Line inclination.
float inclination;

void setup() {
  background(0);
  size(500, 600);
  display();
}

void draw() {  
}

// Generate graphics.
void display() {
  background(0);
  y = 0;
  while(y < height) y += drawColumn();
}

/*

Draw a line column.
@return Column height.

*/
float drawColumn() {
  
  float x = 0;
  float columnHeight = random(70, 130); // Random column height.
  float inclination = random(30, 60); // Random line inclination.
  
  while(x < width) {
    
    stroke(255);
    smooth();
    line(x, y, x + random(-inclination, inclination), y + columnHeight);
    
    x += random(0, MAX_DISTANCE);
    
  }
  
  return columnHeight;
  
}

void mousePressed() {
  display();
}

