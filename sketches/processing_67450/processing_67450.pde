
import jto.p5graphtheory.*;
import traer.physics.*;

Particle mouse, a;
ParticleSystem physics;
ArrayList<Particle> particles;
Graph graph;

void setup()
{ 
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
  ellipseMode(CENTER);
  noStroke();
  //noCursor();
  
  physics = new ParticleSystem();
  mouse = physics.makeParticle();
  mouse.makeFixed();
  a = physics.makeParticle(1.0, random(0, width), 
    random(0, height), 0);
  
  physics.makeAttraction (mouse, a, 10000, 10);
  
  particles = new ArrayList<Particle>();
  
 
}

void draw()
{
  mouse.position().set(mouseX, mouseY, 0);
  for(Particle p : particles) {
    handleBoundaryCollisions(p);
    
  }
  physics.tick();
  
  fill(255,255,255,20);
  rect(-1,-1,width+1,height+1);
  graph = new Graph();
  stroke(0,0,0,100);
  strokeWeight(1);
//  noFill();
//  ellipse(mouse.position().x(), mouse.position().y(), 10, 10);
  Collection<Vertex> vertices = new TreeSet<Vertex>();
  for(Particle p : particles) {
    fill(0,0,0,200);
    ellipse(p.position().x(), p.position().y(), 5, 5);
    Vertex v = new Vertex(p.position().x(), p.position().y());
    graph.addVertex(v);
  }
  if(graph.getVertices().size() > 0) {
    
    for(Vertex a : graph.getVertices()) {
     for(Vertex b : graph.getVertices()) {
       if(true) {
       Edge e = new Edge(a, b);
       graph.addEdge(e);
       a.addIncidentEdge(e);
       b.addIncidentEdge(e); 
       }
     }
    }
  graph = Graph.minimalSpanningTree(graph);
  for(Edge e : graph.getEdges()) {
    line(e.getVertexA().getX(), e.getVertexA().getY(),
      e.getVertexB().getX(), e.getVertexB().getY()); 
  }}
}


void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.velocity().set( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.velocity().set( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0, width ), 
    constrain( p.position().y(), 0, height ), 0 ); 
}

void mousePressed()
{
  Particle p = physics.makeParticle(1.0, mouseX, mouseY, 0);
  physics.makeAttraction(mouse, p, 1000, 10);
  particles.add(p);
  for(int i = 0; i < particles.size(); i ++) {
      if( !(particles.indexOf(p) == i) ) {
        physics.makeAttraction(p, particles.get(i), -1000, 5);
      }
    }
}

void keyPressed()
{
  saveFrame("Faders####.jpeg");
}

