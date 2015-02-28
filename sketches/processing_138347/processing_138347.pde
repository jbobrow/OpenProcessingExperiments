
int x = 100;
int y = 100;
int speed = 4;

void setup(){
  size(800,600);
}

void draw(){
  background(255);
  strokeWeight(0.2);
  carDesign();
   //MOVE
  x = x+ speed;
 
 //return 
 if (x > width || x < 0){
   speed = speed * -1;
 }
}
  
void carDesign(){
   rectMode(CENTER);
  //body
  fill(255,255,0);
  rect(x,y,50,50);
  //stripe
  fill(255,0,0);
  rect(x,y-10,50,10);  
  rect(x,y+10,50,10);
  
  //wheel
  fill(0);
  rect(x-10,y-30,10,10);
  rect(x+10,y-30,10,10);
  rect(x-10,y+30,10,10);
  rect(x+10,y+30,10,10);
}
