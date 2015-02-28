
//Problem Set 2
//Question 4
//Natalie DeCoste

void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(250);
  int x = 100;
  
  
    if (intersect(125,125,x/2, mouseX, mouseY, x/2)) {
      fill (255, 31, 173);
    }
    else {
      fill (90,220, 30);
    }

    rect(150,150, x, x);
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

