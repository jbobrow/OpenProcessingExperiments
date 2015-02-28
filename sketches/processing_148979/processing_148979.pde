
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
size (displayWidth, displayHeight);
noStroke ();

// Load an audio file into the player
minim = new Minim (this);
song = minim.loadFile("Kidstreet-04-Song.mp3");
song.play ();
}

void draw () {
background(#FFFFFF);
    for (int x = 0; x < width; x += 82) {
    for (int y = 0; y < height; y+= 82) {
      
      float dimension = song.mix.level() * 250;
      
      stroke (#dade91,dimension);
      strokeWeight(6);
      fill(#d46e6c);
      rect(x, y, 50,50);
      
      noStroke();
      fill(#8c4041);
      ellipse(x,y,dimension,dimension);
      
      stroke(#dade91);
      strokeWeight(2);
      noFill();
      ellipse(x,y,29,29);
}
 }
  }
void keyPressed() {
  background(0);
  redraw();
} 
