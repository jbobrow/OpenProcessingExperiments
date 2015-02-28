
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Node> graph;
float distance = 20;
float strength = 0.1;

void setup() {
//frameRate(5000);
  stroke(0);
  size(1500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  graph = new ArrayList<Node>();

  

  for (int i = 0; i < graph.size(); i++) {
    Node single = graph.get(i);
   
  }
}


void draw() {
  background(244);
  physics.update();
  
  if(graph.size()>50){
   graph.clear(); 
  }
    
  for (int i = 0; i < graph.size();i++) {
    Node single = graph.get(i);
    single.display();
    single.move();
    
    //AttractionBehavior behavior = new AttractionBehavior(single,width,1);
   
    if(single.x>width){
     graph.remove(i);
     graph.add(new Node(0, single.y));
     
    }
    
    
    if (i != 0) {
      Node previous = graph.get(i-1);
      //float springLength = 12;
      
      float springLength = dist(single.x,single.y,previous.x,previous.y);
      //springLength = constrain(springLength,0,100);
      physics.addSpring(new VerletSpring2D(previous, single, springLength, 0.05));
      //line(single.x,single.y,previous.x,previous.y);
    }
  }
  beginShape(TRIANGLE_STRIP);
  stroke(244, 0, 100);
  fill(244, 0, 100);
  
 //vertex(0,height);
 // vertex(width,height);
  
  for (Node single: graph) {
    //noFill();
    
    vertex(single.x, single.y);
    single.move();
  }
  endShape();
}

void mouseDragged() {

  graph.add(new Node(mouseX, mouseY));
}

class Node extends VerletParticle2D {

  Node(float _x, float _y) {
    super(_x, _y);
    physics.addParticle(this);
    AttractionBehavior behavior = new AttractionBehavior(this,10,0.11);
    physics.addBehavior(behavior);
  } 

  void display() {
    noStroke();
    fill(255, 0, 100);
    ellipse(x, y, 2, 2);
  }

  void move() {
    //x+=0.5;
    y+=random(-1, 1);
  }
}



