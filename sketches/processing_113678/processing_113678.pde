
ArrayList<Ripple> ripples = new ArrayList();

void setup() {
 size(800,800);
 smooth();
}

void draw() {
  ripples.add(new Ripple(random (width),random (height)));
  background(255); 
  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
    r.grow();
    if (r.fade <=0) {
      // Items can be deleted with remove().
      ripples.remove(r);
    }
  } 
  
  println(ripples.size());
}

//void mousePressed() {
//  ripples.add(new Ripple(random (width),random (height)));
//}



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
    stroke(r, g, b,fade);
    fill(r, g, b,fade);
    ellipse(x, y, rSize, rSize);

  }

  void grow() {
    rSize++;
    fade-=2;
    if (fade <= 0) {
      fade = 0;
    }
  }
}
