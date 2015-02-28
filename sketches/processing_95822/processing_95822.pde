
int elapsedFrames = 0;
ArrayList points = new ArrayList();
boolean drawing = false;
int DELAY = 200;
int TIME = 0;
 
void setup(){
  smooth();
  size(1280,800);
 
  background(0);
}
 
void draw(){
  TIME++;
  if(drawing == true){
    PVector pos = new PVector();
    pos.x = mouseX;
    pos.y = mouseY;
 
    PVector vel = new PVector();
    vel.x = (0);
    vel.y = (0);
   
    Point punt = new Point(pos, vel, 250);
    points.add(punt);
    TIME = 0 ;
  }
  if(TIME>DELAY){
    fill(0,10);
    rect(0,0,width,height);
  }
   
   
  for(int i = 0; i < points.size(); i++){
   Point localPoint = (Point) points.get(i);
   if(localPoint.isDead == true){
    points.remove(i);
   }
   localPoint.update();
   localPoint.draw();
  }
   
  elapsedFrames++;
}
 
 
void keyPressed(){
  if(key == ' '){
    for(int i = 0; i < points.size(); i++){
       Point localPoint = (Point) points.get(i);
       localPoint.isDead = true;
    }
    noStroke();
    fill(0);
    rect(0, 0, width, height);
  }
}
 
void mousePressed(){
  drawing = true;
}
 
void mouseReleased(){
  drawing = false;
}
 
 
 
class Point{
   
  PVector pos, vel, noiseVec;
  float noiseFloat, lifeTime, age;
  boolean isDead;
   
  public Point(PVector _pos, PVector _vel, float _lifeTime){
    pos = _pos;
    vel = _vel;
    lifeTime = _lifeTime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
  }
   
  void update(){
    noiseFloat = noise(pos.x * 0.0025, pos.y * 0.0025, elapsedFrames * 0.001);
    noiseVec.x = cos(((noiseFloat -0.3) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat - 0.3) * TWO_PI) * 10);
     
    vel.add(noiseVec);
    vel.div(2);
    pos.add(vel);
     
    if(1.0-(age/lifeTime) == 0){
     isDead = true;
    }
     
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
     isDead = true;
    }
     
    age++;   
  }
   
  void draw(){   
    fill(255,250,224);
    noStroke();
    ellipse(pos.x, pos.y, 1-(age/lifeTime), 1-(age/lifeTime));
  }
};
