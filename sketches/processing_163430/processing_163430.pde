
int x=0;
int y=0;
int my=3;
int mx=3;
int p2Y=200;
int p1Score=0;
int p2Score=0;

void setup() {
  size(600, 400);
}

void draw() {
 drawBackground();
 fill(0);
  ellipse(x, y, 10, 10);
  noFill();

  x+=mx;
  y+=my;
  if (y>height || y<0) {
    my=my*-1;
  }

if(x>width){
  mx*=-1;
  x=width/2;
  y=height/2;
  p1Score+=1;
}
if(x<0){
  mx*=-1;
  x=width/2;
  y=height/2;
  p2Score+=1;
}
if(p1Score>11 || p2Score>11){
  p1Score=0;
  p2Score=0;
}
fill(0);
  paddle(50, mouseY);
  paddle(550, p2Y);
  noFill();
  
  if(abs(x-50)<10 && abs(y-mouseY)<40){
    mx=abs(mx);
  }
   if(abs(x-550)<10 && abs(y-p2Y)<40){
    mx=-abs(mx);
   }
}
void keyPressed(){
   if(keyPressed){
    if (key=='w' || key=='W'){
      p2Y=p2Y-35;
    }
    if(key=='s' || key=='S'){
      p2Y=p2Y+35;
    }
   }
}

void paddle(int x, int y) {

  rectMode(CENTER);
  rect(x,y, 10, 40);
}
void drawBackground() {
  background(0,50,0);
  fill(255);
  line(0,50,width,50);
  line(0,350,width,350);
  line(width/2,50,width/2,height-50);
  ellipse(width/2,height/2,50,50);
  
  text(p1Score,150,20);
  
  text(p2Score,width-150,20);
  
}











