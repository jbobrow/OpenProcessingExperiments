
import saito.objloader.*;
PGraphics g1, g2, g3, g4, g;
float rotX=0;
float rotY=0;
PVector camPosition;
OBJModel myModel;
void setup() {
  size(900,500);
  g1 = createGraphics(width/4,height/2,P2D);
  g2 = createGraphics(width/4,height/2,P2D);
  g3 = createGraphics(width/4,height/2,P2D);
  g4 = createGraphics(width/4,height/2,P3D);
  g  = createGraphics(width/2,height,P3D);
  camPosition = new PVector(0.0,0.0,0.5);
  g1.rectMode(CENTER);
  g2.rectMode(CENTER);
  g3.rectMode(CENTER);
  myModel = new OBJModel(this,"cabeza.obj","relative");
}
void mouseDragged() {
  if(mouseX>g1.width+g2.width) {
    rotX+=(mouseX-pmouseX)*0.01;
    rotY-=(mouseY-pmouseY)*0.01;
  }
  if(mouseX<g1.width && mouseY<g1.height) {
    float u = (float) (mouseX-g1.width/2)/ (float) (g1.width/2);
    float v = (float) (mouseY-g1.height/2)/ (float) (g1.height/2);
    if(maxDist(camPosition,new PVector(u,v,0))<10) {
      camPosition.x = u;
      camPosition.y = v;
    }
  }
  if(mouseX>g1.width && mouseX<g1.width+g2.width && mouseY<g2.height) {
    float u = (float) ((mouseX-g1.width)-g2.width/2)/ (float) (g2.width/2);
    float v = (float) (mouseY-g2.height/2)/ (float) (g2.height/2);
    if(maxDist(camPosition,new PVector(u,0,v))<10) {
      camPosition.x = u;
      camPosition.z = v;
    }
  }
  if(mouseX<g3.width && mouseY>g1.height) {
    float u = (float) (mouseX-g3.width/2)/ (float) (g1.width/2);
    float v = (float) ((mouseY-g1.height)-g3.height/2)/ (float) (g1.height/2);
    if(maxDist(camPosition,new PVector(0,u,v))<10) {
      camPosition.y = u;
      camPosition.z = v;
    }
  }
}
void draw() {
  background(255);
  updateG1();
  updateG2();
  updateG3();
  updateG4();
  updateG();
  image(g1,0,0,g1.width,g1.height);
  image(g2,g1.width,0,g2.width,g2.height);
  image(g3,0,g1.height,g3.width,g3.height);
  image(g4,g1.width,g1.height,g4.width,g4.height);
  image(g,g1.width+g2.width,0,g.width,g.height);
  strokeWeight(2);
  stroke(255,0,0);
  line(width/4,0,width/4,height);
  line(0,height/2,width/2,height/2);
  line(width/2,0,width/2,height);
}
void plotGrid(int numLines, PGraphics g) {
  for(int i=0;i<=numLines;i++) {
    float u = (float) i / (float) (numLines);
    float x =(1-u)*(-g.width/2)+u*(g.width/2);
    float y =(1-u)*(-g.height/2)+u*(g.height/2);
    g.line(x,-g.height/2,x,g.height/2);
    g.line(-g.width/2,-y,g.width/2,-y);
  }
}
void plot3DGrid(int numLines, PGraphics g,float gridSize) {
  for(int i=0;i<=numLines;i++) {
    float u = (float) i / (float) (numLines);
    float x = (1-u)*(-g.width*gridSize)+u*(g.width*gridSize);
    float y = (1-u)*(-g.width*gridSize)+u*(g.width*gridSize);
    g.line(x,0,-g.width*gridSize,x,0,g.width*gridSize);
    g.line(-g.width*gridSize,0,-y,g.width*gridSize,0,-y);
  }
}
float maxNorm(PVector p) {
  return max(abs(p.x),abs(p.y),abs(p.z));
}
float maxDist(PVector p, PVector q) {
  return maxNorm(PVector.sub(p,q));
}

void plotOBJModel(PGraphics g, OBJModel m,float scalingFactor) {
  g.fill(150,150);
  g.stroke(0);
  for(int i=0;i<m.getSegmentCount();i++) {
    Segment s = m.getSegment(i);
    Face[] faces = s.getFaces();
    for(int j=0;j<faces.length;j++) {
      PVector[] verts = faces[j].getVertices();
      g.beginShape();
      for(int k=0;k<verts.length;k++)
        g.vertex(verts[k].x*scalingFactor,verts[k].y*scalingFactor,verts[k].z*scalingFactor);
      g.endShape(CLOSE);
    }
  }
}
void plotOBJModelProjection(PGraphics g, OBJModel m, float scalingFactor, char c) {
  g.fill(150,150);
  g.stroke(0);
  for(int i=0;i<m.getSegmentCount();i++) {
    Segment s = m.getSegment(i);
    Face[] faces = s.getFaces();
    for(int j=0;j<faces.length;j++) {
      PVector[] verts = faces[j].getVertices();
      g.beginShape();
      for(int k=0;k<verts.length;k++) {
        if(c == 'x')
          g.vertex(verts[k].y*scalingFactor,verts[k].z*scalingFactor);
        if(c == 'y')
          g.vertex(verts[k].x*scalingFactor,verts[k].z*scalingFactor);
        if(c == 'z')
          g.vertex(verts[k].x*scalingFactor,verts[k].y*scalingFactor); 
        
      }
      g.endShape(CLOSE);
    }
  }
}


