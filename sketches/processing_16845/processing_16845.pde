
import pitaru.sonia_v2_9.*;
float angle = 0.6;

void setup(){
   size(1024, 768);
   Sonia.start(this); 
   LiveInput.start(256); 
   frameRate(30);
smooth();
noStroke();
}
void draw(){
   getMeterLevel();  
} 
void getMeterLevel(){
   float meterDataIzquierda = LiveInput.getLevel();
   float meterDataDerecha = LiveInput.getLevel();
   float a = meterDataIzquierda*height;
   float b = meterDataDerecha*height; 
  
  for(int i = 0; i <= width; i = i+70){
   for(int y=0; y <= width; y = y+70){
  fill(0, 12);
rect(0, 0, width, height);
fill(33,74,142);
angle = angle + 0.02;
translate(90, 70);
rotate(angle);
  rect(i, y, a, b);
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

