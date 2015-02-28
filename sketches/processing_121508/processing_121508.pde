



boolean edgesAdded = false;
boolean debug = false;
PVector vecA, vecB;
  
int nodeNum = 100;
int bigNodes = 20;
int totalNodes = nodeNum + bigNodes;

int nodesSet = -1;
Mover[] movers = new Mover[totalNodes];

boolean[][]isConnected = new boolean[totalNodes][totalNodes];

PVector startVelocity;
int framerate = 20;
float increment = 0;
int bgColor = 17;
float startX;
float startY;



void setup() {
  size(800, 700);
  frameRate(framerate);
  background(bgColor);
  startVelocity = new PVector(0, 0);
}

void setParticles(int num) {
   color col;
   int alpha = 220;
  for (int i = 0; i < nodeNum; i++) {
  
   float red = random(0, 250);
    float blue = random(0,250);
    float green = random(0,250);
   
    col = color(red, green, blue, alpha);
    nodesSet += 1;
    startX = random(-1, 1);
    startY = random(-1, 1);
    startVelocity.x = startX; 
    startVelocity.y = startY;    
    movers[i] = new Mover(random(1.5,2), random(0, 400), random(0,400), col, startVelocity);
  }
  for(int i = nodeNum ; i < nodeNum + bigNodes; i++){
   // println(i);
    float red = random(0, 250);
    float blue = random(0,250);
    float green = random(0,250);
     
    col = color(red, green, blue, alpha);
    nodesSet += 1;
    startX = random(-.5, .5);
    startY = random(-.5, .5);
    startVelocity.x = startX; 
    startVelocity.y = startY;    
    movers[i] = new Mover(random(1.5,3), random(0, 400), random(0,400), col, startVelocity);  
  }
}


void addEdges(){
  for(int i = 0; i < totalNodes; i++){
    for(int j = 0; j < totalNodes; j++){
       if(random(0,20) < totalNodes/100){ // Set likelihood of connection
           isConnected[i][j] = true;
           movers[i].addFriend(movers[j]);   // (*)
         }
      } 
      movers[i].setBff();    // Set current best friend/ path
    }
  }

void  drawEdges(){
  int drawCount = 0;
   color col;
  if (frameCount > totalNodes){
    drawCount = totalNodes;
  } else {
    drawCount = frameCount;
  }
  for(int n = 0; n < drawCount; n++){
    vecA = movers[n].getLocation();
         for(int i = 0; i < movers[n].friends.size(); i++){
            vecB = movers[n].friends.get(i).getLocation();
         
         col = color(movers[n].getColor());    
          if (vecA.dist(vecB)<80) {
          strokeWeight(3);
          stroke(col, 180);
          line(vecA.x*2, vecA.y*2, vecB.x*2, vecB.y*2);
        }
        
        if (vecA.dist(vecB)<200 && vecA.dist(vecB)>80) {
          strokeWeight(2);
          stroke(col, 100);
          line(vecA.x*2, vecA.y*2, vecB.x*2, vecB.y*2);
        }
          
        if (vecA.dist(vecB)<350 && vecA.dist(vecB)>200) {
          strokeWeight(1);
          stroke(col, 70);
        line(vecA.x*2, vecA.y*2, vecB.x*2, vecB.y*2);
        }

        if (vecA.dist(vecB)<800 && vecA.dist(vecB)>350) {
          strokeWeight(1);
          stroke(col, 30);
        line(vecA.x*2, vecA.y*2, vecB.x*2, vecB.y*2);
         }
    }
  }
}

