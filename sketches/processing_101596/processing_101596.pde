
int centerX;
int centerY;
color c1;
color c2;
color c3;
color c4, c5, c6;
PVector prevPos, center;
float factor;
boolean running;


void setup() {
int colcomp1, colcomp2, colcomp3; 

  size(600, 600);
  
  colcomp1 = int(random(0,255));
  colcomp2 = int(random(0,255));
  colcomp3 = int(random(0,255));
    
  c1=color(colcomp1,colcomp2,0);
  c2=color(colcomp3,0,colcomp1);
  c3=color(colcomp1,colcomp2,colcomp3);
  c4=color(colcomp1,0,0);
  c5=color(0,0,colcomp3);
  c6=color(0,colcomp3,0);
    
  prevPos = new PVector(0,0);
  center = new PVector(width/2, height/2);
  running = true;
  
}
 
void draw() { 


  
  centerX=mouseX;
  centerY=mouseY;
  if (centerX<0) {
    centerX=0;}
  if (centerY<0) {
    centerY=0;}  
  
  rectMode(CORNERS);
  stroke(c6);
  fill(c1);
  rect(-1,-1,centerX,centerY);
  fill(c2);
  rect(centerX,-1,width+1,centerY);
  fill(c3);
  rect(-1,centerY,centerX,height+1);
  fill(c4);
  rect(centerX,centerY,width+1,height+1);
  
  rectMode(CENTER);
  fill(c5);
  rect(centerX,centerY,width*factor,height*factor);
}

void mouseMoved() {

PVector currPos, posDiff, centDiff;
color c;

currPos = new PVector(mouseX, mouseY);
posDiff = PVector.sub(prevPos, currPos);

if (posDiff.mag()>50) {
  prevPos=currPos;
 centDiff = PVector.sub(center, currPos);
 factor = map(centDiff.mag(),0,sqrt(sq(width/2) + sq(height/2)),0.5,0); 
 c=c6;
 c6=c5;
 c5=c4;
 c4=c3;
 c3=c2;
 c2=c1;
 c1=c;
 strokeWeight(int(random(1,16)));
}  
}

void mouseClicked() {
int colcomp1, colcomp2, colcomp3;   
  if (running) {
    noLoop();
  } else {
    colcomp1 = int(random(0,255));
  colcomp2 = int(random(0,255));
  colcomp3 = int(random(0,255));
    
  c1=color(colcomp1,colcomp2,0);
  c2=color(colcomp3,0,colcomp1);
  c3=color(colcomp1,colcomp2,colcomp3);
  c4=color(colcomp1,0,0);
  c5=color(0,0,colcomp3);
  c6=color(0,colcomp3,0);
    loop();
  }
  running = !running;
  
}


