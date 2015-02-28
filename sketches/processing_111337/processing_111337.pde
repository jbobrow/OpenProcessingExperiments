
/* Lines
 * CC Lab Fall 2013
 * by Ryan Raffa
 * 09/09/13
*/

void setup() {
  size(600,600);
}


void draw() {
  background(150);

  for(int i=0; i < 600; i+=4) {
    float myDistance = dist(mouseX, 0.0, float(i), 0.0);
    float myColor = map(myDistance, 0, 600, 0, 150);
    noStroke();
    fill(myColor);
    rect(i,0,4,height); 
  } 
  
}


