
FlockingGame g;

void setup(){
  size(600,600);
  //frameRate(60);
  g = new FlockingGame(300);
  background(255);
}

void draw(){
  fill(255,128);
  rect(0,0,600,600);
  //background(255);
  g.update();
}

///////////////////////////////////////////////////////////
//CLASS BIRD
///////////////////////////////////////////////////////////
class Bird{
  PVector pos; 
  PVector vel; //velocity
  PVector tar;
  PVector desiredHeading;
  BirdAI ai;
  float tsa; //turn step angle
  ArrayList neighbors;
  float seeDist;
  Bird(float x, float y){
    pos = new PVector();
    tar = new PVector();
    pos.x = x;
    pos.y = y;
    vel = PVector.random2D();
    vel.mult(2.5);
    vel.set(1,0,0);
    desiredHeading = new PVector();
    ai = new BirdAI();
    tsa = PI/50;
    seeDist = 50;
    neighbors = new ArrayList();
  }
////////////////////////////////////////////////////////////
//step 1: collect information (find neighbors)
////////////////////////////////////////////////////////////
  void findNeighbors(ArrayList allBirds){
    neighbors = new ArrayList(); //clean ArrayList
    PVector otherPos = new PVector();
    for(int i = 0; i< allBirds.size(); i++){
      Bird b = (Bird) allBirds.get(i);
      if (this != b){//do not compare with self
        otherPos.set(b.pos);
        float dist = pos.dist(otherPos);
        if (dist < seeDist) {
          neighbors.add(b);
        }
      }
    }
  }

/////////////////////////////////////////////////////////////
//step 2: take action
/////////////////////////////////////////////////////////////
  void update(PVector inTar){
    tar.set(inTar);
    ai.update(pos, tar, neighbors);
    desiredHeading = ai.whereTo();
    float r = tsa * sign();
    vel.rotate(r);
    pos.add(vel);
    render();
  }
  
  int sign() {
    int a = -(int) Math.signum(vel.y*desiredHeading.x - vel.x*desiredHeading.y);
    return a;
  }
  
  void render(){
    fill(0);
    noStroke();
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(vel.heading()+PI/2);
      ellipse(0,0,1.5,1.5);
      /*beginShape();
        vertex(-2,0);
        vertex(0,7);
        vertex(2,0);
      endShape(CLOSE);*/
    popMatrix();
  }
}

class BirdAI{
  ArrayList neighbors;
  Bird me;
  PVector pos; PVector tar;
  PVector avoidHeading; float avoidFactor;
  PVector copyHeading; float copyFactor;
  PVector centerHeading; float centerFactor;
  PVector targetHeading; float targetFactor;
  PVector desiredHeading;
  
  BirdAI(){
    pos = new PVector();
    tar = new PVector();
    avoidHeading = new PVector();
    copyHeading = new PVector();
    centerHeading = new PVector();
    targetHeading = new PVector();
    desiredHeading = new PVector();
  }
  void update(PVector inPos, PVector inTar, ArrayList inNeighbors){
    neighbors = inNeighbors;
    pos.set(inPos);
    tar.set(inTar);
    avoidHeading.set(avoidV());
    //copyHeading = copyV();
    centerHeading.set(centerV());
    targetHeading.set(targetV());
    //desiredHeading.set(avoidHeading);
  }
  PVector avoidV(){
    PVector aV = new PVector();
    PVector tow = new PVector();
    for(int i = 0; i < neighbors.size(); i++){
      Bird n = (Bird) neighbors.get(i);
      tow.set(pos); tow.sub(n.pos);
      float d = tow.mag();
      tow.normalize();
      tow.mult(5/d);
      aV.add(tow);
    }
    aV.div(neighbors.size()+1);
    return aV;
  }
  
  PVector copyV(){
    PVector cpV = new PVector();
    //calculate copyV here
    return cpV;
  }
  
  PVector centerV(){
    PVector cnV = new PVector(0,0,0);
    for(int i = 0; i < neighbors.size(); i++){
      Bird b = (Bird) neighbors.get(i);
      cnV.add(b.pos);
    }
    cnV.div(neighbors.size()+1);
    PVector toC = new PVector();
    cnV.sub(pos);
    cnV.normalize();
    return cnV;
  }
  
  PVector targetV(){
    PVector tV = new PVector();
    tV.set(tar);
    tV.sub(pos);
    tV.normalize();
    return tV;
  }
  
  PVector whereTo(){
    avoidHeading.mult(10);
    //copyHeading.mult(1);
    centerHeading.mult(0.2);
    targetHeading.mult(1);
    desiredHeading.set(avoidHeading);
    //desiredHeading.add(copyHeading);
    desiredHeading.add(centerHeading);
    desiredHeading.add(targetHeading);
    return desiredHeading;
  }
  
}

class FlockingGame{
  ArrayList birds;
  int num;
  int time;
  Target t;
  FlockingGame(int inNum){
    num = inNum;
    t = new Target();
    birds = new ArrayList();
    for(int i=0; i<num; i++){
      birds.add(new Bird(random(0,600),random(0,600)));
    }
  }
  void update(){
    time++;
    t.update();
    for(int i = 0; i<birds.size(); i++){
      Bird b = (Bird) birds.get(i);
      b.findNeighbors(birds);
      b.update(t.getPos());
      float d = b.pos.dist(t.pos);
    }
  }
  void generate(){

  }
}

class Target{
  PVector pos;
  Target(){
    pos = new PVector(300,300,0);
  }
  void update(){
    pos.x = mouseX;
    pos.y = mouseY;
    pos.z = 0;
    show();
  }
  PVector getPos(){
    return pos;
  }
  void show(){
    fill(255,0,0);
    noStroke();
    //ellipse(pos.x,pos.y,10,10);
  }
}


