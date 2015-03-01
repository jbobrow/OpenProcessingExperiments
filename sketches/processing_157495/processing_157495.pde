
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
Bubble mouseBubble = new Bubble();
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
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(0, 0, 0, 5);
  for(int i = 0 ; i < bubbles.size() ; i++) {
    bubbles.get(i).move();
    bubbles.get(i).closest(bubbles);
  }
  
  mouseBubble.x = mouseX;
  mouseBubble.y = mouseY;
  mouseBubble.closest(bubbles);
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
  
  void closest(ArrayList<Bubble> bubbles) {
    
    float closestDist = 200;
    float closestDist2 = 200;
    float closestDist3 = 200;
    float closestDist4 = 200;
    Bubble closestBubble = null;
    Bubble closestBubble2 = null;
    Bubble closestBubble3 = null;
    Bubble closestBubble4 = null;
    
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
      if(current != this && dist(x,y,current.x,current.y) > closestDist && dist(x,y,current.x,current.y) > closestDist2 && dist(x,y,current.x,current.y) < closestDist3) {
        closestDist3 = dist(x,y,current.x,current.y);
        closestBubble3 = current;
      }
      if(current != this && dist(x,y,current.x,current.y) > closestDist && dist(x,y,current.x,current.y) > closestDist2 && dist(x,y,current.x,current.y) > closestDist3 && dist(x,y,current.x,current.y) < closestDist4) {
        closestDist4 = dist(x,y,current.x,current.y);
        closestBubble4 = current;
      }
    }
    if(closestBubble != null && closestBubble2 != null) {
      triangle(x,y,closestBubble.x,closestBubble.y,closestBubble2.x,closestBubble2.y);
    }
    if(closestBubble3 != null && closestBubble4 != null) {
      triangle(x,y,closestBubble3.x,closestBubble3.y,closestBubble4.x,closestBubble4.y);
    }
  }
}

