
import org.processing.wiki.triangulate.*;

private ArrayList<Triangle> triangles;
private ArrayList<PVector> nodes;

private final int NUMNODES = 300;

public void setup()
{
  size(500,500,P3D);
  background(255);
  smooth();
  stroke(0,0,0,200);
  frameRate(30);
  
  nodes = new ArrayList<PVector>();
  for(int i = 0; i < NUMNODES; i++) {
    nodes.add(new PVector(random(width/2)+width/4,random(height/2)+height/4,0));
  }
  
  triangles = Triangulate.triangulate(nodes);
  
}
public void draw()
{
  background(255);
  int i = 0;
  for(Triangle triangle : triangles) {
    beginShape();
    if((i % 20) == 0) {
      fill(200);
    }
    else {
      noFill();
    }
    vertex(triangle.p1.x, triangle.p1.y);
    vertex(triangle.p2.x, triangle.p2.y);
    vertex(triangle.p3.x, triangle.p3.y);
    endShape();
    i++;
  }
  updateNodes();
}

public void updateNodes()
{
  for(PVector node : nodes) {
    node.set(node.x + random(2)-1, node.y + random(2)-1,
      0);
  }
  triangles = Triangulate.triangulate(nodes);
}



