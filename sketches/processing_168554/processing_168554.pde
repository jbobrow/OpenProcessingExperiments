
float x=0;
float y = 3;


float speed = 2;
void setup(){
  size(500,500);
  noStroke();
}
 void draw (){
  background (200);
  if (x==100||x==200||x==300||x==400){
    fill (255,0,0);
    
  
    
  } 
   if (x==250){
   fill (0,250,0);
   }
   
   if (y==250){
     fill (0,250,0);
   }
  else{
    fill (255);
  }
  ellipse (x,height/2,20,20);
  x=x + speed;
 ellipse ( width/2,y,20,20);
 y = y + speed ;
  
  //linke grenze
  if(x>width-10){
    speed=-2;
  }
  //rechte grenze
  if (x<10){
    speed = 10;

  }
}
