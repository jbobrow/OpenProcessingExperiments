
import ddf.minim.*;

AudioPlayer ap;
Minim minim;


//image
PImage cover;
PImage album;

void setup() {

  size(900, 600);
  background(0);

  smooth();
  minim = new Minim(this);
  ap = minim.loadFile("nolight.mp3");
  ap.loop();

  //load cover
  cover = loadImage("cover.jpg");
  album = loadImage("album.jpg");
}

void draw() {

  float bgc1 = random(192, 255);
  float bgc2 = random(0, 128);
  float bgc3 = random(0, 128);
  float bgc4 = random(0, 128);

  float level = ap.mix.level();
  float leftLevel = ap.left.level();
  float rightLevel = ap.right.level();

  float rectW = (level * width)/2;
  float leftRect = (leftLevel * width)/4;
  float rightRect = (rightLevel * width)/4;

  if (level > 0.35) {
    for (int i = 100; i < 700; i = i+200) {
      for (int j = 100; j < 700; j = j+200) {
        fill(255, 255, bgc1, 64);
        rect(i-rectW/2, j-rectW/2, rectW, rectW);
      }
    }
  }
  else {
    for (int i = 0; i < 700; i = i+200) {
      for (int j = 0; j < 700; j = j+200) {
        fill(255, 255, bgc1, 64);
        rect(i-rectW/2, j-rectW/2, rectW, rectW);
      }
    }
  }
  if (level > 0.35) {
    for (int i = 0; i < 700; i = i+200) {
      for (int j = 0; j < 700; j = j+200) {
        fill(255, 255, bgc2, 64);
        rect(i-rectW/2, j-rectW/2, rectW, rectW);
      }
    }
  }
  else {
    for (int i = 100; i < 700; i = i+200) {
      for (int j = 100; j < 700; j = j+200) {
        fill(255, 255, bgc2, 64);
        rect(i-rectW/2, j-rectW/2, rectW, rectW);
      }
    }
  }

  if (level > 0.4) {
    for (int i = 100; i < 700; i = i+200) {
      for (int j = 0; j < 700; j = j+200) {
        fill(255, 119, bgc3, 64);
        triangle(i, j-leftRect*0.5, i-leftRect/2.5, j+leftRect*0.25, i+leftRect/2.5, j+leftRect*0.25);
      }
    }
  }

  else {
    for (int i = 100; i < 700; i = i+200) {
      for (int j = 0; j < 700; j = j+200) {
        fill(bgc4, 195, 255, 64);
        ellipse(i, j, leftRect, leftRect);
      }
    }
  }


  if (level > 0.4) {

    for (int i = 0; i < 700; i = i+200) {
      for (int j = 100; j < 700; j = j+200) {

        fill(bgc4, 195, 255, 64);
        triangle(i, j+rightRect*0.5, i-rightRect/2.5, j-rightRect*0.25, i+rightRect/2.5, j-rightRect*0.25);
      }
    }
  }
  else {
    for (int i = 0; i < 700; i = i+200) {
      for (int j = 100; j < 700; j = j+200) {
        fill(255, 119, bgc3, 64);
        ellipse(i, j, rightRect, rightRect);
      }
    }
  }

  image(album, 600, 0);
  image(cover, 600, 300);
}


