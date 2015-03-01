
//import processing.pdf.*;

int imgNum = 7;

boolean record = false;
boolean md = false;

int numberOfNodes = 200;

Node[] nodes = new Node[numberOfNodes];

void setup() {

  //randomSeed(millis());
  size(700,700); 
  //smooth();
  strokeWeight(1);
  background(255);

  for(int i = 0; i<numberOfNodes; i++) {
   
    float x = random(width), y = random(height);
    nodes[i] = new Node( x + (noise(x*.001,y*.001)*2-1)*10, y + (noise(x*.001,y*.001)*2-1)*10);
  }
}

void draw() {

  //if(record) {
  //  beginRecord(PDF, "nodes4.pdf");
  //}


  background(255);
  for(int t = 0; t<numberOfNodes; t++) {
    nodes[t].display();
  }
  for(int i = 0; i<numberOfNodes-1; i++) {
    for(int c = i+1; c<numberOfNodes; c++) {

      float d = sq(nodes[c].x - nodes[i].x) + sq(nodes[c].y - nodes[i].y);

      if( d < pow(90,2)  ) {
        stroke(0, map(d, 0,pow(100,2), 50, 0)  );
        line(nodes[c].x,nodes[c].y,nodes[i].x,nodes[i].y);

        nodes[i].xv += .00005*(nodes[c].x-nodes[i].x)*nodes[c].radius/nodes[i].radius;
        nodes[i].yv += .00005*(nodes[c].y-nodes[i].y)*nodes[c].radius/nodes[i].radius;
      }
    }
  }

  //if(record) {
    //endRecord();
    //record = false;
  //}
}


void mousePressed() {
  md = true;
}

void mouseReleased() {
  md = false;
}

void keyPressed() {
  record = true;
}

class Node {

  float x,y,xv,yv,radius;

  Node(float xp, float yp) {

    this.radius = random(1,5);
    this.x = xp;
    this.y = yp;
    this.xv = random(-1,1);
    this.yv = random(-1,1);
  }

  void display() {

    this.xv *= .999;
    this.yv *= .999;

    this.x += this.xv;
    this.y += this.yv;

    if(this.x < 0) {
      this.xv+=.1;
    }
    if(this.x > width) {
      this.xv+=-.1;
    }
    if(this.y < 0) {
      this.yv+=.1;
    }
    if(this.y > height) {
      this.yv+=-.1;
    }

    if(this.xv < -5) {
      this.xv=-5;
    }
    if(this.xv > 5) {
      this.xv=5;
    }
    if(this.yv < -5) {
      this.yv=-5;
    }
    if(this.yv > 5) {
      this.yv=5;
    }

    fill(0,0,0);
    stroke(0,0,0);
    ellipse(x, y, radius*2, radius*2);
  }
}



