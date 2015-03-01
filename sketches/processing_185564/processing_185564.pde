
Walker[] w;
int countTime;
void setup() {
  size(640, 480);
  w =  new Walker[10];
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
  frameRate(60);
  background(255);
}

void draw() {
  background(255);
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    fill(230, 255, 255);
    w[i].display();
  }
}
class Walker {
  // if you use test1 or test2, you should write down such as intx; inty;
  float x;
  float y;
  int xx;
  float Subx;
  float Suby;

  int targetX;
  int targetY;

  int wid;

  int targetTime;
  int targetCount;
  PVector[] pos;

  Walker() {
    x = width/2;
    y = height/2;
    targetUpdate();
    wid = 8;
    pos = new PVector[12];
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(atan2(Suby, Subx));
     beginShape();
    vertex(pos[0].x,pos[0].y);
    bezierVertex(pos[1].x,pos[1].y,pos[2].x,pos[2].y,pos[3].x,pos[3].y);
    bezierVertex(pos[4].x,pos[4].y,pos[5].x,pos[5].y,pos[6].x,pos[6].y);
    bezierVertex(pos[7].x,pos[7].y,pos[8].x,pos[8].y,pos[9].x,pos[9].y);
    bezierVertex(pos[10].x,pos[10].y,pos[11].x,pos[11].y,pos[0].x,pos[0].y);
    endShape();
    popMatrix();
  }

  void step() {
    Subx = targetX - x;
    Suby = targetY - y;
    float stepx = 0;
    float stepy = 0;
    stepx = Subx/30;
    stepy = Suby/30;
    x += stepx;
    y += stepy;
    xx = int((abs(stepx)+abs(stepy))*wid/2*abs(sin(millis()*0.02)))+wid;
    targetCount++;
    if (targetTime < targetCount) {
      targetUpdate();
      targetCount = 0;
    }
  float blank = 0.7;
  float tailRate = 0.3;
  pos[0] = new PVector(-xx,0);
  pos[1] = new PVector(-xx,wid*tailRate);
  pos[2] = new PVector(-wid*blank,wid/2);
  pos[3] = new PVector(-wid/2,wid/2);
  pos[4] = new PVector(-wid*(1-blank),wid/2);
  pos[5] = new PVector(0,wid/2-blank);
  pos[6] = new PVector(0,0);
  pos[7] = new PVector(0,-wid/2+blank);
  pos[8] = new PVector(-wid*(1-blank),-wid/2);
  pos[9] = new PVector(-wid/2,-wid/2);
  pos[10] = new PVector(-wid*blank,-wid/2);
  pos[11] = new PVector(-xx,-wid*tailRate);
  
  }

  void targetUpdate() {
    targetX = int(x+random(-300, 300));
    targetY = int(y+random(-300, 300));
    if (targetX>width) {
      targetX = width - targetX%width;
    } else if (targetX<0) {
      targetX *= -1;
    }
    if (targetY>height) {
      targetY = height - targetY%height;
    } else if (targetY<0) {
      targetY *= -1;
    }
    targetTime = int(random(20, 100));
    targetCount = 0;
  }
}
