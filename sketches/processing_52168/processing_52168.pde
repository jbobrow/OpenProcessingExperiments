
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

color redSpokes;

Minim minim;
AudioPlayer song;
BeatDetect beat;
int speed;

void setup() {
  size(500, 500, P3D);


  redSpokes = color(203, 105, 104);

  minim = new Minim(this);
  song = minim.loadFile("chinesetea.mp3");
  song.play();
  beat = new BeatDetect();


  camera(width/2.0, 2000, 635, width/2.0, height/2.0, 0, 0, 1, 0);
}


void draw() {
  background(0);

  if (beat.isSnare()) {
    speed += 10;
  }

  tint(255, 200, 255);
  noStroke();
  fill(78, 56, 164);
  rect(-850, height/2.0, 2250, height/.25);

  fill(random(0, 50), random(0, 50), random(0, 50));
  rect(0, height/2.0, width, height/.25);

  hint(DISABLE_DEPTH_TEST); // WHY?
  hint(ENABLE_DEPTH_TEST);


  strokeWeight(10);  
  stroke(redSpokes);
  line(width/2, 825, width/2, -15000);


  translate(width/2.0, height/2.0, -300);

  scale(2.5);
  noStroke();
  fill(random(175, 255), random(175, 255), random(175, 255));
  ellipse(0, 0, 300, 300);


  strokeWeight(2);
  scale(1.5);
  int ellipseCount = 0;
  for (float pos=0; pos < TWO_PI; pos += (PI/4)) {

    translate(0, 0, ellipseCount * 5);

    rotate((PI * frameCount/600) + speed);
    fill(redSpokes);
    stroke(redSpokes);
    line(pos - 3, pos - 3, pos + 100, pos + 100);
    ellipse(pos + 100, pos + 100, 45, 45);
    ellipseCount++;

    fill(random(175, 255), random(175, 255), random(175, 255), 100);
    pushMatrix();
    fill(0, 255, 255);
    stroke(0, 255, 255);
    translate(100, 100, 100);
    rotate((TWO_PI * frameCount/200) + speed);
    ellipse(35, 35, 15, 15);
    line(35, 35, 0, 35, 35, (5*ellipseCount)*(100*ellipseCount));
    popMatrix();
  }
}


