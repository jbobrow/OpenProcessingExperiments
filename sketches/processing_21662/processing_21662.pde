
Walker[] walkers = new Walker[100];
color[] myColors = new color[4];




void setup(){
  size(600,600);
   background(0);
 
myColors[0] = color(0,255,0,random(100));
myColors[1] = color(0,0,255,random(100));
myColors[2] = color(255,random(100));
myColors[3] = color(0,255,255,random(100));
 
  for(int i = 0; i < walkers.length;i++){
    walkers[i] = new Walker(random(50,550),random(50,550));
    
  }
}
  
  void draw(){
    rectMode(CORNERS);
    
    
    for(int i = 0; i < walkers.length;i++){
    walkers[i].display();
    walkers[i].move();
    
  }
  }
  
  class Walker{
    
    float x;
    float y;
    color cWalk = myColors[floor(random(0,4))];
    float Strk = random(1,8);
    Walker(float x_,float y_){
      
      x = x_;
      y = y_;
      
    }
    
  void display(){
  strokeWeight(Strk);
  stroke(cWalk);
  point (x,y);
 
  }
 
 void move(){
  
  x = x + random(-2,2);
  y = y + random(-2,2);
 
 }
} 
   
    

