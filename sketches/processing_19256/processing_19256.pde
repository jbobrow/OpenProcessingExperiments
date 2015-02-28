
//Import the libraries.
import wblut.math.*;
import wblut.hemesh.modifiers.*;
import wblut.hemesh.kdtree.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.tools.*;
import wblut.hemesh.*;
import wblut.hemesh.subdividors.*;
import wblut.geom.*;
import toxi.geom.*;
import peasy.*;
import processing.opengl.*;

ArrayList meshes = new ArrayList();
ArrayList Agents = new ArrayList();
int AgentPop = 300;
PeasyCam cam;
HEC_Creator boxCreator;
HE_Mesh bottomBox;
HE_Mesh topBox;

void setup() {
  size(800,800,P3D);
  background(255,255,255);
  cam = new PeasyCam(this,700);
  boxCreator = new HEC_Box(this).setWidth(width).setWidthSegments(2)
    .setHeight(height).setHeightSegments(2).setDepth(50).setDepthSegments(1);
  boxCreator.setCenter(400,400,25);
  bottomBox = new HE_Mesh(boxCreator);
  meshes.add(bottomBox);
  boxCreator = new HEC_Box(this).setWidth(width).setWidthSegments(2)
    .setHeight(height).setHeightSegments(2).setDepth(50).setDepthSegments(1);
  boxCreator.setCenter(400,400,775);
  topBox = new HE_Mesh(boxCreator);
  meshes.add(topBox);

  for (int i = 0; i < AgentPop; i++) {
    tAgents a = new tAgents(new Vec3D(random(800),random(800),random(50,750)),5,0.2);
    Agents.add(a);
  }
}

void draw() {
  frameRate(60);
  background(25);
  lights();
  fill(125);
  noStroke();
  bottomBox.drawFaces();
  stroke(0);
  bottomBox.drawEdges();
  fill(125);
  noStroke();
  topBox.drawFaces();
  stroke(0);
  topBox.drawEdges();
  noStroke();
  for (int i = 0; i < Agents.size(); i++) {
    tAgents a = (tAgents) Agents.get(i);
    a.update(Agents, meshes);
    a.render();
  }
  stroke(255,0,0);
  line(0,0,0,50,0,0);
  stroke(0,255,0);
  line(0,0,0,0,50,0);
  stroke(0,0,255);
  line(0,0,0,0,0,50);
}


