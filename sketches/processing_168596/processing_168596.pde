
float speedx = random(5,20);
float speedy = random(5,20);
float posx = random(20,300);
float posy = random(20,300);


void setup(){
  size(800,800);
  frameRate(20);
  background(255);
}

void draw(){
  noStroke();
  fill(255,30);
  rect(0,0,width,height);
  fill(random(255),100,255,50);
  ellipse(posx,posy,85,85);
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 800 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 800 || posy-(75/2) <= 0){
    speedy= -speedy;}
  fill(HSB,48,48);
  ellipse(posx,posy,85,85);
  posx =posx + speedx;
  posy =posy + speedy;
  if(posx+(75/2) >= 800 || posx-(75/2) <= 0){
    speedx= -speedx;
  }
  if(posy+(75/2) >= 800 || posy-(75/2) <= 0){
    speedy= -speedy;}
  
  
}
