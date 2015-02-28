
ArrayList<Ripple> ripples = new ArrayList();

void setup() {
 size(800,800);
 smooth();
}

void draw() {
  background(0); 
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
  int r = int(255);
  int g = int(255);
  int b = int(255);

  Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(r, g, b,fade);
    noFill();
    strokeWeight(1);
    ellipse(x, y, rSize, rSize);
    ellipse(x, y, rSize+7, rSize+7);
    ellipse(x+7, y+7, rSize+21, rSize+21);
    strokeWeight(.4);
    ellipse(x, y, rSize+130, rSize+130);
  }


  }


