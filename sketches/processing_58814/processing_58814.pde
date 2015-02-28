
//Candice Ferreira. Problem set 2 question 4

void setup() {
  size (600, 600);
  smooth();
}
 
void draw() {
  background(0);
  int x = 210;
   
   
    if (intersect(125,125,x/2, mouseX, mouseY, x/2)) {
      fill (65, 11, 185);
    }
    else {
      fill (255,28, 200);
    }
 
    rect(12,12, x, x);
    rect (mouseX, mouseY, x, x);
    }
  boolean intersect (float a1, float b1, float c1, float a2, float b2, float c2) {
    float d = dist(a1, b1, c1, a2, b2, c2);
    if (d < (c1 + c2) ) {
      return true;
    }
      else {
        return false;
      }
    }


