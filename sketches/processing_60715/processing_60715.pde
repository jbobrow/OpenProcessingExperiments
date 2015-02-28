
PFont TIPO1;
int TX;
int TY;
int inc;//incremento

void setup(){
  
  size (1024,600);
  
  TIPO1=loadFont("DEATH-FONT-ver1.0-100.vlw");
  textFont(TIPO1);
  frameRate(20);
  TX=100;
  TY=100;
  inc=0;
}

void draw(){
  
  background(0);
  
 fill(random(255),0,0);
  
  text("S",TX,TY);
    text("T",TX+inc*2,200);
     fill(0,random(255),0);
      text("O",TX+inc*4,300);
        text("R",TX+inc*6,400);
        fill(0,0,random(255));
        text("M",TX+inc*8,500);
        text("S",TX+inc*10,600);
  TX=TX+1;
  inc++;
}


