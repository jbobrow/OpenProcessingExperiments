
int num = 50;

Node[] nodes = new Node[num];
PFont helB;

void setup(){
  size(640,150, JAVA2D);
  smooth();
  for (int i=0; i<num; i++){
    nodes[i] = new Node(random(0, width), random(0, height), random(-4, 4), random(-4, 4), 3, 100, random(0.05, 0.2), i, nodes);
  }
  helB = loadFont("Helvetica-Bold-48.vlw");
  textFont(helB, 36);
}

void draw(){
  background(0);

  for(int i=0; i<num; i++){
    nodes[i].generate();
    nodes[i].move();
    nodes[i].proxy();
  }
  float v = abs(sin(millis()*0.001)*200);
  fill(255, v);
  noStroke();
  rect(width-350, height-35, 342, 23);
  fill(0);
  text("EXCHANGE DUBLIN", width-355, height-10);
}

void mousePressed(){
  setup();
}

class Node{
  float xpos, ypos;
  float vx, vy;
  float r;
  float minDist;
  float gravity;
  int id;
  Node[] others;

  Node(float ix, float iy, float ivx, float ivy, float ir, float iMin, float ig, int idin, Node[] ioth){
    xpos = ix;
    ypos = iy;
    vx = ivx;
    vy = ivy;
    r = ir;
    minDist = iMin;
    gravity = ig;
    int id;
    others = ioth;
  }

  void generate(){
    fill(255);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, r, r);
  }

  void proxy(){
    for (int i = id+1; i<num; i++){
      float dx = others[i].xpos - xpos;
      float dy = others[i].ypos - ypos;
      float distance = sqrt(dx*dx+dy*dy);

      if (distance<minDist){
        stroke(255, 255-(distance*2.55));
        strokeWeight(0.2);
        line(xpos, ypos, others[i].xpos, others[i].ypos);
      }
    }
  }

  void move(){
    xpos = xpos+vx;
    ypos = ypos+vy;
    if (xpos > width || xpos < 0) {
      vx = vx * -0.99;
    }
    if (ypos > height || ypos < 0) {
      vy = vy * -0.99;
    }
  }
}



