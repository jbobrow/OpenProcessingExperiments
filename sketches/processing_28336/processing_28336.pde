
void setup(){
  size(600,600);
  stroke(255);
  smooth();
}

void draw(){
  background(192);
  grid();
  //dibuja un mechero
  mechero(300, 550, 500, color(0));
  mechero(50, 550, 100, color(0,30,192));
}

void mechero(float mX, float mY, float mH, color miColor){
  float modulo = mH/12;
  // plastico
  fill(miColor);
  noStroke();
  rect(mX-(modulo*2.5), mY-(modulo*9) , modulo*5, modulo*9);
  // metal
  fill(225);
  rect(mX-(modulo*2.5), mY-(modulo*12) , modulo*2.5, modulo*3);
  triangle(mX, mY-(modulo*12),mX+modulo,mY-(modulo*9),mX,mY-(modulo*9) );
  // gas
  fill(192,0,0);
  noStroke();
  rect(mX+modulo, mY-(modulo*10), modulo*2, modulo/2);
  rect(mX+modulo, mY-(modulo*9)-modulo/2, modulo*3/2, modulo/2);
}

void grid(){
  stroke(255,128);
  for(float n = 0; n< width; n+=(width/36.00)){
   line(0,n,width,n);
   line(n,0,n,height);
  }
}


