
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;

void setup() {
  size(100,100);
  background(255);
}

void draw(){
  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      m = new Minim(this);
      p = m.loadFile("bassdrum2.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      m = new Minim(this);
      p = m.loadFile("bassdrum3.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'e' || key == 'E') {
      m = new Minim(this);
      p = m.loadFile("bassdrum5.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      m = new Minim(this);
      p = m.loadFile("bassdrum10.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 't' || key == 'T') {
      m = new Minim(this);
      p = m.loadFile("bassdrum11.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      m = new Minim(this);
      p = m.loadFile("bassdrum151.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'u' || key == 'U') {
      m = new Minim(this);
      p = m.loadFile("bassdrum161.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'i' || key == 'I') {
      m = new Minim(this);
      p = m.loadFile("bassdrum165.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'o' || key == 'O') {
      m = new Minim(this);
      p = m.loadFile("bassdrum200.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      m = new Minim(this);
      p = m.loadFile("kickdrum14.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      m = new Minim(this);
      p = m.loadFile("kickdrum19.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      m = new Minim(this);
      p = m.loadFile("kickdrum34.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      m = new Minim(this);
      p = m.loadFile("kickdrum191.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'f' || key == 'F') {
      m = new Minim(this);
      p = m.loadFile("kickdrum200.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      m = new Minim(this);
      p = m.loadFile("kickdrum187.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'h' || key == 'H') {
      m = new Minim(this);
      p = m.loadFile("distortedkick2.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'j' || key == 'J') {
      m = new Minim(this);
      p = m.loadFile("distortedkick10.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'k' || key == 'K') {
      m = new Minim(this);
      p = m.loadFile("distortedkick13.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'l' || key == 'L') {
      m = new Minim(this);
      p = m.loadFile("distortedkick17.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      m = new Minim(this);
      p = m.loadFile("distortedkick24.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      m = new Minim(this);
      p = m.loadFile("distortedkick28.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      m = new Minim(this);
      p = m.loadFile("distortedkick53.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      m = new Minim(this);
      p = m.loadFile("distortedkick61.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      m = new Minim(this);
      p = m.loadFile("distortedkick65.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'n' || key == 'N') {
      m = new Minim(this);
      p = m.loadFile("distortedkick81.wav");
     p.play();
  }
  }
  
  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      m = new Minim(this);
      p = m.loadFile("distortedkick100.wav");
     p.play();
  }
  }
  
}

