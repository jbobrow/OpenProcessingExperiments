
Sprite sprite;
PImage space;
float x2=0;
float y2=0;
int m2=3;
float x3=0;
float y3=0;
int m3=7;
int currentLives;
int lifeDecrease;
PFont f;
import javax.swing.*;
import java.awt.event.*;





void setup() {

  space = loadImage("space.jpg");

  smooth();
  noStroke();
  size(900, 750);
  y2=height/2;
  y3=height/4;

  sprite = new Sprite(width/2, height/2, 2);
  
  currentLives = 3;
  lifeDecrease = -1;
  
  
  
}

void draw() {
  image(space, 0, 0);
  sprite.update();

  fill(0, 10);
  rect(0, 0, width, height);

  fill(255, 215, 0);
  ellipse(x2, y2, 30, 30);
  ellipse(x3, y3, 30, 30);

  if (x2>width) {
    m2=m2*(-1);
  }

  if (x2<0) {
    m2=m2*(-1);
  }

  x2+=m2;

  if (x3>width) {
    m3=m3*(-1);
  }

  if (x3<0) {
    m3=m3*(-1);
  }

  x3+=m3;
}


class Sprite {
  int x=0;
  int y=0;
  int m=0;

  public Sprite(int x, int y, int m) {
    this.x=50;
    this.y=50;
    this.m=3;
  }

  public void update() {
    if (keyPressed) {
      if (keyCode == 37) {
        x-=m;
      }
      if (keyCode == 38) {
        y-=m;
      }
      if (keyCode == 39) {
        x+=m;
      }
      if (keyCode == 40) {
        y+=m;
      }
    }
    ellipse(x, y, 20, 20);
    fill(0, 238, 118);
  }
}

void mousePressed(){
  currentLives +=lifeDecrease;
  println(currentLives);
  if(currentLives == 0)
  println("GAME OVER");
  
}



