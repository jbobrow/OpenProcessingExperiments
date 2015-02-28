
ArrayList bubbles;
int mode = 0; // 0 is bubbles, 1 is ripples

void setup() {
  size(500, 500);
  bubbles = new ArrayList();
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < bubbles.size(); i++) {
    Bubble b = (Bubble) bubbles.get(i);
    if (mode == 0 && b.size > 1000) { // we only want to remove bubbles if not in ripple mode
      bubbles.remove(i);
      print("# of bubbles = " + bubbles.size() + "\n");
    } else {
      stroke(b.c);
      fill(0, 0, 0, 0);
      ellipse(b.x, b.y, b.size++, b.size++);
      if (mode == 1) {
        int rSize = b.size;
        while (rSize >= 1) {
          ellipse(b.x, b.y, rSize, rSize);
          rSize -= 50; // decrease rSize to make ripples more frequent
        } 
      }  
    }
  }
}

void mousePressed() {
  bubbles.add(new Bubble(mouseX, mouseY));
  print("# of bubbles = " + bubbles.size() + "\n");
}

void keyPressed() {
  if (key == 'b') {
    if (mode != 0) {
      for (int i = 0; i < bubbles.size(); i++) {
        bubbles.get(i).size = random(20)*10;
      }
    }
    mode = 0;
    print("switching to bubble mode\n");
  }
  if (key == 'r') {
    mode = 1;
    print("switching to ripple mode\n");
  }
}

class Bubble {
  color c;
  float x;
  float y;
  int size;
  
  Bubble(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    c = color(random(255), random(255), random(255));
    size = 1;
  }
}  

