
import java.util.Iterator;
import java.util.ArrayList;
import java.util.HashMap;
import processing.net.*; 



int totalNumberOfNodes = 0;
ArrayList elements = new ArrayList();
ArrayList parents = new ArrayList();
int nodesAdded = 0; 
int maxDegree = 0;
HashMap particleNodeLookup = new HashMap();
HashMap particleInfoLookup = new HashMap();
ParticleSystem physics;
Smoother3D centroid;

// MAKE SURE YOU CHANGE THIS! I might change this site in the future.
// Simply point to a site on your own server that gets the html from any other site.
private String urlPath = "http://fbwinsrv2003pc/daniel/Lev_Leviev.php?";
private String content;



     
 
float NODE_SIZE = 50;
float EDGE_LENGTH = 50;
float EDGE_STRENGTH = 20;
float SPACER_STRENGTH = 20000;
  
final String GREY = "155,155,155";
final String BLUE = "0,0,155";
final String ORANGE = "255,155,51";
final String YELLOW = "255,255,51";
final String RED = "255,0,0";
final String GREEN = "0,155,0";
final String VIOLET = "128,0,255";
final String BLACK = "0,0,0";
final String PINK = "255,0,255";
final String WHITE = "255,255,255";
final String CYAN = "0,255,255";
final String BURLYWOOD = "246,217,171";
final String PURPLE = "196,56,79";
final String BROWN = "99,82,43";
final String DUCK = "30,108,11";



void setup() {
  size(750, 750);
  // if you want to run it locally from within processing, comment the two following lines, and define urlPath as http://www.whateveryoursite.com
  String urlFromForm = param("urlFromForm"); 
  urlPath += urlFromForm;
  smooth();
  frameRate(24);
  strokeWeight(0.2);
  ellipseMode(CENTER);
  physics = new ParticleSystem( 0, 0.25 );
  centroid = new Smoother3D( 0.0, 0.0, 1.0,0.8 );
  initialize();
  this.getDataFromClient();
}

void getDataFromClient() {
  try {
    org.htmlparser.Parser ps = new org.htmlparser.Parser ();
    ps.setURL(urlPath);
    OrFilter orf = new OrFilter();
    NodeFilter[] nfls = new NodeFilter[1];
    nfls[0] = new TagNameFilter("html");
    orf.setPredicates(nfls);
    NodeList nList  = ps.parse(orf);
    Node node = nList.elementAt (0);
    this.parseTree(node);
    EDGE_STRENGTH = (1.0 / maxDegree) * 5;
    if (EDGE_STRENGTH > 0.2) EDGE_STRENGTH = 0.2;
  }
  catch (Exception e) {
     e.printStackTrace();
  }
}

void initialize() {
  physics.clear();
}

void parseTree(Node node) {
  int degree = 0;
  if (node == null) return;
  String nodeText = node.getText();
  if (node instanceof TagNode && !((TagNode)node).isEndTag())  {   
      //println(((TagNode)node).getTagName());
      totalNumberOfNodes++;
      elements.add(node);
      parents.add(((TagNode)node).getParent());
   }
  NodeList children = node.getChildren();
  if (children == null) return;
  SimpleNodeIterator iter = children.elements();
  while(iter.hasMoreNodes()) {
    Node child = iter.nextNode();
    if (child instanceof TagNode && !((TagNode)child).isEndTag()) degree++;
    parseTree(child);
  }
  if (degree > maxDegree) maxDegree = degree;
}


Particle addNode(Particle q) {
  Particle p = physics.makeParticle();
  if (q == null) return p;
  addSpacersToNode( p, q );
  makeEdgeBetween( p, q );
  float randomX =  (float)((Math.random() * 0.5) + 0.5);
  if (Math.random() < 0.5) randomX *= -1;
  float randomY = (float)((Math.random() * 0.5) + 0.5);
  if (Math.random() < 0.5) randomY *= -1;
 p.position().set( q.position().x() +randomX, q.position().y() + randomY, 0 ); 
  return p;
}


void draw() {
  //uncomment this if you want your network saved as pdfs
  //beginRecord(PDF, "frameimage-####.pdf");
  if (nodesAdded < totalNumberOfNodes) {
    this.addNodesToGraph();
  }
  else {
    if (EDGE_STRENGTH < 0.05) EDGE_STRENGTH += 0.0001;  
  }
  physics.tick( 1.0 );
  if (physics.numberOfParticles() > 1) {
    updateCentroid();
  }
  centroid.tick();
  background(255);
  translate(width/2, height/2);
  scale(centroid.z());
  translate( -centroid.x(), -centroid.y() );
  drawNetwork();
  //uncomment this if you want your network saved as pdfs
  //endRecord();
}

