
int x=0;
int y = 0;

PImage bg;

void setup(){
  size(400,400);
  background(#FFFFCC);
   bg = loadImage("preso.jpg");
   background(bg);
}
void draw(){
 
  
  
 do{
    fill(random(0,255));
    rect(y,x,10,10);
    rect(x,y,10,10);
    
    x+=50;
    
    if(x>height){
     y=y+5;
     x=0;
    }
    if(y>=width){
      x=10;
      y=10;
    }
    
 } while(0!=0);
  

}
  



