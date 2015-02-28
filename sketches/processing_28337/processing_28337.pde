
void setup(){
  size(600,600);
  stroke(255);
  smooth();
  frameRate(36);
}

void draw(){
  background(192);
  grid();
  unaFiladeMecheros(8);
  // escala cromática
  escala();
}

void mechero(float mX, float mY, float mH, color miColor){
  float modulo = mH/12;
  // plastico
  fill(miColor);
  noStroke();
  rect(mX-(modulo*2.5), mY-(modulo*9) , modulo*5, modulo*9);
  // metal
  fill(0,0,90);
  rect(mX-(modulo*2.5), mY-(modulo*12) , modulo*2.5, modulo*3);
  triangle(mX, mY-(modulo*12),mX+modulo,mY-(modulo*9),mX,mY-(modulo*9) );
  // gas
  fill(0,100,80);
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

void escala(){
   colorMode(HSB,360,100,100);
   for(float n = 0; n< width; n+=(width/36)){
     fill(map(n,0,width,0,360),90,80);
     noStroke();
     rect(n,0,width/36,5);
   }
   // vuelve a RGB
  colorMode(RGB,255,255,255);
}

void unaFiladeMecheros(int cuantos){
  // modificar colores
  colorMode(HSB,360,100,100);
  
  int miS = 90;
  int miB = 80;
  
  float anchoM = width/cuantos;
  for(int n = 0; n< width; n+=anchoM){
    float miH = map(n,0,width,0,360);
    mechero(n+(anchoM/2),550,anchoM*1.5, color(miH,miS,miB));
  }
}




