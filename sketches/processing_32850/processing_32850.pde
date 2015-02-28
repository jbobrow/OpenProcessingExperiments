
float x = 0;  
float y = 0; 
float w = 1024; 
float h = 120; 


int elapsedFrames = 0;
ArrayList points = new ArrayList();
boolean drawing = false;

 
void setup(){
  size(1024,768);
    smooth();
  background(0);
 
  
}
 
void draw(){
  
 
  
  

   boolean hit = false;
    
    if (mouseX > x && mouseX < x + w) {
    if (mouseY > y && mouseY < y + h) {
    
      hit = true;
    }
  }
  
  
if (hit == true) {
  
 
    PVector pos = new PVector();
    pos.x = mouseX;
    pos.y = mouseY;
 
    PVector vel = new PVector();
    vel.x = (0);
    vel.y = (0);
   
    Point punt = new Point(pos, vel, 1000);
    points.add(punt);
   
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
background(0);
}
 


void mouseMoved(){
  drawing = true;
}
 
 
void mousePressed(){
 PFont font;
 
  font = loadFont ("Garamond-25.vlw");
  textFont (font);
 
textSize(20); 
fill(180,110);
text ("portfolio", 60, 180);
text ("vita", 60, 220);
text ("kontakt", 60, 260);
font = loadFont ("Garamond-100.vlw");
 
textFont (font);
 
textSize(100); 
fill(10,240);
text ("lichtzeichnerin", 60, 120);

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
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 1-(age/lifeTime), 1-(age/lifeTime));

  }
}