void addNodesToGraph() {
  
  
  
  Particle newParticle;
  TagNode tagNodeToAdd = (TagNode)elements.get(nodesAdded);
  Node parentNode = (Node)parents.get(nodesAdded);
  if (parentNode == null) {
    // this is the html element
    newParticle = addNode(null);
  }
  else {
    Particle parentParticle = (Particle)particleNodeLookup.get(parentNode);
    newParticle = addNode(parentParticle);
    }
  particleNodeLookup.put(tagNodeToAdd,newParticle);


  String nodeColor = BLACK;
  
  if (tagNodeToAdd.getAttribute("name") != null) {
   
  

      
      
           if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("IND")) nodeColor = BLUE;
  else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("PUB")) nodeColor = ORANGE;
  else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("SUB")) nodeColor = GREEN;
  else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("MM")) nodeColor =  BLUE;
  else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("OTH")) nodeColor =  GREY;
  else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("FD")) nodeColor =  YELLOW;
    else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("JOB")) nodeColor =  RED;
    else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("PVT")) nodeColor =  PINK;
      else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Health Technology")) nodeColor =  GREY;
        else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Non-Energy Minerals")) nodeColor =  CYAN;
    else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Technology Services")) nodeColor =  BURLYWOOD;
    else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Industrial Services")) nodeColor =  PURPLE;
      else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Consumer Durables")) nodeColor =  BROWN;
       else if (tagNodeToAdd.getAttribute("name").equalsIgnoreCase("Producer Manufacturing")) nodeColor =  DUCK;



    
    
    if(tagNodeToAdd.getAttribute("value") != null){
   
    tagNodeToAdd.getAttribute("value");
    String st = tagNodeToAdd.getAttribute("value");
         
          NODE_SIZE =  Float.parseFloat(st);
         
      NODE_SIZE = NODE_SIZE /1.5;
              
     
  
    } nodeColor = nodeColor + "," + NODE_SIZE;
    
   
  particleInfoLookup.put(newParticle,nodeColor);
  
  

  }
        

  nodesAdded++;  

        
       

  println(NODE_SIZE);
}



void drawNetwork() {
  // draw edges
  stroke( 0 );
  beginShape( LINES );
  for ( int i = 0; i < physics.numberOfSprings(); ++i ){
    Spring e = physics.getSpring( i );
    Particle a = e.getOneEnd();
    Particle b = e.getTheOtherEnd();
    vertex( a.position().x(), a.position().y() );
    vertex( b.position().x(), b.position().y() );

  }
  endShape();
  // draw vertices
  noStroke();
  for ( int i = 0; i < physics.numberOfParticles(); ++i ) {
    Particle v = physics.getParticle(i);
  
    String info = (String)(particleInfoLookup.get(v));
   
    if (info != null) {
      String[] infos = info.split(",");
      fill(Integer.parseInt(infos[0]),Integer.parseInt(infos[1]),Integer.parseInt(infos[2]));
      
    
       NODE_SIZE = Float.parseFloat (infos[3]);
   
    }
    else {
      fill(155);
        
      } 
      
        
 
          ellipse( v.position().x(), v.position().y(), NODE_SIZE, NODE_SIZE );
  }

}




void updateCentroid() {
  float
    xMax = Float.NEGATIVE_INFINITY,
    xMin = Float.POSITIVE_INFINITY,
    yMin = Float.POSITIVE_INFINITY,
    yMax = Float.NEGATIVE_INFINITY;

  for (int i = 0; i < physics.numberOfParticles(); ++i) {
    Particle p = physics.getParticle(i);
    xMax = max(xMax, p.position().x());
    xMin = min(xMin, p.position().x());
    yMin = min(yMin, p.position().y());
    yMax = max(yMax, p.position().y());
  }
  float deltaX = xMax-xMin;
  float deltaY = yMax-yMin;
  if ( deltaY > deltaX ) {
    centroid.setTarget(xMin + 0.5*deltaX, yMin + 0.5*deltaY, height/(deltaY+50));
  }
  else {
    centroid.setTarget(xMin + 0.5*deltaX, yMin + 0.5*deltaY, width/(deltaX+50));
  }
}

void addSpacersToNode( Particle p, Particle r ) {
  for ( int i = 0; i < physics.numberOfParticles(); ++i ) {
    Particle q = physics.getParticle(i);
    if (p != q && p != r) {
      physics.makeAttraction(p, q, -SPACER_STRENGTH, 20);
    }
  }
}

void makeEdgeBetween(Particle a, Particle b) {
  physics.makeSpring( a, b, EDGE_STRENGTH, EDGE_STRENGTH, EDGE_LENGTH );
}


 


