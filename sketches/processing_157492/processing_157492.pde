
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

int nbBubble = 30;

void setup() {
  size(400, 400);
  frameRate(40);
  background(255);
  stroke(0, 0, 0, 10);
  strokeWeight(1);
  fill(0, 0, 0, 5);

  for(int i = 0 ; i < nbBubble ; i++) {
    bubbles.add(new Bubble());
  }
}
void draw() {
  background(255);
  for(int i = 0 ; i < bubbles.size() ; i++) {
    bubbles.get(i).move();
    bubbles.get(i).render();
    bubbles.get(i).closest(bubbles);
  }
}

class Bubble {
  float x, y, speedx, speedy;

  Bubble() {
    x = random(10, width - 10); 
    y = random(10, height - 10);
    speedx = random(-1, 1);
    speedy = random(-1, 1);
  }

  void move() {
    if ((x < 10) || (x > width - 10)) {
      speedx *= -1; 
    }
    if ((y < 10) || (y > height - 10)) {
      speedy *= -1;
    }
    x += speedx;
    y += speedy;
  }
  
  void render() {
    fill(0,0,0,25);
    stroke(0,0,0,50);
    ellipse(x,y,20,20);
  }
  
  void closest(ArrayList<Bubble> bubbles) {
    
    float closestDist = 1e6;
    float closestDist2 = 1e6;
    Bubble closestBubble = null;
    Bubble closestBubble2 = null;
    
    for(int i = 0 ; i < bubbles.size() ; i++) {
      Bubble current = bubbles.get(i);
      if(current != this && dist(x,y,current.x,current.y) < closestDist) {
        closestDist = dist(x,y,current.x,current.y);
        closestBubble = current;
      }
      if(current != this && dist(x,y,current.x,current.y) > closestDist && dist(x,y,current.x,current.y) < closestDist2) {
        closestDist2 = dist(x,y,current.x,current.y);
        closestBubble2 = current;
      }
    }
    triangle(x,y,closestBubble.x,closestBubble.y,closestBubble2.x,closestBubble2.y);
  }
}

