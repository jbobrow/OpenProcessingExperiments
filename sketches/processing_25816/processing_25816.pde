
import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

Movie myMovie;

void setup() {
  size(1024, 768, P2D);
  background(0);
  // Load and play the video in a loop
  myMovie = new Movie(this, "3ariot.mov");
 myMovie.loop();
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
}

void movieEvent(Movie myMovie) {
  myMovie.read();
}

void draw() {
 tint(255, 10);
      imageMode(CENTER);
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    image(myMovie, 740-in.left.get(i)*500-myMovie.width, 740+in.left.get(i)*500-myMovie.height);    


}

}





void keyPressed() {
  int value =  #000000;
  if (value ==  #000000) {
    value = #000000;
    fill(0);
     rect(0, 0, 2000, 2000);
  }
 
  else {
    value =  #000000;
  }
}

