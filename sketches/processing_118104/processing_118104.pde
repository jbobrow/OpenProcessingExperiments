
// Midterm by David Marte, 2013
// Ripple class created by Matthew Epler

ArrayList<Ripple> ripples = new ArrayList();

void setup() {
 size(1000,1000);
 smooth();
}

void draw() {
  background(255); 
  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
    r.grow();
  } 
}

void mousePressed() {
  ripples.add(new Ripple(mouseX,mouseY));
}

void keyPressed() {
  if(key == 's') {
    saveFrame("Midterm-####.jpg"); 
  }
}
class Ripple {
  float x;
  float y;
  float rSize;
  float fade = 255;
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));

  Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(r, g, b);
    fill(random(0,255),random(0,255),random(0,255), 40);
    ellipse(500, 500, rSize, rSize);
    ellipse(0, 0, rSize, rSize);
    ellipse(1000, 1000, rSize, rSize);
    ellipse(1000, 0, rSize, rSize);
    ellipse(0, 1000, rSize, rSize);
  }

  void grow() {
    rSize++;
    fade--;
    if (fade <= 0) {
      fade = 0;
      
    }
  }
}



