
float x=30;
float y = 100;
float ys = 0.01;
int i;
void setup(){


  size(300,452);
  smooth();
  
 }
 
 
 void draw(){
    PImage a;
   a=loadImage("a.jpeg");
   image(a,0,0);
  
   for(int i=0; i < width - 30; i+=30){
    for (int j=0; j<height -30; j+=30){ 
   float colorValue=map(i,0,600,0,300);
   fill(100-colorValue,200-colorValue,255-colorValue);
   ellipse(x+i,y+j,20,20);
   y = y + ys; 
   if(y > 462 || y <= 10){
   ys = -ys; 
     }   
    }
  }
}
   
 
 
 
 


 


