


/*Mover m1=new Mover(100,100,10);
Mover m2=new Mover(100,110,24);
Mover m3=new Mover(100,150,10);
Mover m4=new Mover(100,160,15);
Mover m5=new Mover(100,170,3);*/
Mover m6=new Mover(5,234,3);
void setup(){
size(640,480);
background(0);
}

void draw(){
  rect(10,mouseY,20,50);
  rect(610,mouseY,20,50);
  fill(0,0,0,30);
  rect(-4,0,width+7,height-1,500);
  rect(0,0,width-1,height-1);
  /*m1.display();
  m2.display();
  m3.display();
  m4.display();
  m5.display();*/
  m6.display();
}

class Mover {
  //DATA
  int x;
  int y;
  int speed;
  
  //CONSTRUCTOR
  Mover(int myx,int myy,int myspeed){
   x=myx;
  y=myy;
 speed=myspeed; 
  }
  
  //FUNCTION
  void display(){
    if(x>10 && x<30 && y>mouseY && y<mouseY+50){
      speed*=-1;
    }
    if(x>610 && x<630 && y>mouseY && y<mouseY+50){
      speed*=-1;
    }
  if(x<0 || x>width){
  speed=-1*speed; //speed*=-1;
   }
   /*if(x>mouseX-10 && x<mouseX+10){
     speed *= -1;
   }*/
   x=x+speed;
   stroke(20,255,90);
   fill(120,30,60);
   ellipse(x,y,30,30);
   
  
 } 
 

 }

  
