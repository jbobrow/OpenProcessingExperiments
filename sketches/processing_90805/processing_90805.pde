
import ddf.minim.*;
//import ddf.minim.analysis.*;

float x_i, x_a, x_o;
float y_i, y_a, y_o;

float easing_i = 0.15;
float easing_a = 0.15;
float easing_o = 0.15;

Minim minim;
AudioPlayer song_i;
AudioPlayer song_a;
AudioPlayer song_o;


void setup() {
  size (600, 600);
  background(0);
  smooth();

  minim = new Minim(this);
  song_i = minim.loadFile("i.mp3", 10000);

  minim = new Minim(this);
  song_a = minim.loadFile("a.mp3", 10000);

  minim = new Minim(this);
  song_o = minim.loadFile("o.mp3", 10000);
}

void draw () {
  background(0);
   strokeWeight(random(0.5, 10));

    if (mouseY < height/3) {

    // translate((width/2)-60, mouseY-60);
    float targetX_i = mouseX;
    float dx_i = targetX_i - x_i;
    if (abs(dx_i) > 1) {
      x_i += dx_i * easing_i;
    }

    float targetY_i = mouseY;
    float dy_i = targetY_i - y_i;
    if (abs(dy_i) > 1) {
      y_i += dy_i * easing_i;
    } 

    fill(255, 255, 0);
    fill(random(250, 255), random(250, 255), 0);
    // triangle(30, 75, 58, 20, 86, 75);
    triangle(x_i, y_i, x_i+30, y_i+60, x_i-30, y_i+60);
    song_i.play();
  }

    if (mouseY > height/3 && mouseY < height/1.5) {
    // translate((width/2)-60, mouseY-60); 
    float targetX_a = mouseX;
    float dx_a = targetX_a - x_a;
    if (abs(dx_a) > 1) {
      x_a += dx_a * easing_a;
    }

    float targetY_a = mouseY;
    float dy_a = targetY_a - y_a;
    if (abs(dy_a) > 1) {
      y_a += dy_a * easing_a;
    }

    fill(255, 0, 0);
    rectMode(CENTER);
    rect (x_a, y_a, 60, 60);

    song_a.play();
  }

  //  if (mouseY > height/1.5 && mouseY < height+50 && mouseX > width/3 && mouseX < width/1.5) {
  if (mouseY > height/1.5) {
    float targetX_o = mouseX;
    float dx_o = targetX_o - x_o;
    if (abs(dx_o) > 1) {
      x_o += dx_o * easing_o;
    }

    float targetY_o = mouseY;
    float dy_o = targetY_o - y_o;
    if (abs(dy_o) > 1) {
      y_o += dy_o * easing_o;
    }
    //  translate((width/2)-60, mouseY-60); 
    fill(0, 0, 255);
    ellipseMode(CENTER);
    ellipse (x_o, y_o, 60, 60);
    song_o.play();
  }
}

void stop() {

  song_i.close();
  song_a.close();
  song_o.close();
  minim.stop();
  super.stop();
}


