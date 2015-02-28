
int x = 0;
int y = 0;
int xr= 0;
int x1=400;
int yb=300;


int speed = 3;
int speed1=3;
int speedx1=3;
int speedyb=2;
int R;
int G;
int B;
int meet;
int R1;
int G1;
int B1;



void setup() {
  size(400,400);
  smooth();
  int R=225;
  int G=225;
  int B=225;
  
}

void draw() {
  background(255,255,255);
  x = x + speed;
  y = y + speed;
  x1= x1 -speed;
  R = 225- meet; 
  G = 225-meet;
  B = 225-meet;
  R1= 0+meet;
  G1=0 +meet;
  B1= 0+meet;
  yb= yb-speedyb;
  if((yb>height)||(yb<0)){speedyb=speedyb*-1;meet+=30;}

  if ((x > width) || (x < 0)) {
    speed = speed*-1; meet+=30;
  }
if((y>height)||(y<0)){
     speed1= speed1*-1; meet+=30;
   }
if((x1>width)||(x<0)){
     speedx1=speedx1*-1;
   }
if (dist(x,100,100,y)<100){

    fill(255,255,255);stroke(225,225,225);}
if(dist(x,100,100,y)>100){
  fill(R,G,B);noStroke();}
  
  ellipse(x,100,100,100);
  ellipse(100,y,100,100);
  ellipse(x1,100,100,100);
  fill(R1,G1,B1);
  rect(0,yb,400,50);
  
}



