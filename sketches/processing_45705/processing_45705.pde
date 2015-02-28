
class Tree {
  float level, index;
  float posx;
  float posy;
  float endx;
  float  endy;

  float strokeW, alpha;
  float len, lenChange;

  float rot, rotChange;

  Tree children[] = new Tree[0];

  Tree(float level, float index, float posx, float posy) {
    this.level = level;
    this.index = index;
    strokeW = (1/this.level)*15;
    alpha = 255/this.level;
    len = (1/this.level)*random(300);
    rot = random(360);
    lenChange = random(-2, 2);
    rotChange = random(-2, 2);

    update(posx, posy);

    if (level < maxLevels) {
      children = new Tree[numChildren];
      for (int i =0; i < numChildren; i++) {
        children[i] = new Tree(this.level +1, this.posx, endx, endy);
      }
    }
  }

  void update(float x, float y) {
    this.posx = x;
    this.posy = y;

    rot += rotChange;

    if (rot > 360)
      rot =0;
    else if ( rot < 0)
      rot = 360;

    len -= lenChange;

    if ( len < 0 )
      lenChange *=-0.5;
    else if (len > 300)
      lenChange *= -0.5;

    float radian = radians(rot);

    endx = x + (len*cos(radian));
    endy = y + (len*tan(radian));  

    for (int i = 0; i < children.length; i++) {
      children[i].update(endx, endy);
    }
  }

  void draw() {
    if (level > 1) {
      strokeWeight(strokeW);
      stroke(0, alpha);
      fill(255, alpha);
      line(posx, posy, endx, endy);
    }
    for (int i =0; i< children.length; i++) {
      children[i].draw();
    }
  }
}


