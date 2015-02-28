
//declare
float xpos;
float ypos;
int bsize;
float yspeed;
float xspeed;
float radius;
float gravity;


void setup(){
  //define in setup
  size(500,500);
  //random start pos
  xpos=int(random(0,500));
  ypos=int(random(0,200));
  radius=50;
  xspeed=10;
  yspeed=8;
  gravity =1;
  
}
//start draw
void draw(){
  background(255);
  fill(255,0,0,50);
  ellipse(xpos,ypos,radius,radius);
  
  yspeed=yspeed+gravity;
  
  //restrain y
  ypos=ypos+yspeed;
  if (ypos>height-radius/2){
    //reduce speedy
    yspeed=yspeed*-0.95;
   // xspeed=xspeed+gravity;
  }
  
   if (ypos<0+radius/2){
    yspeed=-yspeed;
  }
 
 
  
  //restrain x
   xpos=xpos+xspeed;
  if (xpos>width-radius/2){
    xspeed=-xspeed;
   
  }
  
  if (xpos<0+radius/2){
    xspeed=-xspeed;
  }
  
  if (ypos>height-radius/2){
   ypos=height-radius/2;
   //reduce speedx
   xspeed=xspeed*.9;
 }
 if (xpos>width-radius/2){
   xpos=width-radius/2;
      
  
 }
 
 //debug
  println(yspeed);
  println(xspeed);

}
