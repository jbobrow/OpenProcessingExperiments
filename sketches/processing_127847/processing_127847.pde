
int nodecount = 100;
Node[] nodes = new Node[nodecount];
float speed = 10.0, rate = random(1.001, 1.02);
int tw, th;
boolean stopped;

void setup() {
  size(920,450);
  stopped = false;
  background(255);
  noStroke();
  smooth();
  nodecount = (int)random(10, 100);
  tw = (int)random(-width/3, width/3);
  th = (int)random(-height/3, height/3);
  for(int count = 0; count < nodecount; count++)
    nodes[count] = new Node();
}

void draw() {
  translate(tw, th);
  if(1/speed > 0.02) {
    for(int count = 0; count < nodecount; count++) {
      Node nearest = sort(nodes, count);
      if (dist(nodes[count].loc.x,nodes[count].loc.y,nearest.loc.x,nearest.loc.y) < nodes[count].optimal) {
        nodes[count].vel.x = -(nearest.loc.x-nodes[count].loc.x)/speed;
        nodes[count].vel.y = -(nearest.loc.y-nodes[count].loc.y)/speed;
      }
      else {
        nodes[count].vel.x = (nearest.loc.x-nodes[count].loc.x)/speed;
        nodes[count].vel.y = (nearest.loc.y-nodes[count].loc.y)/speed;
      }
      nodes[count].update(); 
      fill(color(nodes[count].r+random(-3, 3), 
              nodes[count].g+random(-3, 3),
              nodes[count].b+random(-3, 3),
              random(50, 150)));
      line(nearest.loc.x,nearest.loc.y,nodes[count].loc.x,nodes[count].loc.y); 
    }
  }
  else
    stopped = true;
  speed *= rate;
}

Node sort(Node[] n, int c) {
  Node nearest = null;
  float smallest = 10000000;
  for(int count = 0; count < nodecount; count++)
    if (abs(dist(n[count].loc.x,n[count].loc.y,n[c].loc.x,n[c].loc.y)-n[c].optimal)
          < smallest && count != c) {
      nearest = n[count];
      smallest = abs(dist(n[count].loc.x,n[count].loc.y,n[c].loc.x,n[c].loc.y)-n[c].optimal);
    }
  return nearest;
}

void line(float x1, float y1, float x2, float y2) {
  for(int count = 0; count < 30; count++) {
    ellipse(x1+count*(x2-x1)/30.0+random(-2, 2),y1+count*(y2-y1)/30.0+random(-2, 2), random(0.5, 100), random(0.5, 300));
    ellipse(x1+count*(x2-x1)/30.0+random(-2, 2),y1+count*(y2-y1)/30.0+random(-2, 20), random(0.5, 3), random(0.5, 3));
  }
}

//void mousePressed() {
  //background(255);
  //nodecount = (int)random(10, 100);
  //stopped = false;
  //tw = (int)random(-width/2, width/2);
  //th = (int)random(-height/2, height/2);
  //speed = 10;
  //rate = random(1.001, 1.02);
  //for(int count = 0; count < nodecount; count++)
   // nodes[count] = new Node();
//}

class Node {
  float optimal;
  PVector loc, vel;
  float r, g, b;
  
  Node() {
    optimal = 120;
    float theta = random(360);
    float radius = height/3.0;
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    r = random(255);
    g = random(25);
    b = random(25);
  }
  
  void update() {
    loc.add(vel);
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
 
