
float springRate = 0.1;
float damping = 0.2;
float angularSpringRate = 0.2;
float angularDamping = 0.2;
float angularMomentum = 150;
float globalDamping = 0.0005;
node[] nodes;
element[] elements;
node grippedNode;
boolean nodeIsGripped = false;
float mouseSpringRate = 0.1;
int iterationRate = 8;
int scaleUpFactor = 3;
int scaleDownFactor = 8;
void setup(){
  PImage Glaucus = loadImage("j40_1279988272.jpeg");
  PImage GlaucusMask = loadImage("GlaucusMask.jpg");
  GlaucusMask.filter(INVERT);
  Glaucus.mask(GlaucusMask);
  size(800,600);
//  Glaucus.resize(Glaucus.width*scaleUpFactor/scaleDownFactor,0);
  Glaucus.resize(Glaucus.width/scaleDownFactor,0);
  GlaucusMask.resize(GlaucusMask.width/scaleDownFactor,0);
  nodes = new node[0];
  elements = new element[0];
  boolean[][] maskData = new boolean[GlaucusMask.width][GlaucusMask.height];
  node[][] tempNodes = new node[GlaucusMask.width][GlaucusMask.height];
  for(int i=0;i<GlaucusMask.width;i++){
    for(int j=0;j<GlaucusMask.height;j++){
      maskData[i][j] = brightness(GlaucusMask.get(i,j)) > 128;
      if(maskData[i][j]){
//        PImage img = Glaucus.get(
//        round(i*scaleDownFactor/scaleUpFactor)+25,
//        round(j*scaleDownFactor/scaleUpFactor)+25,
//        round(3*scaleUpFactor),round(3*scaleUpFactor));
        node newNode = new node(i,j,Glaucus.get(i,j));
//        node newNode = new node(i,j,img);
        tempNodes[i][j] = newNode;
        nodes = (node[]) append(nodes,newNode);
      }
    }
  }
  PVector directionX = new PVector(0.5,0);
  directionX.mult(scaleUpFactor);
  for(int i=1;i<GlaucusMask.width;i++){
    for(int j=0;j<GlaucusMask.height;j++){
      if(maskData[i-1][j]&&maskData[i][j]){
        elements = (element[]) append(elements,
        new element(tempNodes[i-1][j],tempNodes[i][j],directionX));
      }
    }
  }
  PVector directionY = new PVector(0,0.5);
  directionY.mult(scaleUpFactor);
  for(int i=0;i<GlaucusMask.width;i++){
    for(int j=1;j<GlaucusMask.height;j++){
      if(maskData[i][j-1]&&maskData[i][j]){
        elements = (element[]) append(elements,
        new element(tempNodes[i][j-1],tempNodes[i][j],directionY));
      }
    }
  }
  cleanUpStrayNodes();
  println(nodes.length+" nodes");
  println(elements.length+" elements");
  strokeWeight(2*scaleUpFactor);
  smooth();
  imageMode(CENTER);
}
void draw(){
  background(255);
  for(int m=0;m<iterationRate;m++){
    for(int i=0;i<nodes.length;i++){
      nodes[i].update();
    }
    for(int i=0;i<elements.length;i++){
      elements[i].update();
    }
    if(nodeIsGripped){
      PVector force = PVector.mult(PVector.sub(new PVector(mouseX,mouseY),
      grippedNode.location),mouseSpringRate);
      grippedNode.forceSum.add(force);
    }
  }
  for(int i=0;i<nodes.length;i++){
    stroke(nodes[i].clr);
    point(nodes[i].location.x,nodes[i].location.y);

//    pushMatrix();
//    translate(nodes[i].location.x,nodes[i].location.y);
//    rotate(nodes[i].rotation);
//    image(nodes[i].img,0,0);
//    popMatrix();
  }
}
void mousePressed(){
  PVector mouse = new PVector(mouseX,mouseY);
  for(int i=0;i<nodes.length;i++){
    if(PVector.sub(nodes[i].location,mouse).mag()<scaleUpFactor*1.5){
      nodeIsGripped = true;
      grippedNode = nodes[i];
    }
  }
}
void mouseReleased(){
  nodeIsGripped = false;
}
class node{
  color clr;
  PImage img;
  PVector location;
  PVector velocity;
  PVector forceSum;
  float rotation = 0;
  float angularVelocity = 0;
  float torqueSum = 0;
  boolean isTouchedByElement = false;
//  node(int x,int y,PImage img){
  node(int x,int y,color clr){
    this.clr = clr;
//    this.clr = color(#000000);
//    this.img = img;
    location = new PVector(x,y);
    location.mult(scaleUpFactor);
    velocity = new PVector();
    forceSum = new PVector();
  }
  void applyForce(PVector force, PVector at){
    torqueSum += PVector.sub(at,location).cross(force).z;
    forceSum.add(force);
  }
  PVector toWorld(PVector at){
    float angle = atan2(at.y,at.x)+rotation;
    float magnitude = mag(at.y,at.x);
    return PVector.add(
    new PVector(magnitude*cos(angle),magnitude*sin(angle))
    ,location);
  }
  PVector totalVelocity(PVector at){
    return PVector.add(velocity,
    new PVector(0,0,angularVelocity).cross(PVector.sub(at,location)));
  }
  void update(){
    location.add(velocity);
    velocity.add(forceSum);
    velocity.mult(1.0-globalDamping);
    forceSum = new PVector();
    rotation += angularVelocity;
    angularVelocity += torqueSum/angularMomentum;
    angularVelocity = constrain(angularVelocity,-PI/4,PI/4);
    torqueSum = 0;
  }
}
class element{
  node nodeA;
  node nodeB;
  PVector direction;
  element(node A,node B,PVector dir){
    nodeA = A;
    nodeB = B;
    nodeA.isTouchedByElement = true;
    nodeB.isTouchedByElement = true;
    direction = dir;
  }
  void update(){
    PVector middleA = nodeA.toWorld(direction);
    PVector middleB = nodeB.toWorld(PVector.mult(direction,-1));
    PVector middleAB = PVector.mult(PVector.add(middleB,middleA),0.5);
    PVector force = PVector.mult(PVector.sub(middleB,middleA),springRate);
    PVector velocityA = nodeA.totalVelocity(middleAB);
    PVector velocityB = nodeB.totalVelocity(middleAB);
    force.add(PVector.mult(PVector.sub(velocityB,velocityA),damping));
    float torque = (nodeB.rotation-nodeA.rotation)*angularSpringRate;
    torque += (nodeB.angularVelocity-nodeA.angularVelocity)*angularDamping;
    nodeA.applyForce(force,middleAB);
    nodeB.applyForce(PVector.mult(force,-1),middleAB);
    nodeA.torqueSum += torque;
    nodeB.torqueSum -= torque;
  }
}
void cleanUpStrayNodes(){
  for(int i=nodes.length-1;i>=0;i--){
    if(nodes[i].isTouchedByElement==false){
      nodes = 
      (node[]) concat(
      (node[]) subset(nodes,0,i),
      (node[]) subset(nodes,i+1));
    }
  }
}

