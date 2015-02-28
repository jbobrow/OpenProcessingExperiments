
//corneel cannaerts 2010
//www.introspector.be

//import libraries
import peasy.*;
import processing.opengl.*;

//global variables
String[] strNodes;
String[] strLinks;
String[] strTriangles;
Node[] nodes;
Link[] links;
Triangle[] triangles;
PeasyCam cam;

PFont font;
float t = 0;
float r = 0.5;
float waveScaleX = 0.005;
float waveScaleY = 0.0080;
boolean timer;

boolean drawNod=true;
boolean drawId=false;
boolean drawLin=true;
boolean drawBas=true;
boolean drawTri=true;

//setup function, runs once at the beginning 
void setup() {
  size(900,500,OPENGL);
  smooth();
  curveTightness(0.5);
  cam = new PeasyCam(this,455,300,0,600);
  font = loadFont("LucidaConsole-16.vlw");
  textFont(font, 16); 
  initMesh();
}

//draw function, runs continiuosly
void draw() {
  background(0);
  lights();
  //update and draw the nodes
  for(int i=0; i<nodes.length; i++) {
    nodes[i].update();
    if(drawNod)nodes[i].render();
    if(drawId) nodes[i].renderId();
  }
  //update and draw the links
  for(int i=0; i<links.length; i++) {
    links[i].update();
    if(drawLin)links[i].render();
    if(drawBas)links[i].renderBase();
  }
  //update and draw the triangles
  for(int i=0; i<triangles.length; i++) {
    if(drawTri)triangles[i].render();
  }
  //advance timer
  if(timer)t += 5;
}




void initMesh() {
  //loads data from textfiles and generate geometry
  //initialise nodes 
  strNodes = loadStrings("nodes.txt");
  nodes = new Node[strNodes.length];
  for (int i=0; i < strNodes.length; i++) {
    float[] coord = float(split(strNodes[i], ','));
    nodes[i] = new Node(coord[1],coord[2],140*noise(coord[1]*waveScaleX,coord[2]*waveScaleY,t),i);
  }
  //initialise links 
  strLinks = loadStrings("links.txt");
  links = new Link[strLinks.length];
  for (int i=0; i < strLinks.length; i++) {
    int[] index = int(split(strLinks[i], ','));
    links[i] = new Link(nodes[index[0]],nodes[index[1]]);
  }
  //initialise triangles 
  strTriangles = loadStrings("triangles.txt");
  triangles = new Triangle[strTriangles.length];
  for (int i=0; i < strTriangles.length; i++) {
    int[] index = int(split(strTriangles[i], ','));
    triangles[i] = new Triangle(nodes[index[0]],nodes[index[1]],nodes[index[2]]);
  }
}


// keyboard control
void keyPressed() {
  if (key == 's' || key == 'S') {
    //saveFrame("kinetic-####" + random(1000)+".tif");
  }
  else if (key == 'p' || key == 'P') {
    timer = !timer;
  }
  else if (key == 'n' || key == 'N') {
    drawNod = !drawNod;
  }
  else if (key == 'i' || key == 'I') {
    drawId = !drawId;
  }
  else if (key == 'l' || key == 'L') {
    drawLin = !drawLin;
  }
  else if (key == 'b' || key == 'B') {
    drawBas = !drawBas;
  }
  else if (key == 't' || key == 'T') {
    drawTri = !drawTri;
  }
  else if (key == 'o' || key == '0') {
    if(r<1) r += 0.01;
    println(r);
  }
  else if (key == 'c' || key == 'C') {
    if(r>0) r -= 0.01;
    println(r);
  }
}


