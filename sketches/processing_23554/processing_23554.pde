
Spot[] spots = new Spot[600];
PImage img;

void setup(){
  size(640,480);
  noStroke();
  fill(255);
  
  smooth();
  
  imageMode(CENTER);
  img = loadImage("shootingstar.png");
  
  for(int i=0; i<spots.length; i++){
    spots[i] = new Spot(rand(width),rand(height),random(90)+15,
        color(rand(255),rand(255),rand(255),100), random(TWO_PI));
  }
  
  noCursor();
  
  frameRate(20);
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
  color col;
  
  final int R = 40;
  
  Spot(int x,int y,float speed,color col,float rad){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.col = col;
    this.rad = rad;
  }
  
  void draw(){
    float a = map(-cos(rad),-1,1,0,255);
    float d = map(sin(rad),-1,1,0,255);
    
    pushMatrix();
    
    translate(d/20,d-128);
    
    tint(col,a);
    image(img,x,y);
    
    popMatrix();
    
  }
  
  void update(){
    rad += speed/60*PI/15;
  }
}

