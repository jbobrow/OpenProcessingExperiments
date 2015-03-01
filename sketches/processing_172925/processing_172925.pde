
float r = 0;
float angle = 0;
 
circle[] c = new circle[1000];

void setup() {
  
  size(500, 500);
  noFill();
  stroke(255, 40);
  ellipseMode(CENTER);
  
  for(int i = 0; i < c.length; i++) {
    c[i] = new circle();
  }
}

void draw() {
  
  background(0);
  
  int i = 0;

  for(float y = -13; y <= 13; y++) {
    for(float x = -13; x <= 13; x++) {
      c[i].display(x*25, y*25);
      i++;
    }
  }
  
  r += 0.01;
  angle += 0.04;
}

class circle {
  
  float diameter = 50;
    
  void display(float x, float y) {
    resetMatrix();
    translate(width/2,height/2);
    rotate(r);
    float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
    ellipse(x, y, d2, d2);
  }
}

