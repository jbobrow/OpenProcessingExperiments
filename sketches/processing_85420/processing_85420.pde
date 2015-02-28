
int x;
int y;
float a;
float c;
float d;
float e;
float f;
float m;
int n;
int b;
int pause;
int start;
int x10;
int y10;
int x11;
int y11;
int x12;
int y12;
int y13;
void setup() {
  size(610,610);
  x10=150;
  y10=100;
  x11=50;
  y11=200;
  x12=155;
  y12=500;
  y13=210;
  if (start == 1) {
  mySeconds=0;
  x=300;
  y=550;
  a=random(50,560);
  c=random(50,560);
  d=random(50,560);
  e=random(50,560);
  f=random(50,560);
  m=random(50,560);
  b=15;
  currenttime=1000;
 
  }
  
  
}
int youLost;
int mySeconds;
int myseconds;
int restart;
int currenttime;
void draw() {
  background(0); //0 is the # for black
  textSize(96);
  fill(255,0,0);
  text("Blocks", x10,y10);
  textSize(24);
  text("Use the left and right arrow keys to move.", x11,y11);
  text("Press the s key to begin", x12,y12);
  fill(255,0,0);
  rect(y11,y13+10,50,50);
  fill(0);
  rect(y11+2,y13+2+10,46,46);
  fill(255,0,0);
  text("←", y11+15,y13+30+10);
  fill(255,0,0);
  rect(y11+100,y13+10,50,50);
  fill(0);
  rect(y11+2+100,y13+2+10,46,46);
  fill(255,0,0);
  text("→", y11+15+100,y13+30+10);
  text("Avoid red blocks", y10+100,y10+210);
  text("Purple blocks add to your score", y10+10,y10+270);
  text("Press p to pause and u to unpause.", y10+10,y10+325);
  text("By Noah Caplinger", x10+20,y10+50);
 
   if (start == 1) {
  textSize(24);
  text(""+mySeconds,20,20);
  if (mySeconds>=20) {
    b=b+6;
  }  
  if (mySeconds>=40) {
    b=b+7;
  }  
  if (restart == 1) {
    mySeconds=0;
    restart=0;
  }
  if(millis()>=currenttime){
    currenttime=millis()+1000;
    mySeconds=mySeconds+1;
  }
    if (youLost==1) {
    textSize(96);
    text("Game Over", 20,200);
    textSize(24);
    text("<--- your score", 70,20);
    text("Press r to restart", 50,300);
    noLoop();
    return;
  }
  fill(255,255,255);
  rect(x,y,30,30);
  fill(255,0,0);
  rect(a,b,50,50);
  if (inRect(x,y,30,30,(int)a+25,b+49)==1){
    youLost=1;
  }
  rect(c,b,50,50);
  if (inRect(x,y,30,30,(int)c+25,b+49)==1){
    youLost=1;
  }
  rect(d,b,50,50);
  if (inRect(x,y,30,30,(int)d+25,b+49)==1){
    youLost=1;
  }
  rect(e,b,50,50);
  if (inRect(x,y,30,30,(int)e+25,b+49)==1){
    youLost=1;
  }  
  rect(f,b,50,50);
  if (inRect(x,y,30,30,(int)f+25,b+49)==1){
    youLost=1;
  }
  fill(255,0,255);
   rect(m,n,50,50);
  if (inRect(x,y,30,30,(int)m+25,n+49)==1){
    mySeconds=mySeconds+8;
    m=random(0,1000);
    n=1;
  }
  if (b>=0) {
    b=b+5;    
  }
  if (n>=0) {
    n=n+5;
  }
  if(b>=610) {
    b=1;
    a=random(0,610);
    c=random(0,610);
    d=random(0,610);
    e=random(0,610);
  
  } 
  if(n>=610) {
    n=1;
    m=random(0,1000);
  }
 
   } 
}
void keyPressed() {
  if (keyCode == 83) {
    start=1;
     x=300;
    y=550;
    a=random(50,560);
    c=random(50,560);
    d=random(50,560);
    e=random(50,560);
    f=random(50,560);
    b=15; 
    mySeconds=0;
    youLost=0;
    fill(0);
    rect(20,0,30,30);
    loop();
    restart=1;
    x10=1500;
    y10=1000;
    x11=5000;
    y11=2000;
    x12=1055;
    y12=5000;
  }
  if (start == 1) {
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
  if(keyCode == 82) {
    x=300;
    y=550;
    a=random(50,560);
    c=random(50,560);
    d=random(50,560);
    e=random(50,560);
    f=random(50,560);
    b=15; 
    mySeconds=0;
    youLost=0;
    fill(0);
    rect(20,0,30,30);
    loop();
    n=1;
    restart=1;
  }
  if(keyCode == 80) {
    pause=1;
  }
  if(keyCode == 85) {
    pause=0;
  }
  if(pause == 1) {
    noLoop();
  }
  if(pause == 0) {
    loop();
  }
    
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

