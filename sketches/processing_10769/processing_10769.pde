

float angulo =0.0;

void setup(){
  size(400,400);

  smooth();
  
     
   

}
void draw(){
  fill(0,100);
  rect(0,0,width,height);

  
  

 for (int i=0; i<width;i+=5){
   for (int j=120; j<height;j+=50){
     
   
   float y= sin(angulo)* mouseY;
   fill(random(0,255),255,255);
   ellipse(i,j+y,15,15);
   angulo+=0.009;
   
  
   }
   
  
   }
}

