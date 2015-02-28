
///solidFlow////Alejandro González//60rpm.tv/////Dominio Púbico/////////////////
////////////////////////////////////////////////////////////////////////////////
//Quite simple idea: simulation of a solid flowing, mapping lights and shadows//
//onto a moving delaunay grid.//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

import org.processing.wiki.triangulate.*;   //qhull algorithm delaunay library

ArrayList<P> particles;
ArrayList<PVector> locations;
ArrayList<Triangle> triangles;

int 
n=200,        //number of vertexes
m=100,        //we'll add some margin to provoke an overflow of the canvas
CR=360;       //colorMode range
float 
f=.01;        //noise factor
color
BG=#AAAAAA;   //background color
PVector center;


void setup() {
  //general settings
  size(1000,500,P2D);     //use P2D in order to degrade color per vertex
  frameRate(24);          //less frames for a grateful laptop
  noCursor();
  noiseDetail(3,.75);     //smooth transitions with some peaks
  background(BG);
  colorMode(HSB,CR);
  smooth();
  //object settings
  triangles=new ArrayList<Triangle>();
  particles=new ArrayList<P>();
  locations=new ArrayList<PVector>();
  for (int i=0; i<n; i++) {
    particles.add(new P(random(width),random(height)));
  }
}

void draw() {
  //we don't use background here, cause this way lines are almost invisible
  updateMesh();
  drawMesh();
}

//Main methods//////////////////////////////////////////////////////////////

void updateMesh() {
  locations.clear();
  for (P current:particles){
    current.update();
    locations.add(current.location());
  }
  triangles=Triangulate.triangulate(locations); 
}
  
void drawMesh() { 
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i++) {
    //I've used perlin to map grayscale colors to
    //the grid. This way we simulate coherent 
    //light transitions over it. 
    Triangle t = triangles.get(i);
    float col1=noise(t.p1.x*f,t.p1.y*f)*CR;  
    fill  (col1); stroke(col1); 
    vertex(t.p1.x,t.p1.y);
    float col2=noise(t.p2.x*f,t.p2.y*f)*CR;
    fill  (col2); stroke(col2);
    vertex(t.p2.x, t.p2.y);
    float col3=noise(t.p3.x*f,t.p3.y*f)*CR;
    fill  (col3); stroke(col3);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}


//P class///simple particle class////////////////////////////////////////////////

class P {
  PVector 
  l,       //location
  s;       //speed
  
  //CONSTRUCTOR
  P(float x,float y){
    l=new PVector(x,y);
    s=new PVector(random(-1,1),random(-1,1));   //set random initial angle and
    s.mult(random(5));                          //random speed
  }
  
  //METHODS
  void update(){
    l.add(s); 
    checkElasticBorders();
  }
  
  void display(){
    point(l.x,l.y); 
  }

  PVector location(){
    return l;
  }
  
  void checkElasticBorders(){
       if (l.x<=-m || l.x>=width+m ) s.x*=-1;
       if (l.y<=-m || l.y>=height+m) s.y*=-1;  
  }
  
}


