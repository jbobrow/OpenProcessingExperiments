
float radio;
float angulo;
float t=0;
void setup(){
  size(400,400);
  radio=40;
  angulo=360;
   background(0);
   smooth();
   colorMode(HSB);
   cursor(HAND);

}



void draw(){
   
  float x,y;
  x= sin(angulo)*radio;
  y= cos(angulo)*radio;
  
  stroke(t,255,255);
    line(mouseX,mouseY,mouseX+x,mouseY+y);
  
    angulo+=1.1;
    radio+=1.1;
    t+=0.1;
    t%=255;
   if (mousePressed){
     noLoop();
   }
   
} 





void mouseReleased(){
  loop();
}

