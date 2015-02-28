
import processing.video.*;
Capture video;
float angulo = 0.0;
void setup(){
size(800,800);
video = new Capture(this, 600,600);
}
void draw(){
frameRate(20);
if(video.available()){
video.read();
angulo = angulo + 0.1 ;
translate (400,400);
rotate (angulo);
image(video,0,0,10,600);
rotate(angulo);
}
}

