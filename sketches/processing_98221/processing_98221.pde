

Bus []bus=new Bus[4];

void setup() {
  size(500, 500);
  for (int i=0;i<bus.length;i++) {
    bus[i] = new Bus(color(244, 245, 7), i*5, 40, 1, 40, 70, 83);
  }
}
void draw() {
  for (int i=0;i<bus.length;i++) {
    background(200);
    bus[i].move();
    bus[i].display();
    bus[i].busreverse();
  }
}

class Bus{
  
  
  color c;
  int Xpos;
  int Ypos;
  int xspeed;
  int Xwidth;
  int Ylength;
  int Xpos2;
  
  Bus(color tempc,int tempX, int tempY,int tempspeed,int templength,int tempwidth,int tempX2){
    c= tempc;
    Xpos=tempX;
    Ypos= tempY;
    xspeed=tempspeed;
    Xwidth=tempwidth;
    Ylength=templength;
    Xpos2=tempX2;
  }
   void display(){
    rectMode(CORNER);
   fill(c) ;
   rect(Xpos,Ypos,Xwidth,Ylength);
   ellipse(Xpos,85,40,40);
   ellipse(Xpos2,85,40,40);
   }
   
   void move(){
     Xpos=xspeed+Xpos;
     if(Xpos>width){
     }
     Xpos2=xspeed+Xpos2;
     if(Xpos2>width){
     
   //Xpos2=xspeed+Xpos2;
// if(Xpos2>width){
// }
 }}
 void busreverse(){
   
  if((Xpos<0)|(Xpos>width)){
     xspeed=xspeed*-1;
    
  }}}
  


