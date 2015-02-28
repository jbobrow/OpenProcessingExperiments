
int NUM = 30;
int speedMAX = 5;
float[] brad = new float[NUM/4];

Thing[] balls = new Thing[NUM]; 

boolean node;

void setup(){
  
  size(1280,700);
  smooth();
  
  for (int i = 0; i < NUM; i++){
    PVector origin = new PVector(width/2,height/2,0);
    balls[i] = new Thing(origin, random(100));
  }
  
  for(int i = 0; i < NUM/4; i++){
   brad[i] = random(width); 
  }
}



void draw(){
  
  background(0);

//  rect(0,0,width,height);
  
 
 
   stroke(255);
   noFill();
   rectMode(CENTER);
   for(int i = 0; i < NUM/4; i++){
   rect(width/2,height/2,brad[i],brad[i]);
    brad[i]+=9;
    if(brad[i] > width) brad[i] = 0;
   }
  
  
  for (int i = 1; i < NUM; i++){
  balls[i].run();
  balls[i].collision();
  
  stroke(255);
  strokeWeight(1);
  line(balls[i].loc.x,balls[i].loc.y,balls[i-1].loc.x,balls[i-1].loc.y);
  
  
  
  
   float d = dist( balls[i-1].loc.x , balls[i-1].loc.y , balls[i].loc.x , balls[i].loc.y ) ;   
   if (d < (balls[i].rad-balls[i].expr)){
    balls[i].direction = -balls[i].direction;
     
   }
  }
  
  if(node){
   balls[5].rad = sin(frameCount*PI/70)*5000;
    }
}


void keyPressed(){
  
    if(key == 'n'){  
        node = !node;
        
    }
}         
            
            
            class Thing{
  int direction = 1;
  float rad, expr;
  
  PVector loc = new PVector();  
  PVector vel = new PVector(random(-speedMAX,speedMAX),
  random(-speedMAX,speedMAX),random(-speedMAX,speedMAX));
  
  Thing( PVector _origin, float _rad ){
    loc = _origin;
    rad = _rad;
    }
  
  void run(){
    
   loc.x += vel.x * direction;
   loc.y += vel.y * direction;
//    loc.add(vel) ;
  noFill();
  strokeWeight(4);
     ellipse(loc.x,loc.y,rad-expr,rad-expr); 
//     strokeWeight(2);
//     ellipse(loc.x,loc.y,expr,expr);
//     strokeWeight(1);
//     ellipse(loc.x,loc.y,expr*70,expr*70);
     
     expr = sin(frameCount * PI / 800) * 60;
     
  }
  
  void collision(){
    
  
    if((loc.x >= width - rad) || (loc.x <= 0)) direction = -direction;
    if((loc.y >= height - rad) || (loc.y <= 0)) direction = -direction;
  }
  
  
  
}    
