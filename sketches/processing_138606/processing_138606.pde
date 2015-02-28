
PFont EccentricStd48;
Movers move1, move2, move3, move4;
void setup (){

  move1=new Movers(0, 0 );
  move2=new Movers(0, 50);
  move3=new Movers(0, 100);
  move4=new Movers(0, 150);
 size (400,400);

EccentricStd48= loadFont ("EccentricStd-48.vlw");
textFont (EccentricStd48, 15);
fill (255);
}
void draw(){
move1.display();
move2.display();
move3.display();
move4.display();

move1.move();
move2.move();
move3.move();
move4.move();
}

class Movers{
 float x,y;
float speed0, speed1, speed2, speed3;
float accel0, accel1, accel2, accel3;
int diam= 5; 

int val; 
  Movers(float x_,float y_){
x=x_;
y=y_;
speed=0;
/*accel1=accel1_;
accel2=accel2_;
accel3=accel3_;
accel4=accel4_;
val=val_;*/
  }
  
  void display(){
ellipse (x+ speed, y+speed, diam+2, diam);
ellipse ((x+7)+ speed, y+speed, diam+2, diam);
ellipse ((x+140)+ speed, y+speed, diam, diam); 
line ((x+3), (y+5), (x+3), (y+4));

  }
  
  void move( ){

 speed1+=accel0;
if (x>width){
x=width;
accel0=0;
accel1=0;
accel2=0;
accel3=0;
background (#C62A6E);

  }}}
  
  void mousePressed(){
   accel=0; 
  }
  
  void kepPressed(){
   if (value=='f'){
    accel1+=(random(3));
    accel2+=(random(2.9));
    accel3+=(random(3.1));
    accel4+=(random(2.8));
   }else if( value=='s'){
   
      accel1-=(random(3));
    accel2-=(random(2.9));
    accel3-=(random(3.1));
    accel4-=(random(2.8));
   }
  }}