//
void draw() {  
  if (frameCount > 10 && frameCount < 12) 
  setParticles(1);
   if (frameCount > 12 && frameCount < 14){
       addEdges();  
        edgesAdded = true; 
   }

  background(bgColor);

 if (nodesSet > 58) {
      drawEdges();
    
     if(edgesAdded) {
      for (int i= 0; i < totalNodes; i++) {
      if(frameCount % 5 == 0) {movers[i].updateColor();}  // Slowing down color/influence update
      float m = movers[i].mass; 
      int bffI = movers[i].bffIndex;
      
      if  (!(movers[i].friends.isEmpty()))  {
      PVector destVector = movers[i].friends.get(bffI).getLocation();
      movers[i].seek(destVector);   
      movers[i].separate();  
    }
   
      movers[i].update();
      PVector curLocation = movers[i].getLocation();
      movers[i].display();
      movers[i].checkEdges();
      } 
    }
  }
}
class Mover {
  
ArrayList<Mover> friends;  

PVector location, velocity, acceleration;

float angle = 0;
float aVelocity = 0;
float aAcceleration = 0;
float maxSpeed, maxForce;

int count =1;
float mass;
color mColor, initColor;
int massFactor = 4;
int bgCounter, threshold;
int [] curRGB;

int bffIndex = 5;
int bffDiff = 300;

Mover(float m, float x, float y, color c, PVector mVelocity) {
  
  friends = new ArrayList<Mover>();
  mColor = c;
  initColor = c;
  location = new PVector(x, y);
  velocity = new PVector(mVelocity.x, mVelocity.y);
  acceleration = new PVector(0,0);
  mass = m;
  maxForce = 0.2; 
  maxSpeed = 1.5;  
  curRGB = getColorVec(c);
  threshold = int(random(20, 80));
  }

// add friends
void addFriend(Mover m){
  friends.add(m);
}

int[] getRGB() {
 return curRGB;
}
// set and get
color getColor() {
  return mColor;
}

PVector getLocation(){
 return location; 
}

PVector getVelocity() {
 return velocity;
}

PVector getAcceleration() {
  return acceleration; 
}
  
float getMass(){
 return mass; 
}

float getSize(){
  return mass * massFactor;
}


void setMass(float newMass){
   mass = newMass;
} 

void setColor(color newColor){
  mColor = newColor;
}

// ****** Find Favorite Friend ******* \\

void setBff(){
  int tempBff = 0;    //Track index of closest 
  int tempMinDiff = 1000;    //lowest sum of differences (Max 255*3)
  int curDiff;
  for (int ii = 0; ii < friends.size() - 1; ii++){
    curDiff = getTotalDiff(friends.get(ii).mColor);    // get total sum of differences 
    if( curDiff < tempBff){
        tempBff = ii;
        tempMinDiff = curDiff;
     }
  }
  bffIndex = tempBff;
  bffDiff = tempMinDiff;
}

int getTotalDiff(color vColor){        // Combine with getMinDifference (same function except return)
  int sumDiff = 0;
  int[] destVec = getColorVec(vColor);
   int[] diffVec = new int[3];
      for(int ii = 0; ii < 2;  ii ++){
        diffVec[ii] = abs(destVec[ii] - curRGB[ii]);
    }
     for (int i = 0; i < 2; i ++){
       sumDiff += diffVec[i]; 
    }
    return sumDiff;
}

// Test new friends for lowest sum of differences and set as "Best Friend" if lower
void isNewBff(int index){    
  int tempDiff = getTotalDiff(friends.get(index).mColor);
 if ( tempDiff < bffDiff) {
   bffDiff = tempDiff;
   bffIndex = index;
 }
}

///****** Update forces ****** \\\\

// make class
int[] getColorVec(color vColor) {
       int r = (vColor >> 16) & 0xFF;
       int g = (vColor >> 8) & 0xFF;
       int b = vColor & 0xFF;
       
       int[] colorVec = {r,g,b};
       return colorVec;
}

boolean getMinDifference(color vColor){
    int[] destVec = getColorVec(vColor);
    //int[] originVec = getColorVec(vColor); 
    int[] diffVec = new int[3];
    for(int ii = 0; ii < 2;  ii ++){
      diffVec[ii] = abs(destVec[ii] - curRGB[ii]);
    }
    int rgbIndex = 0;
    int maxDiff = diffVec[0];
    int sumDiff = 0;
    
    for (int i = 0; i < 2; i ++){
       sumDiff += diffVec[i]; 
    }
    
    if(sumDiff < threshold){
     return true;
    } 
    return false;
   }

  
  
