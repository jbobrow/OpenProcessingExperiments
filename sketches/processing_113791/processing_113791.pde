
ArrayList <Bubble> bubbleArray;

void setup() {
  size(1000, 600);
  bubbleArray = new ArrayList<Bubble>();
}

void draw() {
  background(244);
  //Clear drawing when there are more than 300 points
  if (bubbleArray.size() > 300) {
    bubbleArray.clear();
  }

  beginShape(TRIANGLE_STRIP);
  //for all Bubble class "b" in ArrayList bubbleArray,
  //do update(), fill a color and let them be vertex points, so we can draw a continous line.
  for (Bubble b : bubbleArray) {
    b.update();
    fill(200, 100, 20, random(199));
    vertex(b.x, b.y);
  }
  endShape();
}

//Add new Bubble in ArrayList for mouse event

void mousePressed() {
  noStroke();
  bubbleArray.add(new Bubble(mouseX, mouseY, 0));
}

void mouseDragged() {
  stroke(255, 100);
  strokeWeight(1);
  bubbleArray.add(new Bubble(mouseX, mouseY, 3));
}

class Bubble {
  float x, y, sz;
  float offset;
  float t;

  Bubble(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
  }

  void update() {
    display();
    move();
  }

  void inDraw(Bubble other){
    line(x,y,other.x,other.y);
  }

  void display() {
    noFill();
    ellipse(x, y, sz, sz);
    if (y<-sz) {
      y = height+sz*2;
    }
  }

  void move() {
    //y--;
    x+=random(-2, 0.5);
  }
}



