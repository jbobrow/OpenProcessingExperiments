
int timer = 0;
float fX = 200;
float fY= 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = 0.1;
color pColor = color(#FDFF86);
float pR = 10;


void setup(){
  size(800,600);
  frameRate(24);
}

void draw(){
  background(0);
  bean();
  player();
  collisions();
}

void bean(){
  timer++;
  if(timer >= 30){
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#E8FFF8);
ellipse(fX, fY,10,10);
}

void player(){
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  ellipse(pX,pY,pR,pR);
}

void collisions(){
  float pDist = dist(pX,pY,fX,fY);
  if(pDist <= 40){
    pColor = color(#E8FFF8);
  }else{
    pColor = color(#FDFF86);
  }
  if(pDist <= 40){
    pR += 1;
  }
  if(pR >= 250){
    pR -= 110;
  }

  
  
    
}


