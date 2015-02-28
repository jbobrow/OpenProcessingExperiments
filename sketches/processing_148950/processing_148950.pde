
/*
 Konkuk University
 SOS iDesign
 
 Name:Hong Ji Yae 
 ID: 201420117
 */
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
  size (1024, 600);
  noStroke ();

  // Load an audio file into the player
  minim = new Minim (this);
  song = minim.loadFile("11.mp3");
  song.play ();
}

void draw () {
  // Black semi-transparent background
  fill (35, 54, 60, 30);
  rectMode (CORNER);
  rect (0, 0, width, height);

  float dimension = song.mix.level() * 250;

  // Draw a rectangle
  background(255);
  strokeWeight(random(5));
  for (int i = 0; i < width; i = i + 80) {
    for (int j = 0; j < height; j = j +80) {
      noFill();
      stroke(247, 192, 214);
      ellipse(i, j, 30, 30);
      stroke(223, 146, 177);
      ellipse(i+20, j, 30, 30);
      stroke(177, 112, 176);
      ellipse(i+113, j+20, 30, 30);
      stroke(163, 214, 190);
      ellipse(i+20, j+120, 30, 30);
      stroke(230, 219, 125);
      ellipse(i, j+120, 30, 30);
      stroke(191, 187, 188);
      ellipse(i-13, j+20, 30, 30);
      stroke(255);
      fill(231, 15, 109, 200);
      ellipse(i+130, j+140, 5+dimension, 5+dimension);

      title();
    }
  }
}
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("HONG Jiyae, pattern, Dynamic Media, 2014", width-50, height-20);
}



