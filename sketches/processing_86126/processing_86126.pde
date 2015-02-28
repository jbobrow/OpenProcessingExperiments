
/*
  Octopus
 Nature of Code
 
 Jan31
 
 paul christophe
 */



int amount = 50;
int cirSize = 50;
int wag = 100;
ArrayList tentacles = new ArrayList();


void setup() {
  size(1400,450);
  smooth();
  noStroke();

  for(int i = 0; i< 8; i++){
    PVector pos = new PVector(160 *i + 140,cirSize/2);
    Tentacle t = new Tentacle(pos, amount, cirSize, 1.08, (wag  + i * 50));
    tentacles.add(t);
  }
}

void draw() {
  background(255);
  fill(0);
  for(int i = 0; i < 8; i++){
    Tentacle t = (Tentacle) tentacles.get(i);
    t.moveTent();
    t.drawTent();
  }
}




class Tentacle {
  int amount;
  ArrayList links = new ArrayList();
  float angle = 0;
  float increment;
  float wagAmount;
  PVector p;
  boolean switchState = true;

  Tentacle(PVector position, int amountLinks, float circleSize, float taperAmount, float w) {
    wagAmount = w;
    p = position;
    amount = amountLinks;
    for(int i = 0; i < amountLinks; i++) {

      if(i == 0) {
        Link l = new Link(circleSize, 0);
        links.add(l);
      }
      else {
        Link linkAbove = (Link) links.get(i-1); // check the link that is one position above
        Link l = new Link(linkAbove.getSize()/ taperAmount, linkAbove.getSize()/2);
        links.add(l);
      }
    }
  }

  //moveTent sets all of the angles for all of the links of the tentacle
  void moveTent() {
    for(int i = 0; i < links.size(); i++) {
      // the first link will not move
      if(i == 1) {
        Link l1 = (Link) links.get(i);

        l1.setAngleOld(l1.getAngleCur());
        l1.setAngleCur(angle);
      }
      else if(i > 1) { // for all of the other links above the second one
        Link l1 = (Link) links.get(i);
        Link l2 = (Link) links.get(i - 1);
        
        l1.setAngleOld(l1.getAngleCur());
        l1.setAngleCur(l2.getAngleOld());
      }
    }
    if(switchState == true){
      increment = increment - (2*PI)/275; //100 points of resolution around a circle
    }else{
      increment = increment + (2*PI)/275;
    }
    if(increment > 2*PI) {
      increment = 0;
      switchState = true;
    }else if(increment < -2*PI){
      increment = 0;
      switchState = false;
    }
    angle = angle + sin(increment) / wagAmount;
  }


  // deals with all of the translations and rotations and then draws
  void drawTent() {
    pushMatrix();
    translate(p.x,p.y);
    for(int i = 0; i < links.size(); i++) {
      Link linkTemp = (Link) links.get(i);

      translate(0, linkTemp.getDist());
      rotate(linkTemp.getAngleCur());
      
      ellipse(0, 0, linkTemp.getSize(), linkTemp.getSize());
    }
    popMatrix();
  }
  

  ArrayList getLinks() {
    return links;
  }
  
}





class Link {
  float circleSize;
  float angleCur;
  float angleOld;
  float distanceClosestUp;

  Link(float sizeCir, float distance) {
    circleSize = sizeCir;
    distanceClosestUp = distance; // the distance to the closest link bigger than it.
    angleCur = 0;
    angleOld = 0;
  }

  float getSize() {
    return circleSize;
  }

  float getAngleCur() {
    return angleCur;
  }
  void setAngleCur(float a) {
    angleCur = a;
  }
  float getAngleOld() {
    return angleOld;
  }
  void setAngleOld(float a) {
    angleOld = a;
  }
  
  float getDist(){
    return distanceClosestUp;
  }
}
