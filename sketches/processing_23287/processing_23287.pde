



float speed;


float vy = 0;
float vx = 6;
float x = 10;
float y = 100;

float friction = -.5;
float frictionX = .995;
float gravity = 0.0005;
float wind = random(25);

//boolean drawing= false;

//boolean locked = false;

void setup (){
 
 
  background(random(255),random(255),random(255));
  size(800,600);
  smooth();



  
  if(y > height){
    y = height;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
 fill(vx,vy,x);
  rect(y,x,30,y);
  }
  
  void draw(){
  
    speed = abs (pmouseX - mouseX);
    
    vy += gravity + vx;
  vx*=frictionX;
  vx +=wind;
  x += vx;
  y += vy;
  
  if(y > height){
    y = height;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
 fill(vx,speed,x);
  rect(y,x,30,y);
  
     translate(20,10);
    
    if(y > height){
    y = height + 20;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
  
    if(y > height){
    y = height;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
 fill(vx,speed,x);
  rect(y,x,30,y);
  
     translate(20,10);
    
    if(y > height){
    y = height + 20;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
       translate(random(20),random(20));
    
    if(y > height){
    y = height + 20;
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
       translate(random(20),random(20));
    
    if(y > width){
    y = width + random(40);
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;
  }
  translate(width/3, height/2);
  for(int i = 0; i < 360; i++){
    rotate(radians(1));
    stroke(random(255),speed,random(255));
    line(0,0,0,10000);  

}
  
      translate(random(20),random(20));
    
    if(y > width){
    y = width + random(40);
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;

  }

      translate(random(20),random(20));
    
    if(y > width){
    y = width + random(40);
    vy *= friction;
  }    //bounces off wall n rolls
  if( x>width){
    x = width;
    vx = -vx;

  }
} 

  
  
  
  
  
  
  
  
  
  
///if you add friction coefficient to x, a number close to one,
//bounches then stops

