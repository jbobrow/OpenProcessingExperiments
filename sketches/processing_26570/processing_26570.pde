
Spot[] spots = new Spot[600];
PImage img;
 
void setup(){
  size(350,467);
  noStroke();
  fill(255);
   
   
  imageMode(CENTER);
  img = loadImage("bubble.png");
   
  for(int i=0; i<spots.length; i++){
    spots[i] = new Spot(rand(width),rand(height),random(90)+15,
        color(rand(255),rand(255),rand(255),100), random(TWO_PI));
  }
   
  noCursor();
   
  frameRate(30);
}
 
void draw(){
  background(0);
   
  for(int i=0; i<spots.length; i++){
    spots[i].update();
    spots[i].draw();
  }
}
 
int rand(int n){
  return int(random(n));
}
 
//################################################
 
class Spot{
  int x;
  int y;
  float rad;
  float speed;

   
  final int R = 40;
   
  Spot(int x,int y,float speed,color col,float rad){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.rad = rad;
  }
   
  void draw(){
    float a = map(-cos(rad),-1,1,0,255);
    float d = map(sin(rad),-1,1,0,255);
     
    pushMatrix();
     
    translate(d/20,d-128);
     
    image(img,x,y,random(40),random(40));
     
    popMatrix();
     
  }
   
  void update(){
    rad += speed/60*PI/15;
  }
}


