
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer Do, Re, Mi, Fa, Sol, La, Si;

void setup() {
  size(300, 300);
  background(255);
  minim = new Minim(this);
  Do = minim.loadFile("Do.wav");
  Re = minim.loadFile("Re.wav");
  Mi = minim.loadFile("Mi.wav");
  Fa = minim.loadFile("Fa.wav");
  Sol = minim.loadFile("Sol.wav");
  La = minim.loadFile("La.wav");
  Si = minim.loadFile("Si.wav");
}
void draw() {
  for (int x = 2; x < width; x = x+width/7) {
    strokeWeight(8);
    line(x, 0, x, height);
  }
  fill(0);
  textSize(20);
  text("Do", (width/14)-10, height-height/7);
  text("Re", (width/7+width/14)-10, height-height/7);
  text("Mi", (width/7+3*width/14)-10, height-height/7);
  text("Fa", (width/7+5*width/14)-10, height-height/7);
  text("Sol", (width/7+7*width/14)-10, height-height/7);
  text("La", (width/7+9*width/14)-10, height-height/7);
  text("Si", (width/7+11*width/14)-10, height-height/7);
}
void mousePressed() {
  if (mouseX<width/7) {
    Do.play();
    Do = minim.loadFile("Do.wav");
  }
  if (mouseX>width/7 && mouseX<2*width/7) {
    Re.play();
    Re = minim.loadFile("Re.wav");
  }
  if (mouseX>2*width/7 && mouseX<3*width/7) {
    Mi.play();
    Mi = minim.loadFile("Mi.wav");
  }
  if (mouseX>3*width/7 && mouseX<4*width/7) {
    Fa.play();
    Fa = minim.loadFile("Fa.wav");
  }
  if (mouseX>4*width/7 && mouseX<5*width/7) {
    Sol.play();
    Sol = minim.loadFile("Sol.wav");
  }
  if (mouseX>5*width/7 && mouseX<6*width/7) {
    La.play();
    La = minim.loadFile("La.wav");
  }
  if (mouseX>6*width/7 && mouseX<width) {
    Si.play();
    Si = minim.loadFile("Si.wav");
  }
}



