
ArrayList <bubble> bubbleArray;
ArrayList <bubble> bubbleArrayPrev;
float x, y, a, b;


void setup() {
  size(900, 600);
  bubbleArray = new ArrayList<bubble>();
  bubbleArrayPrev = new ArrayList<bubble>();
}

void draw() {
  background(244);
  int size = bubbleArray.size();
  int sizePrev = bubbleArrayPrev.size();
  float thick = random(10);

  stroke(random(255), random(255), random(255), 50);

  //println(size);
  if (size>25) {
    bubbleArray.clear();
  }
  if (!bubbleArray.isEmpty()) {

    for (int i = 0; i < size ; i++) {
      //maybe I have to create  a new array to collect data points.
      bubble singleBubble = bubbleArray.get(i); 
      singleBubble.update();
      println(singleBubble.x +" "+ singleBubble.y);
      
      if (bubbleArray.size() > 1) {
        for (int j = 1; j < size;j++) {
          bubble singleBubblePrev = bubbleArray.get(j);
          strokeWeight(1);
          println("previous " + singleBubblePrev.x +" "+ singleBubblePrev.y);
          line(singleBubblePrev.x, singleBubblePrev.y, singleBubble.x, singleBubble.y);
        }
      }
    }
  }
}

void mousePressed() {
  bubbleArray.add(new bubble(mouseX, mouseY, 3));
}

class bubble {
  float x, y, sz;
  float offset;
  float t;

  bubble(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
  }

  void update() {
    display();
    move();
  }

  void lnDraw(bubble other){
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
    x+=random(-1, 1);
  }
}



