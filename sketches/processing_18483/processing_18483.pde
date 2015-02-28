
Disk [] Ghosts;

void setup(){
  size(540,334);
  smooth();
  background(132,144,163);
  buildGhosts();
  
}

void draw(){
  
  for(int i = 0 ; i < Ghosts.length ; i++){
    Ghosts[i].render(); 
  }

}

void buildGhosts(){
  Ghosts = new Disk[10];
  int border = 50;
  for(int i = 0 ; i < Ghosts.length ; i++){
    float xPos = random(border, width-border);
    float yPos = random(border,height-border);
    float xDir = 10;
    float yDir = 10;
    float radius = random(10,30);
    color clr = color(random(20,255),random(20,255),random(20,255),128);
    Ghosts[i] = new Disk(xPos,yPos,xDir,yDir,radius,clr);
  }
}

class Disk{

  float xPos;
  float yPos;
  float xDir;
  float yDir;
  float strokeSize;
  float angle;
  float sideLength;
  float radius;
  color clr;
  
  Disk(float axPos, float ayPos, float axDir,float ayDir, float aradius,color aclr)
  {
    xPos = axPos;
    yPos = ayPos;
    xDir = axDir;
    yDir = ayDir;
    radius = aradius;
    clr = aclr;
    
    strokeSize = 10;
    angle = random(0,2*PI);
    sideLength = random(30,80);
  }
  
  void render(){
    fill(clr);
    strokeWeight(strokeSize/2.0);
    pushMatrix();
      translate(xPos,yPos);
      rotate(radians(angle));
      rect(-sideLength/2.0,-sideLength/2.0,sideLength,sideLength);
    popMatrix();
    //ellipse(xPos,yPos,radius*2,radius*2);
  }
}
