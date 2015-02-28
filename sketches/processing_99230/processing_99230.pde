
int rBlockX = 100;
int rBlockY = 300;
int gBlockX = 1100;
int gBlockY = 300;


class PVector {
  float x;
  float y;
   
  PVector(float x_, float y_){
    x = x_;
    y = y_;
  }
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}
      
PVector location;
PVector velocity;
 
void setup() {
  size (1200,800);
  smooth ();
  background (255);
  location = new PVector (100,100);
  velocity = new PVector (15,5);
  
  
}
 
void draw() {
  noStroke();
  fill(255,10);
  //fill(0,255,0);
  rect(0,0,width,height);
  
  //GREEN BAR
  fill(0,255,0);
  rect gBlock = rect(gBlockX,gBlockY,20,200);
  //RED BAR
  fill(255,0,0);
  rect rBlock = rect(rBlockX,rBlockY,20,200);
   
  // add current speed to the location
  location.add(velocity);
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  // display circle at x,y location
  stroke(0,255,0);
  fill(0,150,255);
  ellipse(location.x, location.y,16,16);
  if(mouseY > rBlockY) 
  {
   rBlockY += 5;
  }
  if(mouseY < rBlockY)
  {
    rBlockY -= 5;
  }
  
  
  
  

  
}



