
import fisica.*;

float nodeDiameter = 4;
float springLength = 50;
int aSegs = 12;//angle segments
int rSegs = 6;//radius segments
int hw,hh;
float ai = TWO_PI/aSegs;
ArrayList<FCircle> nodes = new ArrayList<FCircle>();

FWorld physics;

void setup() {
  size(800,800,P2D);
  background(255);
  smooth();
  noStroke();
  //init phys
  Fisica.init(this);
  physics = new FWorld();
  physics.setGravity(0,0);
  initMesh();
}
void draw() {
	background(255);
	// Update the physics world
	physics.step();
	physics.draw();
}
void initMesh(){
	  physics.clear();
	  nodes = new ArrayList<FCircle>();
	  hw = floor((float) (width * .5));
	  hh = floor((float) (height * .5));
	  //init nodes
	  for(int j = 1 ; j <= aSegs ; j++){
	    for(int i = 1 ; i <= rSegs ; i++){
	      float x = hw + (cos(ai * j) * (springLength * i));
	      float y = hh + (sin(ai * j) * (springLength * i));
	      FCircle node = new FCircle(nodeDiameter);
	      node.setPosition(x,y);
	      node.setDensity(0.2f);
	      node.setFill(0);
	      physics.add(node);
	      nodes.add(node);
	      println(i+"\t"+j+"\t"+nodes.size());
	    }
	  }
	  //make springs
	  int idx = 0;
	  int totalNodes = aSegs * rSegs;
	  for(int j = 0 ; j < aSegs ; j++){
	    for(int i = 0 ; i < rSegs ; i++){
	      if(i < rSegs-1){
	        FBody node1 = (FBody) nodes.get(idx);
	        FBody node2 = (FBody) nodes.get(idx+1);
	        
	        FDistanceJoint spring = new FDistanceJoint(node1, node2);
	        spring.setFrequency(5);
	        spring.setDamping(1);
	        spring.setStroke(0, 130, 164);
	        spring.setStrokeWeight(2);
	        spring.setLength(springLength);
	        physics.add(spring);
	      }
	    FBody currentAN = (FBody) nodes.get(idx);
	    FBody nextAN = (FBody) nodes.get((idx+rSegs)%totalNodes);
        FDistanceJoint crossSpring = new FDistanceJoint(currentAN, nextAN);
        crossSpring.setFrequency(5);
        crossSpring.setDamping(1);
        crossSpring.setStroke(0, 130, 164);
        crossSpring.setStrokeWeight(2);
        //crossSpring.setLength(springLength);
        physics.add(crossSpring); 
      idx++;
    }
  }
}

void keyPressed() {
  if(key == 'q') if(aSegs < 128) aSegs++;
  if(key == 'a') if(aSegs > 1) aSegs--;
  if(key == 'w') if(rSegs < 128) rSegs++;
  if(key == 's') if(rSegs > 1) rSegs--;
  reset();
}
void reset(){
  background(255);
  ai = TWO_PI/aSegs;
  initMesh();
}

