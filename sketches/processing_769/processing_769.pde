
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
 
Physics physics;
float x1, y1, x2, y2;
boolean sizeSet; int count = 0; // to work around threading problems with size
 
void setup() {
  size(500, 300, P3D);
  frameRate(60);
  sizeSet = false;
}
 
void draw() {
   
  // hack to make sure that the sketch size is fully initialized
  ++count;
  if ( (!sizeSet && count > 10) ) {
    initScene();
  }
   
}
 
void mouseDragged() {
  if (mouseButton == LEFT) {
    x2 = mouseX;
    y2 = mouseY;
  }
}
 
void mouseReleased() {
  if (mouseButton == LEFT) {
    Body randomBod = physics.createRect(x1, y1, x2, y2);
    x2 = 0; y2 = 0;
  }
}
 
void mousePressed() {
  if (mouseButton == LEFT) {
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
  }
}
 
void initScene() {
  physics = new Physics(this, width, height);
  physics.setDensity(1.0f);
  physics.setCustomRenderingMethod(this, "sketchBlocks");
  sizeSet = true;
}
 
void sketchBlocks(World w) {
  if (frameCount%10 != 0) return;
  background(255);
  noFill(); stroke(0);
  for (Body body = physics.getWorld().getBodyList(); body != null; body = body.getNext()) {
    org.jbox2d.collision.Shape shape;
    for (shape = body.getShapeList(); shape != null; shape = shape.getNext()) {
 beginShape();
 if (shape.getType() == ShapeType.POLYGON_SHAPE) {
   PolygonShape poly = (PolygonShape)shape;
   int count = poly.getVertexCount();
   Vec2[] verts = poly.getVertices();
   for(int i = 0; i < count; i++) {
     Vec2 vert = physics.worldToScreen(body.getWorldPoint(verts[i]));
     vertex(vert.x, vert.y);
   }
   Vec2 firstVert = physics.worldToScreen(body.getWorldPoint(verts[0]));
   vertex(firstVert.x, firstVert.y);
   for(int i = 0; i < count; i++) {
     Vec2 vert = physics.worldToScreen(body.getWorldPoint(verts[i]));
     vertex(vert.x-2+int(random (4)), vert.y-2+int(random(4)));
   }
   firstVert = physics.worldToScreen(body.getWorldPoint(verts[0]));
   vertex(firstVert.x, firstVert.y);
 }
 endShape();
    }
  }
  if (mousePressed && mouseButton == LEFT) {
    rect(x1, y1, x2-x1, y2-y1);
  }
}

