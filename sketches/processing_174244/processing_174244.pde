
ArrayList<Thing> arr = new ArrayList();
float col = .01;
float angle = 0;
void setup() {
  size(500, 500);
  background(0);
  noStroke();
}

void draw() {
  arr.add(new Thing());
  
  for (int i = 0; i < arr.size(); i++) {
    Thing temp = (Thing) arr.get(i);
    temp.display();
    temp.update(); 
  }
}

void mouseClicked() {
   angle = random(-1, 1);
}

class Thing {
  float x1 = frameRate * .05;
  float x2 = x1 + frameRate * .9;
  float x3 = x1+x2;;
  float x4 = x3 * frameRate * .1;
  float y1 = frameRate * .05;
  float y2 = y1 + frameRate * .8;
  float y3 = 2*y2-y1;
  float y4 = y3 * frameRate * .05 + y3 ;
  
  Thing() {
  
  }
  
  void update() {
    pushMatrix();
    translate(x2, y4);
    float diam = random(10, 20);
    ellipse(0, 0, diam, diam);
    popMatrix();
    
    pushMatrix();
    fill(255, random(20, 60));    
    translate(mouseX, y4);
    float diam = random(10, 50);
    ellipse(0, 0, diam, diam);
    popMatrix();
  }
  
  void display() {
     x1 += frameRate * .05 * angle;
     x2 += x1 + frameRate * .9;
     x3 += x1+x2;;
     x4 += x3 * frameRate * .1;
     y1 += frameRate * .05;
     y2 += y1 + frameRate * .8;
     y3 += 2*y2-y1;
     y4 += y3 * frameRate * .05 + y3 ;
    fill(y4 * frameRate*col, y1+x4*col, x3*y1*.001);    
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}
