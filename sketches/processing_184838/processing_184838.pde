
 float stretchMult=6f;
  float easing = .3;  //easing value

   squid[] mSquid = new squid[1];

void setup() {
  size(512, 512);
  background(255);
  noCursor();
  for (int i = 0; i < mSquid.length; i++) {  mSquid[i]=new squid((i+1)*8);}
  mouseX=width/2;
  mouseY=height/2;
}
float tx, ty;

 void draw() {  //draw background  background(255);
  if (pause)return;
  noStroke(); 
  fill(255, 130); 
  rect(0, 0, width, height);
 
      tx += (mouseX+(-.5+noise((mouseX+frameCount-50)*.008f, 0, 0))*120 - tx) * (easing*.3);
      ty += (mouseY+(-.5+noise(0, (mouseY+frameCount-50)*.008f, 0))*120 - ty) * (easing*.3);

 //  tx=mouseX,ty=mouseY;
  for (int i = 0; i < mSquid.length; i++) {  mSquid[i].draw(tx+i*70,ty+i*70);}

}
 
 class squid{
   Tentacle[] tent;  //declare and name array

 squid(int count){ 
   tent = new Tentacle[count];
   float scale= 2*3.6f/ float(tent.length+1);
   float shift=scale*.2;
  for (int i = 0; i < tent.length; i++) { 
    tent[i] = new Tentacle(width/2, height/2, stretchMult * (cos(scale*i+shift)), stretchMult * (sin(scale*i+shift)));
  }
}
 
 void draw( float tx,float ty){
   for (int i = 0; i < tent.length; i++) {
    tent[i].update(tx, ty);  //math
 
    stroke(0);
    tent[i].display(7);  //visual
  }
 
  fill(75, 200, 0);
  strokeWeight(3.5);
  ellipse(tx, ty, 70, 70);
 
  for (int i = 0; i < tent.length; i++) {
    stroke(75, 200, 0);
    tent[i].display(0);  //visual
  }
  strokeWeight(2);
  stroke(0);
  fill(255);
  ellipse(tx+10, ty-6, 8, 5);
  ellipse(tx-10, ty-6, 8, 5);
  fill(0);
  ellipse(tx+10, ty-6, 1, 1);
  ellipse(tx-10, ty-6, 1, 1);
  noFill();
  arc(tx, ty+6, 20, 20, QUARTER_PI, PI-QUARTER_PI);
  //arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
 }
 }
 
 
boolean pause=false;
void keyPressed() {
  pause=!pause;
}
 

 
 
//class for each "segment" of the Limb
//begin class block:
class Limb { 
  //Vector variables:
  float cX; //center x position
  float cY; //center y position
  float eX, eY;
 
  //Easing variables
  float folX; //follower for x
  float folY; //follower for y
 
  //Other variables
  float size; //size of segment
  float bumpSize;
  float bumpPos;
  float stretch;
 
  int randomBump;
 
  Limb(float x, float y, float s, float ta) {     
    cX = x;   
    cX = y;
    size = s;
    bumpSize = s/2;
    randomBump = int(random(2));
    bumpPos = random(-bumpSize, bumpSize);
  }
 
  void update(float x, float y, float a, float b) {//, float x2, float y2, float s, float e){
    cX = x;   
    cY = y;
    eX = x+a;   
    eY = y+b;
    eX+=(.5-noise((eX+frameCount)*.008f, 0, 0))*20;
    eY+=(.5-noise(0, (eY+frameCount)*.008f, 0))*20;
    folX += (eX - folX) * easing;
    folY += (eY - folY) * easing;
    cX=cX>0?cX<width?cX:width:0;
    cY=cY>0?cY<height?cY:height:0;
    eX=eX>0?eX<width?eX:width:0;
    eY=eY>0?eY<height?eY:height:0;
    stretch = dist(cX, cX, folX, folY);
  }
 
 
  void display(int sw, float a, float b) { 
    strokeWeight(size+sw);
    line(cX, cY, folX, folY); 
    strokeWeight(bumpSize+sw);
    if (randomBump<2) {    
      point(cX+(b*1.5f), cY+(a*1.5f));
    }
  }
}
 
class Tentacle {
  Limb[] segments = new Limb[20];  
  float a, b;
  Tentacle(float x, float y, float ai, float bi) {            
    a=ai;            
    b=bi;   
    for (int i = 0; i < segments.length; i++) {        
      segments[i] = new Limb(x, y, segments.length-(i*1.75)+25, 15);
    }
  }
  void update(float x, float y) {     
    for (int i = 0; i < segments.length; i++) {    
      if (i == 0) {   
        segments[i].update(x, y, a, b);
      } else {   
        segments[i].update(segments[i-1].folX, segments[i-1].folY, a, b);
      }
    }
  }
  void display(int sw) {
    for (int i = 0; i < segments.length; i++) {
//   stroke((255f/segments.length)*i,100,20);
   segments[i].display(sw,a,b);
    }
  }
}
