
/* @pjs preload="test.svg"; 
 */

PShape svg;
PShape polygon;
int sideLength = 500;
PVector[] originalVertexes;
int vertexCount;
float minX = -100, maxX = 500, minY = -100, maxY = 500;

void setup() {
  size(500, 500);  
  svg = loadShape("test.svg");
  polygon = svg.getChild("layer1").getChild("polygon");
  vertexCount = polygon.getVertexCount();
  
  originalVertexes = new PVector[8];
  for (int i = 0; i < vertexCount; i++) {
    PVector vertex = polygon.getVertex(i);
    originalVertexes[i] = new PVector(vertex.x, vertex.y);
  }
} 

void draw(){
  background(0);
  
  for (int i = 0; i < vertexCount; i++) {
    PVector vertex = originalVertexes[i];
    float x = vertex.x + random(-3.0, 3.0);
    float y = vertex.y + random(-3.0, 3.0);
    
    if (x < minX) x = minX;
    if (x > maxX) x = maxX;
    if (y < minY) y = minY;
    if (y > maxY) y = maxY;
    
    vertex.x = x;
    vertex.y = y;
    
    polygon.setVertex(i, vertex.x, vertex.y);
  }
  
  shape(svg, 0, 0, 500, 500);
}


