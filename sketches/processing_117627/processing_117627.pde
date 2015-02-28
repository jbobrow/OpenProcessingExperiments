
ArrayList<Ripple> ripples = new ArrayList();

void setup() {
 size(1000,500);
 smooth();
}

void draw() {
  background(255); 
  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
  
  } 
}

void mousePressed() {
  ripples.add(new Ripple(mouseX,mouseY));
}
class Ripple {
  float x;
  float y;
  float rSize;
  float fade = 255;
  int r = int(0);
  int g = int(0);
  int b = int(0);

  Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(r, g, b);
    noFill();
    strokeWeight(.6);
    ellipse(x, y, rSize, rSize);
    ellipse(x, y, rSize+7, rSize+7);
    ellipse(x+7, y+7, rSize+7, rSize+7);
    strokeWeight(.4);
    line(x, y, rSize+500, rSize+250);
  }


  }


