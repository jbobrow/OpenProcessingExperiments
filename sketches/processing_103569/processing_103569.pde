
int nbNode = 20;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Node> lst;
float speed = 3f;

void setup() {
  size(640,480);
  colorMode(HSB);
  frameRate(60);
  noStroke();
  smooth();
  for (int i = 0; i < 10; ++i) {
    Node n = new Node();
    n.populate(0);
    nodes.add(n);
  }
  lst = getAllNode(nodes);
}

void repulseForce(float alpha) {
  
  //repulsive force between node
  for(int i = 0; i < lst.size(); ++i) {
    Node n1 = lst.get(i);
    for (int j = i + 1; j < lst.size();++j) {
        Node n2 = lst.get(j);
        float dx = n2.x - n1.x;
        float dy = n2.y - n1.y;
        
        if (dx == 0 && dy == 0) {
           dx = (float)random(0.0f,1.0f) - 0.5f;
           dy = (float)random(0f,1.0f) - 0.5f; 
        }
        
        float disSquared = dx * dx + dy * dy;
        float dist = sqrt(disSquared);
        float force = alpha / disSquared;
        
        dx *= force/dist;
        dy *= force/dist;
        
        n1.forceX -= dx;
        n1.forceY -= dy;
        n2.forceX += dx;
        n2.forceY += dy;
    }
  } 
}

void update() {
  
  repulseForce(0.002f);
  
  for(int i =0; i < lst.size(); ++i) {
     Node n = lst.get(i);
     float dx = speed * n.forceX;
     float dy = speed * n.forceY;
     float sqrtDist = dx * dx + dy * dy;
     
     if (sqrtDist > 100) {
        float s = 10 / (float)sqrt(sqrtDist);
       dx *= s;
       dy *= s; 
     }
     
     n.x += dx;
     n.y += dy;
  }
}

void draw() {
  background(0,0,160);
  update();
  pushMatrix();
  for (int i = 0; i < nodes.size();++i)
    nodes.get(i).display();
  popMatrix();
}

ArrayList<Node> getAllNode(ArrayList<Node> n) {
    ArrayList<Node> lst = new ArrayList<Node>();
    
    for (int i = 0; i < n.size(); ++i) {
      Node node = n.get(i);
      if (node.childs.size() > 0) {
          lst.addAll(getAllNode(node.childs));
      }
      else {
          lst.add(node); 
      }
    }
    lst.addAll(n);
    return lst;  
}



class Node {
  float radius, x, y, forceX, forceY;
  color bg;
  ArrayList<Node> childs;
  Node() {
    radius = random(50) + 1;
    x = random(width/2) + (width/4);
    y = random(height/2) + (height/4);
    forceX = 0;
    forceY = 0;
    childs = new ArrayList<Node>();
    bg = color(random(0, 360), 255, 255,100);
  }
  
  void populate(int degree) {
    if (degree < 4) {
      int max = (int)random(10);
      for(int i = 0; i < max; ++i) { 
         Node n = new Node();
         n.populate(++degree);
         childs.add(n); 
      }
    }
  }
  
  void display() {
   fill(bg);
   ellipse(x,y,radius,radius);
   for (int i = 0; i < childs.size(); ++i)
     childs.get(i).display();
  }
}
