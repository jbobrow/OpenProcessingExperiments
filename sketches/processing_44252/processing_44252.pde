
PImage img;

void setup(){
  
 
//img2=loadImage("son2.jpg");
  size (500,500);
  background(0);
  smooth();
  noStroke();
  img=loadImage("te.jpg");
}
  
 void draw(){
   
    background(0);
    for(int i=0; i<500; i+=10){
    for(int j=0; j<500; j+=10){  
     color cor1=img.get(i,j);//get pega a cor do x,y que esta trabalhando
     if(i%2==0){
     fill(cor1);
     rect(i,j,1,1);
     ellipse(i,j,8,8);
    }
   }
   }
 }
  
    

