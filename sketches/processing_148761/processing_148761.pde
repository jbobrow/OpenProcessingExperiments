
AudioPlayer song;
float x = 0;
float y = 0;

void setup () {
size (600, 600);
noStroke ();

// Load an audio file into the player
minim = new Minim (this);
song = minim.loadFile("The Lion King - Circle of Life.mp3");
song.play ();
}


void draw () {
   float d= song.mix.level() *250;
   
for (int a = 20; a< width; a = a+40) {
    for (int b = 20; b< width; b = b+40) {
      stroke(#31BFFF);
      strokeWeight(2);
      noFill();
      ellipse(a-0.2, b-0.2, d, d);
      noStroke();
      fill(#FFADEC);
      ellipse(a-0.2, b-0.2, d, d);
    }
  }
}

