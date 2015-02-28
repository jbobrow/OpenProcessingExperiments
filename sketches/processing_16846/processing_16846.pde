
import pitaru.sonia_v2_9.*;
float angle = 0.0;

void setup(){
   size(1024, 768);
    background (255);
    smooth();
noStroke();
   Sonia.start(this); 
   LiveInput.start(256); 
   frameRate(60);
}
void draw(){
   getMeterLevel();  
} 
void getMeterLevel(){
   float meterDataIzquierda = LiveInput.getLevel();
   float meterDataDerecha = LiveInput.getLevel();
   float a = meterDataIzquierda*height;
   float b = meterDataDerecha*height; 

  for(int i = 0; i <= width; i = i+60){
   for(int y=0; y <= width; y = y+60){
  fill(0, 12);
ellipse(0, 0, width, height);
fill(255);
angle = angle * 0.07;
translate(90, 70);
rotate(angle);
  ellipse(i, y, a, b);
 
  }
  }
  
}
public void stop(){
    Sonia.stop();
    super.stop();
}
//void mousePressed (){
//saveFrame ("1.JPG");
//}

