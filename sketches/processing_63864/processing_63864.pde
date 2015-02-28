
LinkedList<PVector> nodes;
PVector prevNode;

void setup() {
  size(500,500, P3D);
  fill(204);
  nodes = new LinkedList<PVector>();
  nodes.add(new PVector(random(50),random(50),random(50))); 
  background(0);
  prevNode = nodes.get(0);
  strokeWeight(2);
}
float dy = 0;
void draw() {
  lights();
  background(255);
  rotateX(dy);
  rotateY(-dy);
  rotateZ(.5 * dy);
  stroke(0,0,0,50);
  for(PVector node : nodes) {
    
    line(prevNode.x,prevNode.y,prevNode.z,node.x,node.y,node.z);
    prevNode.set(node.x,node.y,node.z);
  }
  // Change height of the camera with mouseY
  camera(20.0, mouseY + 100, 50.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         1.0, 1.0, 1.0); // upX, upY, upZ
  nodes.add(new PVector(nodes.peekLast().x + random(10)-5,
                        nodes.peekLast().y + random(10)-5,
                        nodes.peekLast().z + random(10)-5));
  dy += PI/256;
  if(nodes.size() > 2000) {
    nodes.remove((int) random(nodes.size()-1));
  }
}

