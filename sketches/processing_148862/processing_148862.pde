
import ddf.minim.*;

Minim minim;
AudioPlayer song;
float x = 0;
float y = 0;

void setup () {
size (600, 600);
noStroke ();

minim = new Minim (this);
song = minim.loadFile("Supreme Team.mp3");
song.play ();
}

void draw () {
   background(0);
 float d= song.mix.level() *250;
    for (int i = 20; i< width; i = i + 40) {
    for (int j = 20; j< width; j = j + 40) {

      pushMatrix(); 
      ellipseMode(CENTER);
      strokeWeight(3);
      stroke(0, 0, 0);
      noFill();
     
      strokeWeight(2);
      stroke(255);
      fill(#9DCEF2);
      ellipse(i, j, d, d);
      noFill();
      fill(#736CDB);
      strokeWeight(4);
      ellipse(i,j,10,10);
      popMatrix();
    }
  }    
}
