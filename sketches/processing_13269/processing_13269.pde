
int sizex = 600;
int sizey = 500;
float x;
float y;
float drag = 30;
int w = 20;
int shade = 0;

MCircle M1 = new MCircle(7);
MCircle M2 = new MCircle(0.5);


void setup() {
  size(sizex,sizey);
}

void draw() {
  background(225);
  stroke(0);
  M1.update();
  M2.update();
  
  float difx = mouseX - x;
  if (abs(difx) > 1) {
    x = x + difx/drag;
    x = constrain(x,0,width);
  }
  
  float dify = mouseY - y;
  if (abs(dify) > 1) {
    y = y + dify/drag;
    y = constrain(y,0,width);
  }
}

class MCircle {
  float cscale;
  MCircle (float fat) {
    cscale = fat;
  }
  void update() {
    noStroke();
    ellipseMode(CENTER);
    if (w > sizex + 200) { 
      w = 0; 
    } 
    w = w += cscale;
    fill(shade + 200);
    ellipse(x,y,shade + w + 160,shade + w + 160);
    fill(shade + 150);
    ellipse(x,y,shade + w + 120,shade + w + 120);
    fill(shade + 100);
    ellipse(x,y,shade + w + 80,shade + w + 80);
    fill(shade + 50);
    ellipse(x,y,shade + w + 40,shade + w + 40);
    fill(shade + 0);
    ellipse(x,y,shade + w,shade + w);
  }

}

  void mouseMoved() 
  {
    shade = shade + 5;
    if (shade > 255) {
    shade = 0;
    }
  }

