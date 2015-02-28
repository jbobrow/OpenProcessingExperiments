
float GRAVITY =1;
float FRICTION =0.7;
float X,Y;
Float Spx, Spy;
int Radius =50;

void setup(){
 size(900,900);
 colorMode(RGB,100);
 background(100);
 frameRate(100);
 X =width/2;
 Y=10;
 Spx = random(-50,50);
 Spy = -10.0;
}

void draw(){
 fadeToWhite();
 Spy =Spy + GRAVITY;
 X = X + Spx;
 Y = Y + Spy ;
 bounce();
 noStroke();
 fill(0,0,0);
 ellipse(X,Y,Radius*2,Radius*2);
}


void bounce(){
 float bounceMinX =Radius;
 float bounceMaxX = width - Radius;
 float bounceMinY =Radius;
 float bounceMaxY = height -Radius;
 
 if(X < bounceMinX || X > bounceMaxX){
   Spx = -Spx * FRICTION;
   if(abs(Spx) < 1.0) Spx = 0.0;
   if(X < bounceMinX) X=bounceMinX-(X-bounceMinX);
   if(X > bounceMaxX) X=bounceMaxX-(X-bounceMaxX);
 }  
 if(Y<bounceMinY || Y>bounceMaxY){
   Spy=-Spy*FRICTION;
   if(abs(Spy) < GRAVITY) Spy=0.0;
   if(Y< bounceMinY) Y=bounceMinY-(Y-bounceMinY);
   if(Y> bounceMaxY) Y=bounceMaxY-(Y-bounceMaxY);    
 }
}



void fadeToWhite(){
 noStroke();
 fill(99,30);
 rectMode(CORNER);
 rect(0,0,width,height);
}

void mousePressed() {
  if(mouseButton == LEFT) { 
 Spx = random(-10,10);
 Spy = -30.0;
 Radius=50;
  }

  if(mouseButton == RIGHT) { 
X=10;
Y=10;
Radius=400;
  }
}



