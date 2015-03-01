
float x=0;
float speed = 2;
void setup(){
  size(500,500);
  noStroke();
}
 void draw (){
  background (200);
  if (x==100||x==200||x==300||x==400){
    fill (255,0,0);
    
  } else{
    fill (255);
  }
  ellipse (x,height/2,20,20);
  x=x + speed;
  
  //linke grenze
  if(x>width-10){
    speed=-2;
  }
  //rechte grenze
  if (x<10){
    speed = 10;
  }
}
