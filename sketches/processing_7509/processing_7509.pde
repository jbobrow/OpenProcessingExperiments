
int dimX=1280,dimY=800; 
int numCreatures=1;
int maxCreatures=1; 
Creature[] creatures;   
int i,j;
float amplifier=20;
int baseWeight=20;

void mousePressed(){
  amplifier=mouseY/20;
  baseWeight=mouseX/10;
}

void setup() {
  size(int(dimX),int(dimY),JAVA2D);
  creatures = new Creature[maxCreatures];
  for (j=0;j<numCreatures;j++){
    creatures[i]=new Creature(100, 40, 50, 2); 
    //creatures[j]=new Creature(random(300), random(100), round(random(40)), 2); 
  } 
  background(0); 
  smooth();
}

void draw(){
  fill(0,255);
  rect(0,0,dimX,dimY);
  for(j=0;j<numCreatures;j++){
    //print ("drawing "+ j +" num \n");
    creatures[j].draw();
    
  }
}

class Creature{ 
  int numSegs=25;
  float x,y; 
  tailSeg[] segs; 
  float theta=0.005; 
  float thetaMuscle=.1;
  float dx,dy,d;
  float sX,sY;
  int cnt=0;
  int increment=1;
  int i;
  
  Creature(float startX, float startY, int startSegs, float segBigRadius) {
    
    x=startX;
    y=startY;
    sX=x;
    sY=y;
    numSegs=startSegs;
    segs = new tailSeg[numSegs];     
    float thisRad=0;
    for (i=0;i<numSegs;i++) {
      segs[i]=new tailSeg(startX,startY+i*segBigRadius,segBigRadius*(numSegs-i)/2);
    }
    print ("made creature");
  }
  
  void draw() {
    cnt++;
    if (cnt>=baseWeight){
     // print ("switch");
      cnt=0;
     increment*=-1;
     //amplifier=10+random(5);
    }
    thetaMuscle+=theta; 
    if (segs[0].x>dimX) {
      segs[0].x=random(100);
      segs[0].y=random(100);
      //print ("spawned");
    }
    else {
      segs[0].x+=random(3);
      segs[0].y+=random(3); 
    }
    segs[1].x=segs[0].x+sin(PI/180 + thetaMuscle);
    segs[1].y=segs[0].y-cos(PI/180 + thetaMuscle); 
    
    line(segs[0].x,segs[0].y,segs[1].x,segs[1].y);
    for(i=2;i<numSegs-2;i++){
      dx = segs[i].x - segs[i-2].x;
      dy = segs[i].y - segs[i-2].y;
      d= sqrt (dx * dx + dy * dy); 
      segs[i].x=segs[i-1].x + (dx * amplifier)/d; 
      segs[i].y=segs[i-1].y + (dy * amplifier)/d;	
      fill(255,10);
      stroke(255,0,0,255);
      strokeWeight(baseWeight*(numSegs-i)/numSegs);
      line(segs[i-1].x,segs[i-1].y,segs[i].x,segs[i].y);
      ellipse(segs[i].x,segs[i].y,segs[i].radius,segs[i].radius);  
     if (random(1000)>999) {
        if (numCreatures<maxCreatures-1){
         print ("making number " + (numCreatures+1) +"\n");
         creatures[(numCreatures)] = new Creature(segs[i].x,segs[i].y,30,2); 
         numCreatures++;  
      }
     }  
  }
  }
}
class tailSeg{
  float x,y; 
  int type=1; // Using circular segs by default
  float radius=1; //small ones by default

  tailSeg(float inX, float inY, float inRadius) {
    x=inX;
    y=inY;
    radius=inRadius;
  }

}

