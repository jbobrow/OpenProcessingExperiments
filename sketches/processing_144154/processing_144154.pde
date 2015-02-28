
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

class Node {
    PVector pos;
    PVector deltaPos;
    float mass;
    
    Node(float x, float y, float m) {
        pos = new PVector(x, y);
        mass = m;
        deltaPos = new PVector;
    }
    
    void push(PVector force) {
        deltaPos.add(force);
        pos.add(force);
    }
    
    void step(float dt) {
        pos.add(PVector.mult(deltaPos, dt));
    }
}

class Edge {
    Node node1;
    Node node2;
    float stiffness;
    float length;
    
    Edge(Node n1, Node n2, float s) {
        node1 = n1;
        node2 = n2;
        length = PVector.dist(n1.pos, n2.pos);
        stiffness = s;
    }
    
    void step(float dt) {
        PVector d = PVector.sub(node1.pos, node2.pos);
        float l = d.mag();
        d.mult(1.0 / (l + 0.0000001));
        l -= length;
        float c = node1.mass + node2.mass;
        PVector d1 = PVector.add(PVector.mult(node1.pos, node1.mass / c), PVector.mult(node2.pos, node2.mass / c));
        
    }
}
