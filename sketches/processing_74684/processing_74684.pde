
class Bubble {
  float x;
  float y;
  float wh;
  float yVel;  
  float a;

void setupBubble() {
    x = random(width);
    y = random(height*2);
    wh = random(1, 30);
    yVel = random(0.01, 0.08);
    a = random(100, 150);
}

void drawBubble() {
  fill(255, a);
  ellipse(x,y,wh,wh);
}

void updateBubble() {
  y -= yVel;
}
  
  
}


