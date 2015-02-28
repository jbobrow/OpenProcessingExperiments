
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Node> graph;


void setup() {

  stroke(0);
  size(500, 500);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));


  graph = new ArrayList<Node>();

  for (int i = 0; i < graph.size(); i++) {
    Node single = graph.get(i);
    physics.addParticle(single);
  }
}


void draw() {
  background(244);
  physics.update();
  
  if(graph.size()>100){
   graph.clear(); 
  }
  
  for (int i = 0; i < graph.size();i++) {
    Node single = graph.get(i);
    single.display();
    if (i != 0) {
      Node previous = graph.get(i-1);
      //float springLength = dist(single.x+3,single.y+3,previous.x-1,previous.y-1);
      physics.addSpring(new VerletSpring2D(previous, single, 24, 0.005));
      //line(single.x,single.y,previous.x,previous.y);
    }
  }
  beginShape();
  stroke(244, 0, 100);
  fill(244, 0, 100);
  
  //vertex(0,height);
  //vertex(width,height);
  
  for (Node single: graph) {
    //noFill();
    vertex(single.x, single.y);
    single.move();
  }
  endShape();
}

void mousePressed() {

  graph.add(new Node(mouseX, mouseY));
}

class Node extends VerletParticle2D {

  Node(float _x, float _y) {
    super(_x, _y);
  } 

  void display() {
    noStroke();
    fill(255, 0, 100);
    ellipse(x, y, 2, 2);
  }

  void move() {
    //x++;
    y+=random(-1, 1);
  }
}



