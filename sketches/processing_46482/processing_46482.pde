
import processing.video.*;
Movie baptism;
PImage total;





void setup(){
size(800,600);
total = loadImage ("total.gif");
baptism = new Movie(this, "baptism.mp4");
baptism.loop();
}
  





void draw(){   
 image(baptism,0,0, 800, 600); 
  if (mousePressed == true) {
 line(0,0,0,0);
  } else {
    image (total,0,0,800,600);
   
  }


}




void movieEvent(Movie m) {
  m.read();
}

