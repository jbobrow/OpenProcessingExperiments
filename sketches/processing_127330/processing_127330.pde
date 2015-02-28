
int numGravOrbs = 120;
float forceGravOrbs = 0.00003;
float rangeGravOrbs = 70;
ArrayList<gravPoint> gravPoints;

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  background(255*.95);
  PVector tempVecPos;
  PVector tempVecVel;
  color tempColour;
  
  gravPoints = new ArrayList<gravPoint>();
  for(int i=0; i<numGravOrbs; i++) {
    tempVecPos = new PVector(random(width),random(height));
    tempVecVel = new PVector(random(-1,1),random(-1,1));
    tempColour = color(int(random(256*.8, 256)), int(random(0, 256*.6)), 0);
    gravPoints.add(new gravPoint(tempVecPos, tempVecVel, forceGravOrbs, rangeGravOrbs, tempColour));
  }
}

void draw() {
  float d = 0;
  fill(0, 100);
  rect(0, 0, width, height);
  for(int i=0; i<gravPoints.size(); i++){
    gravPoint p = gravPoints.get(i);
    for(int j=0; j<gravPoints.size();j++){
      if(i!=j) p.interact(gravPoints.get(j));        
    }
    p.update();
    p.drawPoint();
    d += p.velocity.mag(); 
  }
  d /= gravPoints.size();
  //frame.setTitle(str(gravPoints.size()) + " orbs /w avg velocity " + String.format("%.2f", d) + " @ " + str(round(frameRate)) + "fps"); 
}

void mouseClicked() {
  int tempX = mouseX;
  int tempY = mouseY;
  float tempForce;
  float tempRange = 20;
  color tempColour;
  if(mouseButton == LEFT){
    tempForce = 0.05;
    tempColour = color(255*.2);
    gravPoints.add(new gravPoint(new PVector(tempX, tempY), new PVector(0, 0), tempForce, tempRange, tempColour));
    gravPoints.get(gravPoints.size()-1).velocity.limit(1);
  }
  else if(mouseButton == RIGHT){
    tempForce = -0.05;
    tempColour = color(255);
    gravPoints.add(new gravPoint(new PVector(tempX, tempY), new PVector(0, 0), tempForce, tempRange, tempColour));
    gravPoints.get(gravPoints.size()-1).velocity.limit(1);
  }
//  else if(mouseButton == CENTER){    
//    PVector tempVecPos;
//    PVector tempVecVel;
//    tempVecPos = new PVector(random(width),random(height));
//    tempVecVel = new PVector(0,0);//PVector.random2D();
//    tempColour = color(int(random(256*.8, 256)), int(random(0, 256*.6)), 0);
//    gravPoints.add(new gravPoint(tempVecPos, tempVecVel, forceGravOrbs, rangeGravOrbs, tempColour));
//  }
}













class gravPoint {
  PVector position;
  PVector velocity;
  float force;
  float range;
  color colour;
  
  gravPoint(PVector initialPosition, PVector initialVelocity, float f, float r, color c) {
   position = initialPosition;
   velocity = initialVelocity;
   force = f;
   range = r;
   colour = c;
  }
  
  void update() {
    position.add(velocity);
    
    if(position.y>height) position.y = 0;
    else if(position.y<0) position.y = height;
    if(position.x>width) position.x = 0;
    else if(position.x<0) position.x = width; 
  }
  
  void interact(gravPoint p){
    float distance = PVector.dist(position, p.position);
    if(distance<=p.range) {
      velocity.add(PVector.mult((PVector.sub(p.position, position)), p.force));
      velocity.limit(3);
      drawBond(p, distance);
    }
  }
  
  void drawPoint(){
    fill(colour);
    noStroke();
    ellipse(position.x, position.y, 3, 3);
  }
  
  void drawBond(gravPoint p, float distance){
    color c = lerpColor(colour, p.colour, .5);
    stroke(red(c), green(c), blue(c), (p.range - distance) / p.range * 255);
    line(position.x, position.y, p.position.x, p.position.y);
  }
}


