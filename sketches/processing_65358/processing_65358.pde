
static final int W=610,   //set to width of the drawing window
                 H=610,   //set to height of the drawing window
                 ZEROX=W/2, ZEROY=H/2;
int x;
int y;
float a;
float c;
float d;
float e;
float f;
int b;
void setup() {
  size(610,610);
  x=300;
  y=550;
  a=random(50,560);
  c=random(50,560);
  d=random(50,560);
  e=random(50,560);
  f=random(50,560);
  b=15;
  
}
int youLost;
int mySeconds;
void draw() {
  background(0); //0 is the # for black
  textSize(24);
  mySeconds=millis()/1000;
  text(""+mySeconds,20,20);
  if (mySeconds>=20) {
    b=b+6;
  }  
  if (mySeconds>=40) {
    b=b+7;
  }  
  if (youLost==1) {
    textSize(96);
    text("YOU LOST", 20,200);
    textSize(24);
    text("<--- your points", 70,20);
    noLoop();
    return;
  }
  fill(255,255,255);
  rect(x,y,30,30);
  fill(255,0,0);
  rect(a,b,50,50);
  if (inRect(x,y,30,30,(int)a+25,b+49)==1) youLost=1;
  rect(c,b,50,50);
  if (inRect(x,y,30,30,(int)c+25,b+49)==1) youLost=1;
  rect(d,b,50,50);
  if (inRect(x,y,30,30,(int)d+25,b+49)==1) youLost=1;
  rect(e,b,50,50);
  if (inRect(x,y,30,30,(int)e+25,b+49)==1) youLost=1;
  rect(f,b,50,50);
  if (inRect(x,y,30,30,(int)f+25,b+49)==1) youLost=1;
  if (b>=0) {
    b=b+5;    
  }
  if(b>=610) {
    b=1;
    a=random(0,610);
    c=random(0,610);
    d=random(0,610);
    e=random(0,610);
    
  }  
}
void keyPressed() {
  if (keyCode == 39) {
    x=x+15;
  } 
  if (keyCode == 37) {
    x=x-15;
  }
  if (x>=600) {
    x=1;
  }
  if (x<=0) {
    x=599;  
  } 
}  

int inRect(int x, int y, int w, int h, int x1, int y1) {
  if (y1>=y && y1<=(y+h)) {
    if (x1>=x && x1<=(x+w)) {
      return 1;
    }
  }
  return 0;  //not in rectangle
}  

