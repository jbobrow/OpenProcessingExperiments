
ArrayList<Bubble> bubbles = new ArrayList();
boolean delay;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);
  for(int i=0; i<bubbles.size(); i++) {
     Bubble temp = bubbles.get(i);
     if(bubbles.size()>200) {
        bubbles.remove(0);
     } else {
       temp.increase();
     }
   }
  if(keyPressed) {
    if(key == 'z' || key == 'x') {
         bubbles.add(new Bubble());
         delay = false;
    }     
  }      
}

void mousePressed() {
  bubbles.add(new Bubble());
}




class Bubble {
  int x;
  int y;
  int diam=0;
  color c;

  Bubble() {
    x = mouseX;
    y = mouseY;
    c = color(random(255), random(255), random(255));
  }

  void increase() {
    fill(c);
    noStroke();
    ellipse(x, y, diam, diam);
    diam++;
  }
}













