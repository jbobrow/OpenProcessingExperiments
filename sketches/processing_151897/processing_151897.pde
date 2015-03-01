
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
completely rec0ded by Marius Ivaskevicius
Presenting to you new game "rainbow invaders" !
Short story: white dot, better known as hero, lived peacefully in the positive rainbow dimension. 
One day invader came from the negative rainbow dimension and started revolution.
You must help hero to defend the positive rainbow dimension, 
but be careful because invader is calling for reinforcements.
Use mouseX to aim.
Press mouse button to fire black hole projectiles.
Good luck.
 */
int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float h;
float s=255;
float b=255;
class Unit{
  float xPos;
  float yPos;
  int size;
  int colour;
  float speed;
  float phase;
  boolean isAlive;
  boolean isSelfAware;
  boolean isBullet;
  Unit(float y,boolean al,boolean sa,boolean bu,int si,int col){
    this.yPos=y;
    this.isAlive=al;
    this.isSelfAware=sa;
    this.isBullet=bu;
    this.size=si;
    this.colour=col;
  }
  void resurrect(float h){
    this.isAlive=true;
    this.yPos=h;
    this.speed=random(10);
    this.phase=random(TWO_PI);
 }
  void go(float x){
    this.xPos=x;
  }
  void fire(float x){
    this.xPos=x;
    this.yPos=height*0.9;
  }
  float getX(){return this.xPos;}
  float getY(){return this.yPos;}
  void update(){
    if(this.isBullet){
      this.yPos-=10;
      bulletX=this.xPos;
      bulletY=this.yPos;
    }
    if(this.isAlive){
      if(this.isSelfAware){
        this.xPos = width/2+sin(radians(frameCount*this.speed)+this.phase)* 200;
        this.colour = int(map(this.xPos,width,0,0,255));
        fill(this.colour,s,b);
        if(dist(bulletX,bulletY,this.xPos,this.yPos)<this.size){
          this.isAlive=false;
          currentInvasionSize--;
          println("currentInvasionSize:",currentInvasionSize);
        }
      }else{
        fill(this.colour);
      }
      ellipse(this.xPos,this.yPos,this.size,this.size);
    }
  }
}
Unit hero;
Unit bullet;
float bulletX;
float bulletY;
Unit[] invaders;
int invadersFleet=100;
void setup() {
  colorMode(HSB);
  noStroke();
  rectMode(CENTER);
  size(500, 500);
  background(50);
  num = 1;
  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);
  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
  }
  hero=new Unit(height*0.9,true,false,false,20,255); 
  bullet=new Unit(height*0.9,true,false,true,10,0);
  invaders=new Unit[invadersFleet];
  for(int i=0;i<invadersFleet;i++){
    invaders[i]=new Unit(width/2,false,true,false,20,0);
  }
  for(int i=0;i<100;i++){
    fill(int(map(i,0,100,0,255)),s,b);
    rect(map(i,0,100,0,width),0,20,20);
  }
}
int skipFrameCounter=0;
int skipFrames=10;
boolean record=false; //enable this to record every 10th frame to files
float hSpeed=1.01;
int currentInvasionSize=0;
int currentInvasionWatch=0;
int nextInvasionSize=1;
void draw() {
  if(currentInvasionSize==0){
    currentInvasionSize=currentInvasionWatch=nextInvasionSize++;
    for(int i=0;i<currentInvasionSize;i++){
      invaders[i].resurrect(map(i,0,currentInvasionSize,height*0.8,0));
    }
  }
  h = map(mouseX, 0, width, 0, 255);
  fill(h,s,b);
  rect(hero.getX(),0,20,20);
  PImage c = get();
  tint(255,100); 
  image(c, mouseX-mouseX*hSpeed,10, width*hSpeed,height*hSpeed);
  hero.go(mouseX);
  hero.update();
  if(mousePressed){
    bullet.fire(hero.getX());
  }
  bullet.update();
  for(int i=0;i<currentInvasionWatch;i++){
    invaders[i].update();
  }
  if(skipFrameCounter++>skipFrames && record){
    skipFrameCounter=0;
    saveFrame("hs####.jpg");
  }
}
