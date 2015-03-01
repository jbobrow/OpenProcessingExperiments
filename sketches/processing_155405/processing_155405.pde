
Mover[] m=new Mover[100];//creates an empty array of 100 objects


void setup(){
 size(640,640);
background(0); 
for(int i=0; i<100; i++){
 m[i]=new Mover(int(random(width)),int(random(height)),int(random(7)+1));
  } 
}
void draw(){
 fill(0,0,0,50);
 rect(0,0,640,640);
for(int i=0;i<100;i++){
  m[i].display();
}
}

class Mover {
  //DATA
  int x;
  int y;
  int speed;
  //CONSTRUCTOR
  Mover(int myx,int myy, int myspeed){
    x=myx;
    y=myy;
    speed=myspeed;
  }
  //FUNCTION
  void display(){
   if(x<0 || x>width){
   speed=-1*speed;//speed*=-1  
   }
  if(mouseX-x<20 && mouseX-x>-20 && mouseY-y<20 && mouseY-y>-20){
    y+=random(height);
    x+=random(width);
  }
  
   x=x+speed;
   stroke(0,255,0);
   fill(0,100,100);
   ellipse(x,y,15,15);
  }
}
