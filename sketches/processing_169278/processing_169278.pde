
PImage ballOpen;
PImage ballClose;
PImage poke1;
PImage poke2;
PImage fossil;
PImage blank;
PImage bg;
Float PX;
Float PY;
int PBX;
int PBY;
int PspeedX=20;
int PspeedY=20;
int BX;
int BY;
int BBX;
int BBY;
int BspeedX=10;
int BspeedY=10;
int FX;
int FY;
int FBX;
int FBY;
int FspeedX=5;
int FspeedY=5;
int PRX;
int PRY;
int BRX;
int BRY;
int FRX;
int FRY;
int sec;

void setup(){
  size(1000, 1000);
  ballOpen=loadImage("pokeopen.png");
  ballClose=loadImage("pokeclose.jpg");
  poke1=loadImage("Breloom.png");
  blank=loadImage("transparent.png");
  poke2=loadImage("poke2.jpg");
  fossil=loadImage("fossil.jpg");
  PX=random(500);
  PY=random(500);
  BX=random(500);
  BY=random(500);
  FX=random(500);
  FY=random(500);
  PBX=PX+180;
  PBY=PY+217;
  BBX=BX+399;
  BBY=BY+417;
  FBX=FX+76;
  FBY=FY+79;
}

void draw(){
 sec=millis();
 fill(random(255),random(255),random(255));
 rect(0,0,1000,1000);
 if(sec>=4000){
    image(fossil,FX,FY);
    FspeedX=0;
    FspeedY=0;
  }
  else{
    image(poke2,FX,FY);
  }
 PX+=PspeedX;
 PY+=PspeedY;
 if(PX>width||PX<0)
   PspeedX = -PspeedX;
 if(PY<0)
   PspeedY+=1;
 if(PY>height)
   PspeedY-=1;
 BX+=BspeedX;
 BY+=BspeedY;
 if(BX>width||BX<0)
   BspeedX = -BspeedX;
 if(BY<0)
   BspeedY+=1;
 if(BY>height)
   BspeedY-=1;
 if((BX<=PX)&&(BY<=PY)&&(sec>=2500)){
   image(ballClose,BX,BY);
   PspeedX=0;
   PspeedY=0;
   BspeedY=0;
   BspeedX=0;
   println("HIT");
 }
 else{
    image(ballOpen,BX,BY);
    image(poke1,PX,PY);
 }
  
  FX+=FspeedX;
  FY+=FspeedY;
  if(FX>width||FX<0)
   FspeedX = -FspeedX;
  if(FY<0)
   FspeedY+=1;
  if(FY>height)
   FspeedY-=1;
   println(sec);
  
}



