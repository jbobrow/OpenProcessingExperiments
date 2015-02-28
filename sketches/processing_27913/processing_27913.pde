
import ddf.minim.*;
Minim minim;
AudioPlayer player;
SoundCircle circ;

int[] trail_x;
int[] trail_y;
int index = 0;

void setup() {
  size(500,500);
  smooth();
  colorMode(RGB);
  trail_x = new int[40];
  trail_y = new int[40];
  frameRate(40);
  minim = new Minim(this);
  player = minim.loadFile ("1.wav");
  player = minim.loadFile ("2.wav");
  player = minim.loadFile ("3.wav"); 
  player = minim.loadFile ("4.wav");
  player = minim.loadFile ("5.wav");
  player = minim.loadFile ("6.wav");
  player = minim.loadFile ("7.wav");
  player = minim.loadFile ("8.wav");
  player = minim.loadFile ("9.wav");
  player = minim.loadFile ("10.wav");
  player = minim.loadFile ("11.wav");
  player = minim.loadFile ("12.wav");
}


void draw() {
  background(0);

  //if (circ.isOver(mouseX,mouseY)) {
  //circ.play(dist(mouseX,mouseY,pmouseX,pmouseY));}
  fill (0);
  rect (230,230,50,50);
  if (mouseX>230 && mouseX<280 && mouseY>230 && mouseY<280) {
    fill(255,0,0);
    rect (230,230,50,50);
    player = minim.loadFile ("1.wav");
    player.play();
  }

  fill (0);
  rect (40,70,50,50);
  if (mouseX>40 && mouseX<90 && mouseY>70 && mouseY<110) {
    fill(255,50,300);
    rect (40,70,50,50);
    player = minim.loadFile ("11.wav");
    player.play();
  }

  fill (0);
  rect (380,300,50,50);
  if (mouseX>380 && mouseX<430 && mouseY>300 && mouseY<350) {
    fill(240,100,0);
    rect (380,300,50,50);
    player = minim.loadFile ("3.wav");
    player.play();
  }


  fill (0);
  rect (380,90,50,50);
  if (mouseX>380 && mouseX<430 && mouseY>90 && mouseY<130) {
    fill(140,170,600);
    rect (380,90,50,50);
    player = minim.loadFile ("4.wav");
    player.play();
  }

  fill (0);
  rect (150,420,50,50);
  if (mouseX>150 && mouseX<200 && mouseY>420 && mouseY<470) {
    fill(55,0,0,30);
    rect (150,420,50,50);
    player = minim.loadFile ("5.wav");
    player.play();
  }


  fill (0);
  rect (120,300,50,50);
  if (mouseX>120 && mouseX<170 && mouseY>300 && mouseY<350) {
    fill(0,570,0);
    rect (120,300,50,50);
    player = minim.loadFile ("6.wav");
    player.play();
  }

  fill (0);
  rect (260,50,50,50);
  if (mouseX>260 && mouseX<310 && mouseY>50 && mouseY<100) {
    fill(700,170,20);
    rect (260,50,50,50);
    player = minim.loadFile ("7.wav");
    player.play();
  }

  fill (0);
  rect (430,430,50,50);
  if (mouseX>430 && mouseX<480 && mouseY>430 && mouseY<480) {
    fill(279,0,0);
    rect (430,430,50,50);
    player = minim.loadFile ("8.wav");
    player.play();
  }

  fill (0);
  rect (80,200,50,50);
  if (mouseX>80 && mouseX<130 && mouseY>200 && mouseY<250) {
    fill(0,10,500);
    rect (80,200,50,50);
    player = minim.loadFile ("9.wav");
    player.play();
  }

  fill (0);
  rect (280,370,50,50);
  if (mouseX>280 && mouseX<330 && mouseY>370 && mouseY<520) {
    fill(320,0,230);
    rect (280,370,50,50);
    player = minim.loadFile ("10.wav");
    player.play();
  }

  fill (0);
  rect (50,400,50,50);
  if (mouseX>50 && mouseX<100 && mouseY>400 && mouseY<450) {
    fill(50,0,230);
    rect (50,400,50,50);
    player = minim.loadFile ("12.wav");
    player.play();
  }

  stroke(0, 128);
  for (int i=0; i < trail_x.length; i++) {

    // always end with the last mouse position to avoid the "jumping"
    // effect
    int pos = (index+i) % trail_x.length;

    // we can use the counter for color and size
    fill(map(i, 0, trail_x.length, 0, 100), 255, 255, 128);   
    ellipse(trail_x[pos], trail_y[pos],1+i, 1+i);
  }
}

void mouseMoved() {
  trail_x[index] = mouseX;
  trail_y[index] = mouseY;
  index++;
  if (index >= trail_x.length) index = 0;
}

class SoundCircle {
  // variables
  SoundCircle(int a, int b, int c, AudioPlayer d) {
    // code
  }

  void play(float a) {
  }
}


