
int rad = 50;

float x;
float y;

int speedx =1;

void setup(){
 size(500,400); 
}


void draw(){
  background(50,30, 60);
  
  smooth();
  float angle = 0;
  float inc = 3;
  
  for(int x=0; x<=width ; x++){
   float y = height/2 + cos(angle) * rad;
  // point(x,y);
   angle += radians(inc);
   
  fill(random(255), random(255), random(255));
  ellipse (x, y, 10,10);
  if (x>width){
    speedx= speedx*(-1);
  }
  
  if (x<0){
    speedx= speedx*(-1);
  }
    x= x+speedx;
  
   noStroke();
  
}

}


