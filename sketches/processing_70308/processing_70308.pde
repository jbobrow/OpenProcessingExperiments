
int rad = 40;
int x = 0;
float angle = 0;
boolean Yspeed = true;
boolean Xspeed = true;


void setup() {
  size(600, 300);
}


void draw() {
  background(255);

  angle += radians(5);
  float y = height/2 + cos(angle) * rad;
  noStroke();
  smooth();
  fill(200, 0, 180);
  ellipse(x, y, 15, 15);
  
  if(Yspeed){
    
  y+=3;
  
  } else {
    
  y-=3;
  
  }
  
  if(Xspeed){
    
  x+=3;
  
  } else {
    
  x-=3;
  
  }
  
  if( x >= width){
    
  Xspeed = false;
  
  }
  
  if(x <= 7){
    
  Xspeed = true;
  
  }
    
  
  
}


