
//  Infinite draggable space. Use your mouse to drag the screen.
ThingCollection t;
int margin = 80;
int startDragX;
int startDragY;
int deltaX = 0;
int deltaY = 0;
int totDeltaX = 0;
int totDeltaY = 0;
int CX;
int CY;
 
void setup() {
  size(480, 400);
  noStroke();
  smooth();
  colorMode(HSB, 1);
  t = new ThingCollection();
  CX = width / 2;
  CY = height / 2;
  noLoop();
  draw();
}
void draw() {
  background(0);
  t.draw(deltaX, deltaY);
}
void mousePressed() {
  loop();
  startDragX = mouseX;
  startDragY = mouseY;
}
void mouseDragged() {
  deltaX = mouseX - startDragX;
  deltaY = mouseY - startDragY;
}
void mouseReleased() {
  totDeltaX += deltaX;
  totDeltaY += deltaY;
  t.move(deltaX, deltaY);
  deltaX = 0;
  deltaY = 0;
  noLoop();
}

class ThingCollection {
  Thing[] things;
  int amount;
   
  ThingCollection() {
    int sz = 40;
    int amtX = ((width+margin*2) / sz);
    int amtY = ((height+margin*2) / sz);
    int i = 0;
    float rSz = (width+margin*2) / float(amtX);
    amount = amtX * amtY;
    things = new Thing[amount];
    for(int x=0; x<amtX; x++) {
      for(int y=0; y<amtY; y++) {
        things[i++] = new Thing(x*rSz, y*rSz, rSz);
      }
    }
  }
   
  void draw(int x, int y) {
    for(int i=0; i<amount; i++) {
      float nX = x + things[i].x;
      float nY = y + things[i].y;
       
      things[i].checkLimits(nX, nY);
       
      float a = atan2(nY-CY, nX-CX);
      float d = dist(CX, CY, nX, nY);
         
      things[i].setVector(d*cos(a), d*sin(a));
    }
    for(int n=0; n<10; n++) {
      for(int i=0; i<amount; i++) {
        things[i].draw(n);       
      }
    }   
  }
  void move(int x, int y) {
    for(int i=0; i<amount; i++) {
      things[i].move(x, y);
    }
  }
}


class Thing {
  float x;
  float y;
  float ax;
  float ay;
  float maxSz;
  float[] sizes = new float[int(random(1, 10))];
 
  Thing(float x, float y, float maxSz) {
    this.x = x;
    this.y = y;
    this.maxSz = maxSz;
 
    for(int i=0; i<sizes.length; i++) {
      sizes[i] = random(1);     
    }
    sizes[0] = 1.0;
    sizes = reverse(sort(sizes));
  }
  void setVector(float x, float y) {
    ax = x;
    ay = y;
  }
  void draw(int i) {
    if(i < sizes.length) {
      float d = (1-sizes[i])*0.2+0.8;
      float s = sizes[i] * maxSz;     
 
      float hx = x-totDeltaX;
      float hy = y-totDeltaY;
      float hu = (noise(s/110, hx/666, hy/666) * 4) % 1;
      float sa = noise(hu*4 + hy/668, hx/668) * 1.2 - 0.2;
      float br = noise(hu*7 + hy/670, hx/670);
      fill(color(hu, sa, br));
 
      ellipse(CX+ax*d, CY+ay*d, s, s);
    }
  }
  void checkLimits(float x, float y) {
    if(x > width+margin) {
      this.x -= width+margin*2;
    } else if(x < -margin) {
      this.x += width+margin*2;
    }
    if(y > height+margin) {
      this.y -= height+margin*2;
    } else if(y < -margin) {
      this.y += height+margin*2;
    }
  }
  void move(int x, int y) {
    this.x += x;
    this.y += y;
  }
}
