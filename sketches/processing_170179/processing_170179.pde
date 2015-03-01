
float speedx = random(5,20);
float speedy = random(5,20);
float posx = random(20,300);
float posy = random(20,300);
 
 
void setup(){
  size(600,600);
  background(random(0,255)); // random will get rid of everlasting tail
}
 
void draw(){
   frameRate(20);
  noStroke();
  fill(255,30);
  rect(0,0,width,height);
  int r = 40 ;
  fill(random(20,255),0);
  ellipse(posx,posy,r,r); //replace 40 and 400 with variables
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
  fill(HSB,48,48);
  ellipse(posx,posy,40,40);
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
     
     
     if (mousePressed) {
       frameRate(3);
  background(130);
       ellipse(posx,posy,110,110); //face 
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
    
    fill(245, 226, 17);
     ellipse(posx+10,posy+10,10,10); //eye
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
 
    fill(245, 226, 17);
     ellipse(posx-10,posy-10,10,10); //eye
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}  
    
    
    fill(188, 6, 12);
     ellipse(posx,posy,30,30); //nose 
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}  
   
  }}

