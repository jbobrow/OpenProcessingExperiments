
//created by YuKyoung-Jung
//edited by Sung Soo Pyo on 02.04.15 for SMEnt.
//When mouse pressed, it captures images from cam(fps=15)
//Then you can turn those images into .gif (export in-a-way)
//Or even make a movie out of those imageframes
//enjoy!


import processing.video.*;
import ddf.minim.*;

AudioPlayer song;
Minim minim;
Capture cam;

void setup() {
  size(640, 360);

  minim = new Minim(this);

  song = minim.loadFile("shinee_dreamgirl.mp3");
  song.play();

  cam = new Capture(this, 640, 360, 15);
  println(Capture.list());
  cam.start();
}

void draw() {
  if (cam.available()) {
    cam.read();
  }


  image(cam, 0, 0);
  if (mousePressed) {
    saveFrame("data/####.jpg");
  }
}



