
//GridShip


class Ship{
  
  float rotation;
  float zoom = 2;
  
  PVector tip, ctr;
  PVector sides [];
  PVector aft [];
  
  int len, wid, mSDiv, mADiv;
  
  Ship (int len, int wid, int mSDiv, int mADiv) {
    this.len = len;
    this.wid = wid;
    this.mSDiv = mSDiv;
    this.mADiv = mADiv;
    rotation = random(2*PI);
    tip = new PVector(0,0);
    
    this.randomize();
    
  }
  
  void randomize(){
    sides = new PVector[int(random(1000)%mSDiv) + 1];
    int x = 1, y = 1;
    for(int i=0; i<sides.length; i++){
      x = min(x+int(random(1000)%int(random(len/2,len))),len);
      y = min(y+int(random(1000)%int(random(wid/2,wid))),wid);
      sides[i] = new PVector(x, y);
    }
    //sides[sides.length-1] = new PVector(len,wid);
    ctr = new PVector(x/2, 0);
    int my = int(sides[sides.length-1].y);
    aft = new PVector[int(random(0, 1000)%mADiv)+1];
    for(int i=0; i<aft.length; i++){
      x += random(1000)%4-2;
      y = max(y-int(random(1000)%int(random(wid/2,wid))),0);
      aft[i] = new PVector(x, y);
    }
   // aft[aft.length-1] = new PVector(x,0);
  }
  void draw(int x, int y) {
    pushMatrix();
    translate(x,y);
    rotate(rotation);
    beginShape();
    vertex((tip.x-ctr.x)*zoom, (tip.y-ctr.y)*zoom);
    for(int i=0; i<sides.length; i++){
      vertex((sides[i].x-ctr.x)*zoom, (sides[i].y-ctr.y)*zoom);
    }
    for(int i=0; i<aft.length; i++){
      vertex((aft[i].x-ctr.x)*zoom, (aft[i].y-ctr.y)*zoom);
    }
    //& back again other side
    for(int i=aft.length-1; i>=0; i--){
      vertex((aft[i].x-ctr.x)*zoom, (-aft[i].y-ctr.y)*zoom);
    }
    for(int i=sides.length-1; i>=0; i--){
      vertex((sides[i].x-ctr.x)*zoom, (-sides[i].y-ctr.y)*zoom);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
}
Ship [] fleet;
void setup(){
  size(1000, 1000);
  fleet = new Ship[100];
  background(0);
  stroke(255);
  noFill();
  for (int i=0;i<fleet.length;i++) {
    fleet[i] = new Ship(10, 5, 5, 2);
    fleet[i].draw((i)*100, (floor(i/10)*100));
  }
}

int time = 0;
float deltaTime;
void draw(){
  background(0);
  deltaTime = (millis()-time)/1000.0;
  time = millis();
  for (int i=0;i<fleet.length;i++) {
    int mod = 10;
    int x = (i%mod)*100+50;
    int y = floor(i/10)*100+50;
    if(abs(mouseX-x)<50 && abs(mouseY-y)<50) {
      fleet[i].rotation+=deltaTime/10;
      fleet[i].zoom = 10;
      if(mousePressed) fleet[i].randomize();
      fill(255);
    }
    else {
      fleet[i].rotation+=deltaTime;
      fleet[i].zoom = 2;
      noFill();
    }
    
    fleet[i].draw(x, y);
  }
}

void keyPressed(){
  for (int i=0;i<fleet.length;i++) {
    fleet[i].randomize();
  }
}
