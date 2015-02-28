
  import ddf.minim.*;

  Minim minim;
  AudioPlayer song;

  float x = 0;
  float y = 0;

  void setup () {
    size (400, 400);
    noStroke ();

    // Load an audio file into the player
    minim = new Minim (this);
    song = minim.loadFile("aaa.mp3");
    song.play ();
  }

  void draw () {
    // Black semi-transparent background
    fill (35, 54, 60, 30);
    rectMode (CORNER);
    rect (0, 0, width, height);

    // Size of the rect in relation to the volume of the audio file.
    float d = song.mix.level() * 250;

    fill(#78EAFF);
    for (float i = 0; i <= width; i = i + 50) {
      for (float j = 0; j <= height; j = j + 50) {
        fill(#8C8CBE);
        pushMatrix();
        translate (i, j);
        triangle (30.5, d, 60, 0, 10, 50);
        popMatrix();
      }
    }
  }

