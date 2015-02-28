
import processing.video.*;

Capture video;

void setup(){
  size(400,300);
  video= new Capture(this,400,300);
  video.start();
  
}

void draw(){
  if(video.available()){
    video.read();
    image(video,0,0);
  }
}
void movieEvent(Movie m){
 m.read();
}
