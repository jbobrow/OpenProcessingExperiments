
int i=0,j=0;
void setup(){
  size(360,300);
  background(#ffffff);
  frameRate(8);
  fill(#FFFFFF);
}
 
void draw(){

 do{
    fill(0,255,0);
    ellipse(j,i,10,10);
    i+=70;
    if(i>height){
     j=j+5;
     i=0;
    }
    if(j>=width){
      i=10;
      j=10;
    }
 } while(0!=0);
 
   line(0,30 , 360,30);  
   line(0,110 , 360,110);
   line(0,180 , 360,180);
   line(0,250 , 360,250);
   line(340,0 , 340,360);
   fill(0,0,0);
   rect (0,0, 25,360);
}





