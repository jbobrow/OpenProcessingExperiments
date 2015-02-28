
import ddf.minim.*;

Minim minim;
AudioInput input;

void setup() {
  size (displayWidth, displayHeight);
  background(255);
  smooth();

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {

  title();

  float dia = input.mix.level() * 1000; 
  background(255);
  //ellipse
  fill(255, 255, 255, 0);
  for (int a=0; a<width; a=a+50) {
    for (int b=0; b<height; b=b+50) {
      fill(random(255), 0, 0, 30);
      stroke(255);
      ellipse(a, b, dia, dia);
      ellipse(a+15, b, dia, dia);
      ellipse(a, b+15, dia, dia);
      ellipse(a+15, b+15, dia, dia);
    }
  }

  //blank
  for (float c=32.5; c<width; c=c+100) {
    for (float d=32.5; d<width; d= d+150) {
      for (float e=32.5; e<width; e= e+200) {
        fill(255);
        noStroke();
        rect(c, d, 50, 50);
        rect(e, c, 50, 50);
        rect(d, e, 50, 50);
        rect(c, e, 50, 50);
        rect(e, d, 50, 50);
        rect(d, c, 50, 50);
      }
    }
  }
}

void keyPressed() {
  background(0);
  redraw();
}

void title() { 
  fill(127);
  textAlign(RIGHT);
  text("CHOE Goeun, Grapes, Dynamic Media, 2014", width-50, height-20);
}
