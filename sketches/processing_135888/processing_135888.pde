
import java.awt.Rectangle;

int y=250;int x;int p=250;float score=0;int p1=350;float m=100;
int vitesse=510;float a=200;float b=124;float c=69;float d=100;float e=249;
float f=165;
boolean fini=false;
Rectangle rect1, rect2, rect3;
void setup () {
  size (1200,500) ;
}
void draw() {frameRate(vitesse);
 if(score%100==0) vitesse=vitesse+50;

  rect1=new Rectangle(x,p,5,(int)m) ;
  rect2=new Rectangle(1092,y-8,16,16) ;
  rect3=new Rectangle(x,p1,5,(int)m);
  
  background (d,e,f) ;
  text(floor(score), 10, 50) ;
  fill(a,b,c); ellipse (1100,y,15,15) ;
  rect (x,p,5,m) ;
  rect (x,p1,5,m) ;
  if(x==1200) {m=random(100,200); }
  if(fini==false){ x=x+6 ; score=(score+0.1);}
  if(x==1200) {x=0;p=(int)random(500); }
  a=random(0,255);b=random(0,255);c=random(0,255);
  d=random(0,255);e=random(0,255);f=random(0,255);
  if(fini==true){fill(220,12,12);text("Game Over",600,250);} 
  if(rect1.intersects(rect2)) {
  fini=true;
  }
  if(rect3.intersects(rect2)) {
  fini=true;}
  if(mouseY>y) {
     y=y+7;
    } else {
     y=y-7; 
   }
}


