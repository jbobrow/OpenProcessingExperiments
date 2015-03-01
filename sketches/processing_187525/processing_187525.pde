
//Rebote en ejes X y Y
int pX, pY, vX, vY;
int t = 60;


void setup(){
  size(95,200);
  colorMode(HSB);
  pX = width/2;
  pY = height/2;
  vX = 20;
  vY = 20;
}

void draw(){
  background(random(t),100,50);
 

  pX = pX+vX;
  pY = pY+vY;
  for (int i = 600; i > 0;i = i -10) {
fill(random(t),200,50);
  ellipse(pX,pY,i,i);
  }
  if((pX<0)||(pX>width)){
    vX = -vX;
  } 

  if((pY<0)||(pY>height)){
    vY = -vY;
  } 
}
