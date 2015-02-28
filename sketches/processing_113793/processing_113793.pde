
//crzikrn, Oct. 5th 2013
//////////////////////////////
/*Playing around with ArrayLists of ellipses, filling in the space between points for graphical/visual satisfaction. Exploring the relationship between variable information and graphics. Also, the relationship between order and chaos; how re-interpretation of clustered data can be re-organized to graphics humans understand.
byunnnn.com
*//////////////////////////////


ArrayList <Bubble> bubbleArray;

void setup() {
  size(800, 800);
  bubbleArray = new ArrayList<Bubble>();
}

void draw() {
  background(244);
  float thick = random(10);

  stroke(random(255), random(255), random(255), 50);

  if (bubbleArray.size()>1000) {
    bubbleArray.clear();
    strokeWeight(thick);
  }

  beginShape();

  fill(255, 0, 0100);

  //vertex point initialization for filling in space.
  vertex(0, height);
  vertex(width, height);

  for (int i = 0; i<bubbleArray.size();i++) {
    Bubble single = bubbleArray.get(i);
    single.update();
    vertex(single.x, single.y);
    if (single.x > width) {
      //if out of screen remove it and make a new bubble at same y-axis on the start of the screen.
      //ordering chaos.
      bubbleArray.add(new Bubble(0, single.y, 3)); 
      bubbleArray.remove(i);
    }
  }
  endShape();
}

void mouseDragged() {
  bubbleArray.add(new Bubble(mouseX, mouseY, 3));
}

void keyPressed() {
  bubbleArray.clear();
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

  void lnDraw(Bubble other) {
    line(x, y, other.x, other.y);
  }

  void display() {
    ellipse(x, y, sz, sz);
    if (x>width-1) {
      fill(random(255), random(255), random(50), random(255));
    }
  }

  void move() {
    y+=random(-2, 2);
    x++;
  }
}


