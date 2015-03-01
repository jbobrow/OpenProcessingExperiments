
float speedx = random(5,20);
float speedy = random(5,20);
float posx = random(20,300);
float posy = random(20,300);
 
 
void setup(){
  size(600,600);
  frameRate(20);
  background(255);
}
 
void draw(){
  noStroke();
  fill(255,30);
  rect(0,0,width,height);
  fill(random(255),0,0);
  ellipse(posx,posy,40,40);
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
  ellipse(posx,posy,90,90);
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
  fill(80,48,48);
  ellipse(posx,posy,90,90);
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 600 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 600 || posy-(75/2) <= 0){
    speedy= -speedy;}
     
    
   
  }}
