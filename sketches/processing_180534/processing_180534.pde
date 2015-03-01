
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/167870*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="0.jpg"; */

int n=12,r=1,w=280,m=(int)(w*.2),f=6/*settings: n=steps r=border w=width,height m=mouseradius f=force*/;PImage t;
Boolean vMode=true;//move vertex or texture
 AnimationHandler mAnimationHandler;//the AnimationHandler

 int loopMax=3; // each animation frame will loop this number so higher slows down animation
 int power=1; // how far/powerfull animation will move coordinates each frame
 float animationOverlength = 1.8; // how long should each animation stay if finished
boolean isJava=10/3==(int)(10/3); // auto-detecting java / javascript mode
int javaScriptFix=isJava?0:1; // fixing a bug in javascript not moving last coordinates col/row
 
void setup() {
 size(280, 280, P3D);
 colorMode(HSB, 2);
 noStroke();
// frameRate(30);
 t=loadImage("0.jpg");
 t.resize(w-r*n*2, w-r*n*2);
 mouseX=w/2; mouseY=w/2;
 mAnimationHandler=new AnimationHandler();//create the AnimationHandler
}

 
void draw() { background(0,0,.8);
 mAnimationHandler.draw();//The animation Handler does the rest
}
 
void keyPressed(){if(key==' ') setup();else vMode=!vMode;}

 
int currentAnimation;// the number of completed Animations
 
class AnimationHandler {
 peHandler mPeHandler;
 Animation mAnimation; // the animation object

AnimationHandler() {
 mPeHandler=new peHandler();
 currentAnimation=0;
 mAnimation = new EmptyAnimation();// create the first animation
}

 void draw() { 
 mAnimation.draw();//draw the animation
 changeAnimation();//change the animation
 if (frameCount % 100 == 0) {
 if (random(1)<0.5) { } //TODO Special Event a
 else {} //TODO Special Event b
 } mPeHandler.draw(); }
 
 //check if a Animation should be changed
 void changeAnimation() { if (mAnimation.changeStatus == Animation.CHANGE_FORCED) { mAnimation = pickAnimation(); }
 else if (mAnimation.changeStatus == Animation.CHANGE_SUGGESTED && random(1) < 0.02) { mAnimation = pickAnimation(); } }
 Animation pickAnimation() {
 if (random(1)<0.3) vMode=!vMode;
 
 if(currentAnimation<8 ){ //The intro is passed Animation by Animation
 switch(currentAnimation) {
 case 1: vMode=true; return new LaOlaVertAnimation();
 case 2: vMode=false; return new LaOlaHoriAnimation();
 case 3: vMode=true; return new WaveVertAnimation();
 case 4: return new WaveHoriAnimation();
 case 5: return new WobbleVertAnimation();
 case 6: return new UpDownWaveVertAnimation();
 case 7: return new UpDownWaveHoriAnimation();
 default: return new UpDownWaveVertAnimation();
 }}
 else{ int type = (int) (random(0, 8));
 switch(type) { //after the intro return a random Animation
 case 1: return new LaOlaVertAnimation();
 case 2: return new LaOlaHoriAnimation();
 case 3: return new WaveVertAnimation();
 case 4: return new WaveHoriAnimation();
 case 5: return new WobbleVertAnimation();
 case 6: return new UpDownWaveVertAnimation();
 case 7: return new UpDownWaveHoriAnimation();
 default:   mPeHandler=new peHandler(); currentAnimation=0; return new UpDownWaveVertAnimation();
 }}
 }  
 }
 
 
 abstract class Animation {
 int age = 0,lifeTime=500; 
 final static int CHANGE_NOT = 0, CHANGE_SUGGESTED = 1, CHANGE_FORCED = 2;
 int changeStatus = CHANGE_NOT;
 Animation() { age = 0; lifeTime=500; 
 changeStatus = CHANGE_NOT; currentAnimation++;  }
 abstract void update();
 abstract void render();
 void draw() { 
 age++; 
 update();
 render(); // draw the animation
 }}
 
class EmptyAnimation extends Animation {//short lived empty animation
 EmptyAnimation() { super(); changeStatus = CHANGE_SUGGESTED; } void update(){ } void render() { }}
 

 
class LaOlaVertAnimation extends Animation {int overrideAge=r, loopCounter=0;
 LaOlaVertAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; }
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength) {changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime+javaScriptFix ) {  int ix=0,iy=power;
// for (int x=r; x<w/n-r; x++) { 
 int x=age;
 for (int y=r; y<(int)w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].d.z+=iy; }}} void render() { } }
 
 
class LaOlaHoriAnimation extends Animation {int overrideAge=r, loopCounter=0;
 LaOlaHoriAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; }
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime +javaScriptFix) {  int ix=power,iy=0;
 int y=age;
 for (int x=r; x<(int)w/n-r; x++) { 
// for (int y=r; y<w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.z+=ix; } }}  void render() { } }
 
 
class WaveHoriAnimation extends Animation {int overrideAge=r, loopCounter=0;
 WaveHoriAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; }
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime +javaScriptFix) {  int ix=power,iy=0;
 int y=age;
 for (int x=r; x<(int)w/n-r; x++) { 
// for (int y=r; y<w/n-r; y++) { 
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].d.z+=ix; } }} void render() { } }
 
 
class WaveVertAnimation extends Animation {int overrideAge=r, loopCounter=0;
 WaveVertAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; }
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime+javaScriptFix ) {  int ix=power,iy=0;
 int x=age;
// for (int x=r; x<w/n-r; x++) { 
 for (int y=r; y<(int)w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.z+=ix; }}}void render() { } }
 
 
