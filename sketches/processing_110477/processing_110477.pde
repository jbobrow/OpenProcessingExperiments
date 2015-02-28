

float x = 100, y = 100;//bouncing ball and random speed.
float xSpeed = random(2, 4);
float ySpeed = random(2, 4);

float r=0;// random background color selected by mouseX,mouseY and mousePress.
float g=0;
float b=0;

int s=0;//value of score.

float c;//value of circles in size at the end.
int mx=100;//value of the width of the rectangle.

PFont font;

float angle;//rotation of the pic.
float jitter;
PImage image;


import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

void setup() {
  noStroke();   
  noCursor();
  image =loadImage("pic2.png");//putting the pic in the middle.
  imageMode(CENTER);
  size(700, 300);

  font=loadFont("KinoMT-48.vlw");

  minim = new Minim(this);//insert bgm.
  player = minim.loadFile("Daily.mp3", 2048);
  player.loop();
}

void draw() {
  background(r, g, b);

  rect(mouseX-25, height-40, mx, 10);//drawing the bouncing ball.
  fill(255);
  ellipse(x, y, 10, 10);
  x = x + xSpeed;
  y = y + ySpeed;
  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  if ((y >height-40)&& (x<= mouseX + mx && x>=mouseX) ||y<0) {
    
    ySpeed = -ySpeed;
  }





  //scoring system.
  textSize(30);
  textFont(font);
  text("SCORE:", 550, 50);
  textSize(50);
  text(s, 600, 100);
  //width of the rectangle will be decreased when scoring 1pt.
  if ((y >height-40) &&(x< mouseX + mx && x>mouseX)) {
    s= s+1;
    mx= mx-5;
  }
  if (s>=10) {
    mx=20;
  }//when you have got 10pt,the width will remain 20.

  //the "gameover" scene when the ball has fallen.
  c=random(80);
  textSize(40);
  if (y>300)
    text("GAME OVER", 10, 50);
  textSize(20);
  if (y>300)
    text("Press s to Try Again", 10, 200);
  if (y>300) {
    y=310;
    x=-10;
  }

  //random circles will pop up as visual effect.
  if (y>300) {
    fill(random(255));
    ellipse(random(width), random(height), c, c);
  }
  //Reset all the setting from the beginning after pressing"s".
  if (keyPressed== true && key=='s')
  {
    x=100;
    y=100;
    s=0;
    mx=100;
  }

  //background color.
  if (mouseX>width/2) {
    r=r+1;
  }
  else {
    r=r-1;
  }
  if (mouseY>height/2) {
    b=b+1;
  }
  else {
    b=b-1;
  }
  if (mousePressed) {
    g=g+1;
  }
  else {
    g=g-1;
  }
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);

  //(abnormal?)rotation of the pic.
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float o = cos(angle);
  translate(width/2, height/2);
  rotate(o);
  image(image, 0, 0);
}


