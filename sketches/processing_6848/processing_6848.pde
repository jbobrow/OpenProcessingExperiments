
float beginX = 20.0;
float beginY = 10.0;
float endX = 70.0;
float endY = 80.0;
float distX;
float distY;
float exponent = 3.0;
float x = 0.0;
float y = 0.0;
float step = 0.01;
float pct = 0.0;
int direction = 1;

void setup(){
  size(100,100);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw(){
  fill(0,2);
  rect(0,0,width,height);
  pct += step*direction;
  if ((pct>1.0)||(pct<0.0)){
    direction = direction*-1;
  }
  if (direction ==1 ){
    x = beginX + (pct*distX);
    float e = pow(pct, exponent);
    y = beginY + (e*distY);
  }else{
    x = beginX + (pct*distX);
    float e = pow (1.0-pct, exponent*2);
    y = beginY + (e*-distY)+distY;
  }
  fill(255);
  ellipse(x,y,20,20);
}
  

