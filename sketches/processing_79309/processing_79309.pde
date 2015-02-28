
float vx = 2;
float vy = 1;
float x = 0;
float y = 10;
float frictionx = .998;
float frictiony = -.75;
float gravity = .04;
int rightwall = width;
int clock;
float sec;
int hitCount;

void setup(){
  size(600,600);
  clock = 60;
 // sec = millis()/1000;
 hitCount = 0;
  
}

void draw(){
  background(0);
   sec = millis()/1000;
  //physics math
  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  
  if(y > height){
    y = height;
    vy *= frictiony;
  }
  ellipse(x,y,10,10);
  
  if(x > width){
  vx = -vx;
  }
  if (x < 0){        
    vx = -vx;        
  }
  
  if(y < 0){
    y = 0;
    vy *= frictiony;
  }
  
  text(clock, 20, 20);
  
  if(sec == sec+1){
    clock -= 1;
    
   // clock *= 
  }
  rect(mouseX-35,mouseY,75,20);
  
  if(dist(mouseX,mouseY,x,y) < 10){
   // y = height;
    vy *= frictiony;
    hitCount ++;
    
  }
  if(hitCount > 3){
      text("you win!", height/2,width/2);
    }
  }
  
  

  
  void mouseReleased(){
    vy -= 2;
    vx += 1; 
   
  }
 
  
  //void mousePressed(){              
   // float diffx = mouseX - x;
   // float diffy = mouseY - y;
   // x = x+diffx * .05;
  //  y = y+diffy * .5;
   
 // fill(255); 
  //line(mouseX,mouseY,50,50);
  
  //} 
  //if(dist(x,y,500,500)<10){
   // YOU WIN!
 



