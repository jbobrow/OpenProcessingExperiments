
float angulo =0.0;
 
void setup(){
  size(400,400);
 
  smooth();
   colorMode(HSB);
    frameRate(20);
 
}
void draw(){

  strokeWeight(3);
   stroke(random(255),0,0);

  
  background(0);

 
   

   


 for (int i=0; i<width;i+=5){
  
      
    
   float y= sin(angulo)* mouseY;

   stroke(random(0,255),255,255);
line(i,200+y,i,200);
   angulo+=mouseX;;

   
    
   
   }
}void mousePressed(){
  noLoop();
}void mouseReleased(){
  loop();
}

