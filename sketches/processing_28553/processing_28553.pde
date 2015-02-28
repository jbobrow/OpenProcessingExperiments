
import megamu.mesh.Delaunay;
import processing.core.PApplet;
import ddf.minim.AudioInput;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;
import fisica.FBody;
import fisica.FCircle;
import fisica.FDistanceJoint;
import fisica.FWorld;
import fisica.Fisica;

	
float nodeDiameter = 8;
float springLength = 50;
int aSegs = 12;//angle segments
int rSegs = 8;//radius segments
int hw,hh;
float ai = TWO_PI/aSegs;
float[][] points;
ArrayList<FCircle> nodes = new ArrayList<FCircle>();
//physics
FWorld physics;
//sound
int bufferSize = 512;
int fftSize = floor(bufferSize*.5f)+1;
float ba = TWO_PI/bufferSize;//angle subdivision based on buffer
Minim minim;
FFT fft;
AudioInput in;
int[][] links;
int numLinks;
int totalNodes;

public void setup() {
    size(800,800,P2D);
    background(255);
    smooth();
    //noStroke();
    //init phys
    Fisica.init(this);
    Fisica.setScale(10);
    physics = new FWorld(0,0,width,height);
    physics.setEdges();
    physics.setGravity(0,0);
    initMesh();
    initSound();
}


public void draw() {
    background(255);
    // Update audio in fft values
    fft.forward(in.right);
    // Update nodes based on audio
    for(int i=0; i<numLinks; i++){
    		int startIndex = links[i][0]; 
    	int endIndex = links[i][1];
    	float fftBand1 = fft.getBand(floor(map(startIndex,0,numLinks,0,(float) (bufferSize*.25))));
    	float fftBand2 = fft.getBand(floor(map(endIndex,0,numLinks,0,(float) (bufferSize*.25))));
    	FBody node1 = (FBody) nodes.get(startIndex);
        FBody node2 = (FBody) nodes.get(endIndex);
        float node1Fx = cos(fftBand1/bufferSize * TWO_PI) * fftBand1;
        float node1Fy = sin(fftBand1/bufferSize * TWO_PI) * fftBand1;
        float node2Fx = cos(fftBand2/bufferSize * TWO_PI) * fftBand2;
        float node2Fy = sin(fftBand2/bufferSize * TWO_PI) * fftBand2;
        node1.addForce(node1Fx, node1Fy);
        node2.addForce(node2Fx, node2Fy);
    }
    // Update the physics world
    physics.step();
    physics.draw();
}
void initMesh(){
  physics.clear();
  nodes = new ArrayList<FCircle>();
  hw = floor((float) (width * .5));
  hh = floor((float) (height * .5));
  totalNodes = aSegs * rSegs;
  points = new float[totalNodes][2];
  //init nodes
  int currentNode = 0;
  for(int j = 1 ; j <= aSegs ; j++){
    for(int i = 1 ; i <= rSegs ; i++){
      float x = hw + (cos(ai * j) * (springLength * i));
      float y = hh + (sin(ai * j) * (springLength * i));
      
      points[currentNode ][0] = x;
      points[currentNode ][1] = y;
      
      FCircle node = new FCircle(nodeDiameter);
      node.setPosition(x,y);
      node.setDensity(0.2f);
      node.setFill(0);
      physics.add(node);
      nodes.add(node);
      currentNode++;
    }
  }
  Delaunay delaunay = new Delaunay(points);
  links = delaunay.getLinks();
  numLinks = links.length;
  //make springs - delaunay
  for(int i=0; i<numLinks; i++){
  		int startIndex = links[i][0]; 
		int endIndex = links[i][1];
		
		FBody node1 = (FBody) nodes.get(startIndex);
        FBody node2 = (FBody) nodes.get(endIndex);

        FDistanceJoint spring = new FDistanceJoint(node1, node2);
        spring.setFrequency(5);
        spring.setDamping(1);
        spring.setStroke(0, 130, 164);
        physics.add(spring);
  }
  //FIXME find a nicer way to do this
  nodes.get(71).setDensity(0);
  nodes.get(47).setDensity(0);
}
private void initSound() {
	minim = new Minim(this);
	in = minim.getLineIn(Minim.STEREO, bufferSize);
	fft = new FFT(in.bufferSize(), in.sampleRate());
}

public void keyPressed() {
  if(key=='r' || key=='R') {
    background(255);
    initMesh();
  }
}
public void mousePressed(){
	if(mouseButton == RIGHT) {
		FBody currentNode = getNodeByPosition(10); 
		if(currentNode != null)currentNode.setDensity(0);
	}
}
public FBody getNodeByPosition(float minDist){
	FBody result = new FCircle(nodeDiameter);
	for(FBody node : nodes)
		if(distance(mouseX,mouseY,node.getX(),node.getY()) < minDist) return node;
	return result;
}
public float distance(float x1,float y1,float x2, float y2){
	float dx = x2-x1;
	float dy = y2-y1;
	return sqrt(dx*dx + dy*dy);
}
public void stop()
{
  // always close Minim audio classes when you finish with them
  in.close();
  minim.stop();
  
  super.stop();
}


