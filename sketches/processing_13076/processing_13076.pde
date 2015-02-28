
int canvasWidth = 650;
int canvasHeight = 650;
int value = 0;
color a,b,c;
color[]mycolors=new color[3];
float PX,PY,X,Y;
      float easing=0.009;  
 
void setup() {
  size(canvasWidth, canvasHeight);
  a=color(255);
  b=color(0);
  c=color(100);
  mycolors[0]=a;
  mycolors[1]=b;
  mycolors[2]=c;
  background(mycolors[int(random(3))]);
  smooth();
  
}

void draw() {
  fill(random(255), random(255), random(255), random(100)+random(100));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  if(key == 'd'){
  drip();
  frameRate(24);}
  if(mousePressed==true){
 drip1();
 frameRate(48);}
if (keyPressed){
  if(key ==' '){background(mycolors[int(random(3))]);}}
  if(mousePressed==false){frameRate(24);}
 }
 void drip(){
   float targetX=mouseX;
      float targetY=mouseY;
      X+=(targetX-X)*easing;
      Y+=(targetY-Y)*easing;
      float weight= 50/dist(X,Y,PX,PY);
      if(weight>=50){weight=random(20,80);}
      strokeWeight(weight);
      line(X,Y,PX,PY);
      PX=X;
      PY=Y;
   }
   
   void drip1(){
   float targetX=mouseX;
      float targetY=mouseY;
      X+=(targetX-X)*easing;
      Y+=(targetY-Y)*easing;
      float weight= 50/dist(X,Y,PX,PY);
      if(weight>=50){weight=random(30,70);}
      strokeWeight(weight);
      line(X,Y,PX,PY);
      PX=mouseX;
      PY=mouseY;
   }
   





