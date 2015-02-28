
float xpos;
 float ypos;
 float vel;
 void setup (){
 size(600,600);
 xpos= width/2;
 ypos=height/2;
 vel =2;
 rectMode(CENTER);
 background(255);
 
 
 }
 
 void draw (){
   if ((key == '1')) {
     vel=1;
   }
   if ((key == '2')) {
     vel=1.5;
   }
   if ((key == '3')) {
     vel=2;
   }
   if ((key == '4')) {
     vel=2.5;
   }
   if ((key == '5')) {
     vel=3;
   }
   if ((key == '6')) {
     vel=3.5;
   }
   int i = 1;
 //background(255);
 //background(255);
 //line(10,height/2,width-10,height/2);
 if(key==CODED && keyPressed){
 if(keyCode == UP){
 
 ypos=ypos-vel;
 }
 
 if(keyCode == LEFT){
 xpos=xpos-vel;
 }
 
 if(keyCode == RIGHT){
 xpos =xpos + vel;
 } 
 if(keyCode == DOWN){
 ypos =ypos + vel;
 } 
 
 
 }

 rect(xpos,ypos,50,50);
 
 if  (keyCode == SHIFT ) {
   vel = ypos / xpos;
 }
  if (mousePressed){
    background(255);
  }
 
 }

