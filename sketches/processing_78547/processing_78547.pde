
import ddf.minim.*;
float theta = 0;
float orbitspeed1;
float orbitspeed2;
float orbitspeed3;
float orbitspeed4;
float orbitspeed5;
float orbitspeed6;
float orbitspeed7;

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;

AudioPlayer player;
Minim minim;

void setup() {
  size(900, 650);

  a= loadImage("Sun.png");
  b= loadImage("mercury.png");
  c= loadImage("venus.png"); 
  d= loadImage("Earth.png"); 
  e= loadImage("mars.png");
  f= loadImage("jupiter.png");
  g= loadImage("saturn.png");
  h= loadImage("uranus.png");
  i= loadImage("neptune.png");
  j= loadImage("space.jpg");

  minim = new Minim(this);
  player = minim.loadFile("solar.wav");
}

void draw() {
  background(300);
  image (j, 0, 0);
  image (a, 400, 280);

  translate (width/2, height/2);


  //mercury
  pushMatrix();
  rotate (orbitspeed7);
  translate (60, 30);
  image (b, 0, 0);
  popMatrix();


  //venus
  pushMatrix();
  rotate (orbitspeed6);
  translate (60, 40);
  image (c, 0, 2);
  popMatrix();

  //earth
  pushMatrix();
  rotate (orbitspeed5);
  translate (90, 65);
  image (d, 0, 5);
  popMatrix();

  //mars
  pushMatrix();
  rotate (orbitspeed4);
  translate (100, 80);
  image (e, 10, 10);
  popMatrix();

  //jupiter
  pushMatrix();
  rotate (orbitspeed3);
  translate (100, 80);
  image (f, 20, 10);
  popMatrix();

  //saturn
  pushMatrix();
  rotate (orbitspeed2);
  translate (130, 90);
  image (g, 10, 40);
  popMatrix();

  //uranus
  pushMatrix();
  rotate (theta);
  translate (150, 100);
  image (h, 25, 45);
  popMatrix();

  //neptune
  pushMatrix();
  rotate (orbitspeed1);
  translate (180, 120);
  image (i, 30, 50);
  popMatrix();



  theta += 0.003;
  orbitspeed1 += 0.004;
  orbitspeed2 += 0.005;
  orbitspeed3 += 0.006;
  orbitspeed4 += 0.007;
  orbitspeed5 += 0.008;
  orbitspeed6 += 0.009;
  orbitspeed7 += 0.011;

  if (mouseX >=30 && mouseY >=30) { 
    player.play();
  }
}

void mouseReleased() {
  noLoop();
}

void mousePressed() {
  loop();
} 


