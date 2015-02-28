
import ddf.minim.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;

float xoff;
float x, y;
float a;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  background(0);
  minim = new Minim (this);

  song1 = minim.loadFile ("Flower Dance.mp3");
  song2 = minim.loadFile ("A Cup Of Coffee.mp3");
  song1.play ();
  song1.loop();
}
void draw() {

  xoff+=0.01;
  float nx = noise(xoff)*600;

  stroke(255, 30);
  noFill();

  float c = map(a, 0, 200, 250, 0);

  ellipse(x, y, a, a);

  if (key=='1') {  
    song1.pause();
    song2.play();
    a = song2.mix.level() * 300;
  }
  else {
    a = song1.mix.level() * 300;
  }

  if (key=='2') {  
    song2.pause();
    song1.play();
    a = song2.mix.level() * 300;
  }

  x = lerp(x, mouseX, 0.01);
  y = lerp(y, mouseY, 0.01);
}

//---------------------------
void title() { 
  fill(127);
  textAlign(RIGHT);
  text("Hyeri Jeong, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
}

