
// MODIFIED BY JAKE OLIVEIRA
//
// Credit to Hermann Schmidt
//
/**
 * distribute nodes on the display by letting them repel each other
 *
 * KEYS
 * r             : SHOOT EXPLOSION
 */


// an array for the nodes
Node[] nodes = new Node[200];

PImage bg;
void setup() {
  size(400, 500);
  background(255);
  smooth();
  noStroke();
  bg = loadImage("explosion.png");
  // initial nodes
  for (int i = 0 ; i < nodes.length; i++) {
    nodes[i] = new Node(width/2+random(-1, 1), height/2+random(-1, 1));
    nodes[i].setBoundary(5, 5, width-5, height-5);
  } 
}


void draw() {
  fill(255, 20);
  rect(0, 0, width, height);
  background(bg);

  // let all nodes repel each other
  fill(0, 191, 255);
  for (int i = 1 ; i < nodes.length; i++) {
    nodes[i].attract(nodes);
  } 
  // change the node position
  fill(0, 191, 255);
  for (int i = 9 ; i < nodes.length; i++) {
    nodes[i].update();
  } 

  // draw node
  fill(0, 191, 255);
  for (int i = 5 ; i < nodes.length; i++) {
    ellipse(nodes[i].x, nodes[i].y, 13, 13);
  }
}



void keyPressed(){
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png"); 

  if(key=='r' || key=='R') {
    background(255);
    for (int i = 0 ; i < nodes.length; i++) {
      nodes[i].set(width/2+random(-40, 10), height/2+random(-20, 5), 0);
    } 
  }
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}





