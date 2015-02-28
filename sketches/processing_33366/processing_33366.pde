
void setup(){
 size(500, 500); 
}

//setting up the cordinate ball
 int centerx = 250;
 int centery = 250;
 
 int speedx = 3;
 int speedy = 5;
 
   int a = 50;
  int c = 50;

void draw(){

  ellipse(centerx, centery, a, c);
 
  centerx = centerx + speedx;
  centery = centery + speedy;
  float r =random(255);
  float g =random(255);
  float b =random(255);
  
 if (mousePressed == true) {
    background(r,g,b);
  } 
  
 if(centerx <= 25){
  speedx = speedx * -1;
   a =  a + 20;
   c =  c + 20 ;
  fill(r,g,b);
  ellipse(centerx, centery, 100, 100);
 }

  if(centery >= 475) {
  speedy = speedy * -1;
   a =  a - 10;
   c =  c - 10 ;
  fill(r,g,b);
 }
 
  if(centerx >= 475) {
  speedx = speedx * -1;
  a =  a + 30;
   c =  c + 30 ;
   fill(r,g,b);
 }
 
  if(centery <= 25){
  speedy = speedy * -1;
  a =  a - 5;
   c =  c - 5 ;
  fill(r,g,b);
  
}
  
}

  

