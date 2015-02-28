
PImage actress;
PImage rose;
PImage cake;
PImage phantom;
PImage rabbit;
PImage depp;
int s=600, minSize = 2;
int steps = 5;
boolean next;
boolean previous;
boolean shft;
boolean imp;
int curimage = 0;
PImage image1;
PImage iarray[];
 
dot mom;
boolean sunny;
 
void setup() {
  size(600,600);

  iarray = new PImage[6];
  actress = loadImage("actress.jpg");
  iarray[0]=actress;
  rose = loadImage("rose.jpg");
  iarray[1]=rose;
  cake = loadImage("cake.png");
  iarray[2]=cake;
  phantom = loadImage("phantom of the opera.png");
  iarray[3]=phantom;
  rabbit = loadImage ("rabbit.png");
  iarray[4]=rabbit;
  depp = loadImage("depp.png");
  iarray[5]=depp;
  
 image1=iarray[curimage];
  smooth(); noStroke();
  mom = new dot(s/2,s/2,s,s/2,s/2,s);
  
}

void draw(){
   mom.draw();
   if (sunny==true) {
     mom = new dot(s/2,s/2,s,s/2,s/2,s);
     sunny = false;
   }}

void mouseMoved() {  
    mom.interact();
}
      
class dot {
 
  boolean alife = true; 
  int x0, y0, x, y, d, d0;
  color c0, c;
  float t;    
  dot[] kids;  
  dot(int _x0, int _y0, int _d0, int _x, int _y, int _d) {
    x0=_x0; y0=_y0; d0=_d0; x=_x; y=_y; d =_d;
    c = iarray[curimage].get(x,y); c0 = iarray[curimage].get(x0,y0);
  }
   

void draw() {  
  
    t = constrain(t + 1f/steps ,0,1);
    if(alife) {
      float xt = lerp(x0, x, t), yt = lerp(y0, y, t), dt = lerp(d0, d, t);
      color ct = lerpColor(c0, c, t);
      fill(ct);
     if (shft==false){
        ellipse(xt,yt,dt,dt);
      }else{
       rect(xt,yt,dt,dt);
      } 
    }
    else for(int i=0; i<4; i++) kids[i].draw();   
}
  
   void interact() { 
     
    if(alife) { if (t==1 && d>minSize) giveBirth();}
    else kids[(mouseX-x<0?2:0) + (mouseY-y<0?1:0)].interact();
  }
  
  void impressionize() {
   rect(0,0,s,s);
   } 
   
  void giveBirth() { 
    int e = d/4, f = d/2;
    kids = new dot[] {
      new dot(x,y,d,x+e,y+e,f), new dot(x,y,d,x+e,y-e,f),
      new dot(x,y,d,x-e,y+e,f), new dot(x,y,d,x-e,y-e,f)
    };
    alife = false;
  }}
  
void keyPressed() {
  
   if (key == CODED) {  
     if (keyCode == RIGHT) {
       if (curimage<5) {
        curimage++;
         sunny = true;
        rect(0,0,width,height); 
        print(curimage);
    }
     else if (curimage==5){
       curimage=0; }
 }
 
 if (keyCode == LEFT) {
       if (curimage>0) {
        curimage--;
         sunny = true;
        rect(0,0,width,height); 
        print(curimage);
    }
     else if (curimage==0){
       curimage=5; }
 
     }
   if (keyCode == SHIFT) {
     if (shft == true){
       shft = false;}
     else if (shft == false){
       shft = true;}
       background(0);
 }}}
   
 
  


