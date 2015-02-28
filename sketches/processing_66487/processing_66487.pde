
int x = 0;
int y = 100;
boolean Yspeed = true;   //true means ball is moving down, false means moving up
boolean Xspeed = true;

void setup(){
  size(300, 450);
  background(240, 0, 150);
}

void draw(){
//  background(240, 0, 150);
  noStroke();
  fill(200, 200, 240, 80);
  ellipse(x, y, 20, 20);
  
  noStroke();
  fill(150, 0, 240, 50);
  ellipse(x+100, y+100, 40, 40);
  
  
  if(Yspeed){
    
  y+=5;
  
  } else {
    
  y-=5;
  
  }
  
  if( y >= 440){
    
  Yspeed = false;
  
  }
  
  if(y <= 10){
    
  Yspeed = true;
  
  }
  
   if(Xspeed){
    
  x+=5;
  
  } else {
    
  x-=5;
  
  }
  
  if( x >= 290){
    
  Xspeed = false;
  
  }
  
  if(x <= 10){
    
  Xspeed = true;
  
  }
    
    
  
}
 