 void getInfluence(int index){
    color tempColor = friends.get(index).getColor();
    boolean influence = getMinDifference(tempColor);
    if (!influence) {
      friends.remove(index);
      friends.add(movers[int(random(totalNodes -1))]);
      if(friends.size()> 0){
        isNewBff(friends.size()- 1);
      }      
    } else {
    calcColor(index);
      
    }
    
 }
  
void calcColor(int index){  ///(rgbIndex, maxDiff)
    
    int addFactor = int(friends.get(index).getMass());
    int colorIndex = int(random(2));
    int[] colorVec = friends.get(index).getRGB();
    int influenceAmt = colorVec[colorIndex] - curRGB[colorIndex];
    int addColor = addFactor * (influenceAmt/7);
    //println(curRGB[colorIndex]);
    
    int newValue = curRGB[colorIndex] + addColor;
     if (newValue > 255) { newValue = 255; } 
     curRGB[colorIndex] = newValue;
    // println("newValue = " + curRGB[colorIndex]);
     color newColor = color(curRGB[0], curRGB[1], curRGB[2]);
     setColor(newColor);
    
}
  


/// ***** Updates ***** \\\
void updateColor() {
   for(int i = 0; i < friends.size(); i++){
      getInfluence(i);
   } 
}


void update() {
  velocity.add(acceleration);
  velocity.limit(maxSpeed); 
  
  location.add(velocity);
  acceleration.mult(0);  

}

void applyForce(PVector force) {
    acceleration.add(force); 
}

// method to calculate steering force towards a target
void seek(PVector target) {
   PVector dest = PVector.sub(target,location); // vector fom location to target
  // Normalize dest
   dest.normalize();
   dest.mult(maxSpeed);
  // Steering = Dest minus velocity
  PVector steer = PVector.sub(dest, velocity);
  steer.limit(maxForce);   // limit to maximum steering force
  applyForce(steer); 
}

//Keeps friends separate
void separate () {
   float desiredseparation = 30.0f;
    PVector steer = new PVector(0,0,0);
   int count = 0;
    // for each mover freind check if its too close.
    for(Mover other : friends){
      float d = PVector.dist(location, other.location);
      // If distance greater than 0 andless than amount
      if ((d >0 ) && (d <desiredseparation)){
        // Calc vector pointing away from neighbor 
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
      if (count > 0 ) {
         steer.div((float)count); 
      }
      if (steer.mag() > 0) {
         steer.normalize();
         steer.mult(maxSpeed);
         steer.sub(velocity);
          steer.limit(maxForce); 
      }
      
    } 
   applyForce(steer); 
}


void display() {
    //bgCounter = (bgCounter + 1) % 8;
    //count += count;
    strokeWeight(3);
    stroke(mColor, 250);
    fill(initColor);
     //rectMode(CENTER);
     pushMatrix();
     translate(location.x, location.y);
     rotate(angle);
     ellipse(location.x, location.y, mass*massFactor, mass*massFactor);
     popMatrix();
     //drawTrail();  
  }
  

  
  void checkEdges() {
    if (location.x + massFactor*mass/2 > width/2 ) {
      location.x = width/2 - massFactor*mass/2;
      velocity.x *= -1;
    } else if (location.x - massFactor*mass/2 < 0) {
      velocity.x *= -1;
      location.x = 0 + massFactor*mass/2  ;
    }
     
    if(location.y + massFactor* mass/2 >= height/2) {
      velocity.y *= -1;
      location.y = height/2 - massFactor* mass/2;
    } else if (location.y - massFactor* mass/2 <= 0) {
       velocity.y *= -1;
      location.y =  massFactor* mass/2;
    }
  }
  
   
}


