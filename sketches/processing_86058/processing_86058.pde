
import processing.video.*;

int i=0;
Movie immortality;

void setup() {
  size(320, 240, P2D);
  background(0);
  // Load and play the video in a loop
  immortality = new Movie(this,"aaaa2.mov");
  immortality.loop();
  frameRate(30);  
 
} 

void movieEvent(Movie Immortality) {
  immortality.read();
}

void draw() {
  image(immortality, 0, 0);
  i=i+1;
  if(i>60){

    immortality.jump(random(immortality.duration()));
    i=0;
  }     

  System.gc();
}

  

   



