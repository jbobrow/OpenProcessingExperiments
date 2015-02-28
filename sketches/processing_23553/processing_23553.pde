
Spot[] spots = new Spot[150];
PImage img;

void setup(){
  size(640,480);
  noStroke();
  fill(255);
  
  smooth();
  
  imageMode(CENTER);
  img = loadImage("spotlight.png");
  
  for(int i=0; i<spots.length; i++){
    spots[i] = new Spot(rand(width),rand(height),random(90)+15,
        color(rand(255),rand(255),rand(255),100));
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


class Spot{
  int x;
  int y;
  float rad;
  float speed;
  color col;
  
  final int R = 40;
  
  Spot(int x,int y,float speed,color col){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.col = col;
  }
  
  void draw(){
    float a = map(-cos(rad),-1,1,0,255);
    
    tint(col,a);
    image(img,x,y);
  }
  
  void update(){
    rad += speed/60*PI/15;
  }
}