class WobbleVertAnimation extends Animation {int overrideAge=r, loopCounter=0;
 int shift=(int)(w/loopMax)*power; //<>//
 WobbleVertAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; 
 int ix=shift*loopMax,iy=0;
 for (int x=r; x<(int)w/n-r; x++) {  for (int y=r; y<(int)w/n-r; y++) { 
 mAnimationHandler.mPeHandler.p[x][y].o.x+=ix; //mAnimationHandler.mPeHandler.p[x][y].o.y+=iy; 
}}}
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime +javaScriptFix) {  int ix=power,iy=0;
 int x=age;
// for (int x=r; x<w/n-r; x++) { 
 for (int y=r; y<(int)w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.x-=shift; }}} void render() { } }
 
 
 
 
class UpDownWaveVertAnimation extends Animation {int overrideAge=r, loopCounter=0;
 int shift=(int)((int)(w/2)/loopMax)*power;
 UpDownWaveVertAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; }
  int maxAge, minAge;
void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength+lifeTime) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime+javaScriptFix ) {  int ix=power,iy=0;
 minAge=age;
 int x=age;
// for (int x=r; x<w/n-r; x++) { 
 for (int y=r; y<(int)w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mAnimationHandler.mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.y-=shift; } }
else if(age > lifeTime && age < (lifeTime*2+javaScriptFix) ) {
  maxAge=age; 
 int ix=-power,iy=0;
 int x=age-lifeTime;
// for (int x=r; x<w/n-r; x++) { 
 for (int y=r; y<(int)w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.y+=shift; } }} void render() { } }
 
 
 
class UpDownWaveHoriAnimation extends Animation {int overrideAge=r, loopCounter=0;
 int shift=(int)((int)(w/2)/loopMax)*power;
 UpDownWaveHoriAnimation() { super(); changeStatus = CHANGE_NOT; lifeTime=(int)(w/n-r); age=r; 
}
 void update(){ age=overrideAge; loopCounter++;if(loopCounter>=loopMax){loopCounter =0;overrideAge++;}
 if (age >= lifeTime*animationOverlength+lifeTime) { changeStatus = CHANGE_FORCED; } 
 if(age < lifeTime+javaScriptFix ) { 

 int ix=power,iy=0;
 int y=age;
 for (int x=r; x<(int)w/n-r; x++) {  //<>//
// for (int y=r; y<w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mAnimationHandler.mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.x-=shift; } }
else if(age > lifeTime && age < (lifeTime*2+javaScriptFix) ) { 
 int ix=-power,iy=0;
 int y=age-lifeTime;
 for (int x=r; x<(int)w/n-r; x++) { 
// for (int y=r; y<w/n-r; y++) { 
 //if(y*(w/n-r-r)+x==age){
// mPeHandler.p[x][y].o.x+=ix; 
mAnimationHandler.mPeHandler.p[x][y].o.x+=shift; }}} void render() { } }
 







 
class pe { PVector o=new PVector(0, 0, 0); PVector t=new PVector(0, 0, 0); PVector d=new PVector(0, 0, 0); float D=0;
 pe(int tx, int ty) {
 o.x=tx; o.y=ty;
 t.x=tx; t.y=ty;
 d.x=(-w); d.y=(ty); //start location
 }
 
 void u() {
 o.z+=0.01*(o.x-d.x); d.z+=0.01*(o.y-d.y);
 D=dist(mouseX, mouseY, d.x, d.y);
 float iD=0.001*f*(m/D);
if (mousePressed) {
 if (mouseButton==LEFT) { o.z+=iD*(mouseX-d.x); d.z+=iD*(mouseY-d.y); }
 else { o.z+=-iD*(mouseX-d.x); d.z+=-iD*(mouseY-d.y); }
 }
 o.z*=.95; d.z*=.95;
 d.x+=o.z; d.y+=d.z;
 }
}



class peHandler{
 pe[][]p=new pe[w+1][w+1];
 peHandler(){for (int x=r; x<(int)w/n-r; x++) { for (int y=r; y<(int)w/n-r; y++) { p[x][y]=new pe(x*n, y*n); }}}
 
 
 void draw(){
 for (int x=r; x<(int)w/n-r-1; x++) { for (int y=r; y<(int)w/n-r-1; y++) { p[x+1][y+1].u();
 if (x!=r&&y!=r) {
// float k=1+sin((abs(p[x][y].o.z)*abs(p[x][y].d.z))); tint(k, k, constrain(3-p[x][y].D/100f,.5f,3));
 beginShape(); texture(t); 
 if(vMode){ vertex(p[x][y].d.x, p[x][y].d.y, p[x][y].t.x-r*n, p[x][y].t.y-r*n);
 vertex(p[x+1][y].d.x, p[x+1][y].d.y, p[x+1][y].t.x-r*n, p[x+1][y].t.y-r*n);
 vertex(p[x+1][y+1].d.x, p[x+1][y+1].d.y, p[x+1][y+1].t.x-r*n, p[x+1][y+1].t.y-r*n);
 vertex(p[x][y+1].d.x, p[x][y+1].d.y, p[x][y+1].t.x-r*n, p[x][y+1].t.y-r*n);
 }
 else{ vertex(p[x][y].t.x, p[x][y].t.y, p[x][y].d.x-r*n, p[x][y].d.y-r*n);
 vertex(p[x+1][y].t.x, p[x+1][y].t.y, p[x+1][y].d.x-r*n, p[x+1][y].d.y-r*n);
 vertex(p[x+1][y+1].t.x, p[x+1][y+1].t.y, p[x+1][y+1].d.x-r*n, p[x+1][y+1].d.y-r*n);
 vertex(p[x][y+1].t.x, p[x][y+1].t.y, p[x][y+1].d.x-r*n, p[x][y+1].d.y-r*n);
 } endShape();
 } } } 
 }
 }
 
 
 
 
 

