
/* @pjs preload="back.jpg,Spaceship.png"; */

PImage bk, ship, laser;
int x,y=1;
int lx,ly=0;
int xpos,ypos;
boolean shoot = false;

void setup(){
  size(700,700);
  xpos=300;
  ypos=600;
  bk = loadImage("back.jpg");
  ship = loadImage("Spaceship.png");
  laser = loadImage("Laser.png");   
}

void draw(){
    image(bk,0,0,700,700);
   if (xpos>=600){xpos=600;}
   if (xpos<=0){xpos=0;} 
   if (ypos>=600){ypos=600;}
   if (ypos<=0){ypos=0;}
    image(laser,lx,ly,3,30);
    image(ship,xpos,ypos,100,100);
    if(shoot == false){
      lx=xpos+50;
      ly=ypos+50; }
    else{
      ly-=5;} 
    if(ly<=0){
      shoot=false;
      lx=xpos+50;
      ly=ypos+50; 
    }  
}

void keyPressed(){ 
  if(key=CODED){
    if(keyCode==LEFT){
      xpos-=5;
  }
    if(keyCode==RIGHT){
      xpos+=5;
  }
    if(keyCode==UP){
      ypos-=5;
  }
    if(keyCode==DOWN){ 
      ypos+=5;
  }
  } 
  if(keyCode =='a' || keyCode == 'A'){ 
    shoot = true;
  } 
}





