
int posX = 200;
int posY = 300;
int speedx = 2;
int speedy = 3;
int circleWidth = 250;
color a = #FF0000;
color b = #FF3333;
color c = #FF3366;
color d = #FF0099;
color e = #FF00CC;
color f = #FF33FF;

color[] palette = {a,b,c,d,e,f};
  
void setup(){
  size(600,600);
  ellipseMode(CENTER);
}
  
void draw(){
  background(216,239,235);
  int ranNum = floor(random(0,5));
  fill( palette[ranNum] );
  noStroke ();
  ellipse(posX, posY, circleWidth, circleWidth);
   
  if (posX < 0 + (circleWidth/2)){
    speedx = -1*speedx;
  }
    
   if (posX > width - (circleWidth/2)){
    speedx = -1*speedx;
  }
    
  if (posY < 0 + (circleWidth/2)){
    speedy = -1*speedy;
  }
    
  if (posY > height- (circleWidth/2)){
    speedy = -1*speedy;
  }
    
  posX = posX + speedx;
  posY = posY + speedy;
    
}
