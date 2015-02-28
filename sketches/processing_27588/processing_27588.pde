
ParticuleNode[] pnodes;
int nbNodes = 50;
float damp = 0.0005;
float g = 10;
float closeDistance = 100;
float amort = 0.9;
void setup () {
  size(500, 500);
  background(0);
  smooth();
  noFill();
  frameRate(25);
  pnodes = new ParticuleNode[nbNodes];
  for (int i = 0; i < nbNodes; i++) {
    pnodes[i] = new ParticuleNode(i);
  }
}

void draw () {
  background(0);
  for (int i = 0; i < nbNodes; i++) {
    pnodes[i].move();
    for (int j = i + 1; j < nbNodes; j++) {
      float dist = distance(pnodes[i], pnodes[j]); 
      if (dist < closeDistance) {
        stroke(255, 0, 0, 255 * (1 - (dist / closeDistance)));
        strokeWeight(1);
        ellipse((pnodes[i].x + pnodes[j].x) / 2, (pnodes[i].y + pnodes[j].y) / 2, dist, dist);
        pnodes[i].vx += pnodes[j].vx * (closeDistance / dist) * (damp * 20);
        pnodes[i].vy += pnodes[j].vy * (closeDistance / dist) * (damp * 20);
      }
    }
    pnodes[i].draw();
  }
}

float distance (ParticuleNode a, ParticuleNode b) {
  float dx = a.x - b.x;
  float dy = a.y - b.y;
  return sqrt((dx * dx) + (dy * dy));
}

class ParticuleNode {
  float x, y, vx, vy;
  int index;

  ParticuleNode (int i) {
    index = i;
    initRandom();
  }

  void init (float ix, float iy, float ivx, float ivy) {
    x = ix;
    y = iy;
    vx = ivx;
    vy = ivy;
  }

  void initRandom () {
    x = random(width);
    y = random(height);
    vx = random(-1000, 1000);
    vy = random(-1000, 100);
  }

  void draw () {
    stroke(255);
    strokeWeight(2);
    // point(x, y);
  }

  void move () {
    vy += g;
    x += vx * (damp / 2);
    y += vy * (damp / 2);
    if (x < 0 || x > width) {
      vx = (1 - vx) * amort;
      x = min(width, max (0, x));
    }
    if (y < 0 || y > height) {
      vy = (1 - vy) * amort;
      y = min(height, max (0, y));  
    }
  }
}

