
int dimX=600,dimY=600; 
int numCreatures=30;
int maxCreatures=30; 
Creature[] creatures;   
int i,j;
float amplifier=20;
int baseWeight=20;
int centerX=dimX/2;
int centerY=dimY/2;
float xSpeed=random(15)-random(15);
float ySpeed=random(15)-random(15);
float headWidth=10;
 color mColor=color(22,22,22,155);
 
void mousePressed(){
  amplifier=mouseY/10;
  baseWeight=mouseX/10;
  xSpeed=random(15)-random(15);
  ySpeed=random(15)-random(15);
 // fill(255,255);
 // rect(0,0,dimX,dimY);
}

void keyPressed() {
  // pressing a key will take a picture
  if  (key=='s'){
    saveFrame("output##.png");
  }
  if (key=='c'){
    fill(255,255);
    rect(0,0,dimX,dimY);
  }
 if (key=='b'){
          mColor=color(0);
        }
 if (key=='w'){
          mColor=color(255,55);
   }
} 

void setup() {
  size(int(dimX),int(dimY),JAVA2D);
  creatures = new Creature[maxCreatures];
  for (j=0;j<numCreatures;j++){
    //creatures[i]=new Creature(100, 40, 30, 2); 
    creatures[j]=new Creature(random(300), random(100), 50, 1,j); 
  } 
  background(255); 
  smooth();
  stroke(mColor);
}

void draw(){
  fill(255,255);
  rect(0,0,dimX,dimY);
   //centerX+=xSpeed;
    //centerY+=ySpeed;
    fill(mColor,50);
    strokeWeight(baseWeight+3);
    //ellipse(centerX+xSpeed,centerY+ySpeed,80,60);
    if (centerX>dimX ) {
      centerX=dimX;
      xSpeed*=-1;
    }
    if( centerY>dimY ) {
      centerY=dimY;
      ySpeed*=-1;    
    }
    if( centerX<0 ) {
     centerX=1;
     xSpeed*=-1;
    }
   if ( centerY<0 ){
     centerY=1;
     ySpeed*=-1;  
    }
  for(j=0;j<numCreatures;j++){
    //print ("drawing "+ j +" num \n");
    creatures[j].draw();
  }
}

class Creature{ 
  int numSegs=25;
  float x,y; 
  tailSeg[] segs; 
  float theta=.2; 
  float thetaMuscle=.05;
  float dx,dy,d;
  float sX,sY;
  int cnt=0;
  float incrementX=1;
  float incrementY=1;
  int i;
  int id=0;
  float thetaIncrement;
  
  Creature(float startX, float startY, int startSegs, float segBigRadius, int inIdnum) {
    incrementX=random(10)-random(10);
    incrementY=random(10)-random(10);
    x=startX;
    y=startY;
    sX=x;
    sY=y;
    thetaIncrement=.05;
    numSegs=startSegs;
    id=inIdnum;
    segs = new tailSeg[numSegs];     
    float thisRad=0;
    for (i=0;i<numSegs;i++) {
      segs[i]=new tailSeg(startX,startY+i*segBigRadius,segBigRadius*(numSegs-i)/2);
    }
    //print ("made creature");
  }
  
  void draw() {
    cnt++;
   // thetaMuscle+=random(theta)-random(theta); 
    if (random(1)>.95){
      thetaIncrement=.05;
    }
    thetaMuscle+=thetaIncrement; 
    if(abs(thetaMuscle)>2*PI){
        thetaMuscle=0;
//      amplifier=int(random(20))+15;
//      baseWeight=int(random(3))+8;
//      theta*=-1;
//      stroke(mColor,50);
//      fill(mColor,50);
        if (mColor==color(255,55)){
          mColor=color(0);
        }
        else {
          mColor=color(255,55);
         // mColor=color(int(random(255)),int(random(255)),int(random(255)));
        }
        
    }
   
    else {
      segs[0].x=headWidth*sin((2*PI*id/numCreatures))+centerX;
      segs[0].y=headWidth*cos((2*PI*id/numCreatures))+centerY; 
    }
      //segs[1].x=segs[0].x+sin(PI/180 +thetaMuscle);
      //segs[1].y=segs[0].y-cos(PI/180+thetaMuscle ); 
      segs[1].x=headWidth*1.1*sin((2*PI*id/numCreatures+thetaMuscle))+centerX;
      segs[1].y=headWidth*1.1*cos((2*PI*id/numCreatures+thetaMuscle))+centerY; 
      
    //ellipse(segs[0].x,segs[0].y,segs[0].radius,segs[0].radius);
    //ellipse(segs[1].x,segs[1].y,segs[1].radius,segs[1].radius);
    //line(segs[0].x,segs[0].y,segs[1].x,segs[1].y);
    for(i=2;i<numSegs-2;i++){
      dx = segs[i].x - segs[i-2].x;
      dy = segs[i].y - segs[i-2].y;
      d= sqrt (dx * dx + dy * dy); 
      segs[i].x=segs[i-1].x + (dx * amplifier)/d; 
      segs[i].y=segs[i-1].y + (dy * amplifier)/d;	
      //fill(255,0);
      stroke(mColor,55);
      strokeWeight(baseWeight*(numSegs-i)/numSegs);
      //strokeWeight(2);
      if (segs[i].x==0){
        print ("trouble at"+i);
      }
      line(segs[i-1].x,segs[i-1].y,segs[i].x,segs[i].y);
      //ellipse(segs[i].x,segs[i].y,segs[i].radius,segs[i].radius);  
     if (random(1000)>999) {
        if (numCreatures<maxCreatures-1){
         print ("making number " + (numCreatures+1) +"\n");
         creatures[(numCreatures)] = new Creature(segs[i].x,segs[i].y,30,2,numCreatures++); 
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

