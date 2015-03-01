
float x=10;
float y=15;
float speed= 2;
float up=4;

void setup(){
  size(500,500);
  
}

void draw(){
  
  ellipseMode(RADIUS); 
  fill(255); 
  ellipse(x,y,30, 30);
  x= x+speed;
  y= y+up;

  ellipseMode(CENTER);  
  fill(100);  
  ellipse(y,x,30, 30);
  
   if (y>height -10){
    up=-2;
  }  
  if (y<10){
    up=2;
    
  }
  if (x > height -10) {
    speed= -2;
  }
  
  if(x<10){
    speed=2;
  }
  
  if (x==250|| y==250){
     
  }
  
  if (x>width-10){
    speed= -15;
  }
 if (x<10){
   speed=15;
  }
  
}
