
class Constellation{
  
  float x,y;
  float speed;
  PImage pic;
 
  Constellation(int starNum){
   x=random(player.xDraw,player.xDraw+120);
   y=random(0,170);
   speed=player.speed*2;
   
   
   //make sure starNum is in range
   if (starNum>7)  starNum=(int)random(0,8);
   pic=loadImage("pic/star"+starNum+".png");
  }
 
  void update(){
     //draw the damn thing
     draw();
  }
 
  void draw(){
    noStroke();
    //fill(255);
    image(pic,x,y);
   
  } 
  
  
  
}

