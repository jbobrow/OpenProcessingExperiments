
Bus []bus=new Bus[10];
Bus myBus;

boolean trigger= false;
void setup() {
  size(780, 500);
  for (int i=0;i<bus.length;i++) {
    bus[i] = new Bus(color(244, 245, 7), i*10,i*80, 1, 40, 70, 3);

  }
}
void draw() {
  background(200);
  for (int i=0;i<bus.length;i++) {
  if(trigger){
bus[i].xpos=bus[i].xpos+bus[i].xspeed;
  }
  else{
    background(125);
  stroke(0);
  }}
  for (int i=0;i<bus.length;i++) {
    
    bus[i].move();
    bus[i].display();
    bus[i].busreverse();
  }
}
void mousePressed(){
 for (int i=0;i<bus.length;i++) {
  if (bus[i].xpos<mouseX && mouseX<bus[i].xpos+bus[i].xwidth){
trigger=!trigger;
}}}
class Bus{
  
  
  color c;
  int xpos;
  int ypos;
  int xspeed;
  int xwidth;
  int ylength;
  int xpos2;
  int i;  
  Bus(color tempc,int tempx, int tempy,int tempspeed,int templength,int tempwidth,int tempx2){
    c= tempc;
    xpos=tempx;
    ypos= tempy;
    xspeed=tempspeed;
    xwidth=tempwidth;
    ylength=templength;
    xpos2=tempx2;
    i++;
  }
   void display(){
    rectMode(CORNER);
   fill(c) ;
   rect(xpos,ypos,xwidth,ylength);
   ellipse(xpos,ypos,40,40);
   ellipse(xpos,ypos,xwidth,ylength);
   }
   
   void move(){
     xpos=xspeed+xpos;
     if(xpos>width){
     }
     xpos2=xspeed+xpos2;
    if(xpos2>width){
    }
   
if(xpos2>width){
 }
 }
 void busreverse(){
   
  if((xpos<0)|(xpos>width)){
     xspeed=xspeed*-1;
    
  }}}
  


