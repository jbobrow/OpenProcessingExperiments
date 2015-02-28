
//isolate an area of the interactive screen
import ddf.minim.*;

Minim minim;
AudioSample kick;
void setup() {
  size (400, 400);
  minim = new Minim(this);
 // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("BD.mp3", 2048);
}

void draw() {
  background(0);
  if (mouseX <200 && mouseY <200) {
    fill(255, 192, 50);
    rect(0, 0, 200, 200);
  }
  if (mouseX <200 && mouseY >200) {
    fill(20, 192, 50);
    rect(0, 200, 200, 200);
    kick.trigger();
  }

    if (mouseX > 200 && mouseY > 200) {
      fill(94, 87, 90);
      rect(200, 200, 200, 200);
    }
  }



 



void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}


