
//Rebote en ejes X y Y con aumento de velocidad
int pX, pY, vX, vY;
int t = 60;


void setup(){
  size(900,600);
  colorMode(HSB);
  pX = width/2;
  pY = height/2;
  vX = 20;
  vY = 20;
}

void draw(){
  background(random(t),255,255);
  
  pX = pX+vX;
  pY = pY+vY;
  
fill(random(t),255,255);
  ellipse(pX,pY,t*2,t*2);
  
  if((pX<0)||(pX>width)){
    vX = -vX;
  } 

  if((pY<0)||(pY>height)){
    vY = -vY;
  } 
if (mousePressed){
  pX = pX+vX;
  pY = pY+vY;
  
fill(random(t),255,255);
  ellipse(pX,pY,t,t);
  
  if((pX<0)||(pX>width)){
    vX = -vX;
  } 

  if((pY<0)||(pY>height)){
    vY = -vY;
  } 
  }
}

