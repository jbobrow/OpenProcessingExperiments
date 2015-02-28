
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: PARK Hyebin
 // ID: 201420081
 
//import ddf.minim.*;

//Minim minim;
//AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
  size (400, 400);
  noStroke ();

//  minim = new Minim (this);
 // song = minim.loadFile("DJ+Okawari+-+Peacock.mp3");
  //song.play ();
}

void draw () {
  fill (35, 54, 60, 30);
  rectMode (CORNER);
  rect (0, 0, width, height);
  float d = song.mix.level() * 250;

  int i, j;
  float C;

  noStroke();
  smooth();
  for (i=0; i<=width/4; i ++) {
    for (j=0; j<=height/4; j++) {
      C=random(107, 545);
      fill(C, 80, 97);
      rect(i*20, j*100, 30, d, d, 50, 100, 50);
    }
  }

 


  int gridSize = 45;

  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      fill(255);
      ellipse(x, y-0.2, d, d);
      stroke(255, 50);
      strokeWeight(2);
      line(x, y, width/2, height/2);
    }
  }
}

