
void setup(){
 size(500, 500); 
}

//setting up the cordinate ball
 int centerx = 250;
 int centery = 250;
 
 int speedx = 3;
 int speedy = 5;
 

void draw(){

  background(33, 255, 104);
  ellipse(centerx, centery, 50, 50);
  fill(238, 255, 104);
 
  centerx = centerx + speedx;
  centery = centery + speedy;
  
  
 if(centerx <= 25){
  speedx = speedx * -1;
 }

  if(centery >= 475) {
  speedy = speedy * -1;
 }
 
  if(centerx >= 475) {
  speedx = speedx * -1;
 }
 
  if(centery <= 25){
  speedy = speedy * -1;
 
 
  
}
}
  

