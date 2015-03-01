
/* 
 * Open Source Technologies
 * A Simple Game
 * by teamadm14
 * Copyright (c) 2014 Nanyang Technological University
 *
 * This sketch demonstrates an old school arcade game.
 *
 */

import ddf.minim.*;

Minim minim;
AudioSample death;
AudioSample paddleBlip;
AudioSample sideBlip;
AudioSample reset;

final color bg = color(50, 50, 50);
final float textspeed = 0.01;
final float ballsize = 40.0;
final int paddleY = 385;
final int paddleH = 12;
final int paddleW = 85;

float speed;
float yball;
float xball;
float ball_xdirection;
float ball_ydirection;
int points;
int opacity;
boolean lost;
PFont font1;
PFont font2;

void setup() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();  
  size(600, 400);

  minim = new Minim(this);
  death = minim.loadSample("death.wav", 2048);
  paddleBlip = minim.loadSample("paddleBlip.wav", 2048);
  sideBlip = minim.loadSample("sideBlip.wav", 2048);
  reset = minim.loadSample("reset.wav", 2048);

  font1 = loadFont("HelveticaNeue-UltraLight-48.vlw");
  font2 =loadFont("HelveticaNeue-Bold-48.vlw");
  reset();
}

void draw() {
  smooth();
  fill(255, 0, 255);
  background(bg);
  strokeWeight(0);
  ellipse(xball, yball, ballsize, ballsize);
  xball=xball+((.5*speed)*ball_xdirection);
  yball=yball+(speed*ball_ydirection);

  textFont(font2, 20);
  textAlign(CENTER);
  textLeading(30);
  fill(245, 245, 245, opacity);
  String s = "Use your cursor to control the paddle and keep the ball from hitting the bottom. Be careful - the ball gets faster with time!";
  text(s, width/2, height/2, 200, 200);
  opacity +=-1.5*textspeed;

  fill(255, 255, 0);
  rectMode(CENTER);
  rect(mouseX, paddleY, paddleW, paddleH);

  textFont(font2, 15);
  textAlign(CENTER);
  fill(255, 255, 255);
  text("Score: "+points, width/2, height/3-100);
  lost = true;

  if (yball > paddleY - ballsize/2 - paddleH/2 &&
    xball >= mouseX - paddleW / 2 && xball <= mouseX + paddleW / 2) {
    speed *=1.1; 
    ball_ydirection *= -1;
    points = points+1;

    println(+points+" points for you");

    paddleBlip.trigger();
  }

  if (xball > width-(ballsize/2) || xball<(ballsize/2)) {
    ball_xdirection*=-1;

    sideBlip.trigger();
  }

  if (yball<(ballsize/2)) {
    ball_ydirection *=-1;

    sideBlip.trigger();
  }

  if (yball > height-(ballsize/2)) {

    textFont(font2, 60);
    textAlign(CENTER);
    fill(0, 245, 255);
    text("GAME OVER", width/2, height/2+7);
    textFont(font1, 20);
    text("Press any key to restart", width/2, height/2+50);

    death.trigger();

    textFont(font2, 15);
    textAlign(CENTER);
    fill(255, 255, 255);
    text("Score: "+points, width/2, height/3-100);
    noLoop();
    lost = true;

    if (points <= 10) {
      fill(255, 20, 147);
      textFont(font1, 55);
      text("Try Harder!", width/2, height/3);
    }

    if (points >= 20) {
      fill(255, 20, 147);
      textFont(font1, 55);
      text("Great Job!", width/2, height/3);
    }

    if (points > 10 && points < 20) {
      fill(255, 20, 147);
      textFont(font1, 55);
      text("Not Bad!", width/2, height/3);
    }
  }
}

void keyPressed() {
  reset.trigger();
  reset();
  loop();
}

void reset() {
  speed = 1.5;
  yball = random(ballsize, (height/2-ballsize));
  xball = random(ballsize, (width/2-ballsize));
  ball_xdirection = 1;
  ball_ydirection = 1;
  lost = false;
  points = 0;
  opacity = 250;
}

void stop()
{
  death.close();
  paddleBlip.close();
  sideBlip.close();
  reset.close();
  minim.stop();
  super.stop();
}


