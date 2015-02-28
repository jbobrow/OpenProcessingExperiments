


//Sun Kyung Park
//andrewID: sunkyunp
//Copyright Sun Kyung Park Dec 2012
//project 1


//click #1-8 TO PLAY SOUND//


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


PFont font;

//audio

Minim m;
AudioPlayer s1, s2, s3, s4, s5, s6, s7, s8;


float x1, x2, x3, x4, x5, x6, x7, x8, y1;

int s;


void setup () {
  size (1000, 600);
  smooth ();
  background (0);
  frameRate (8);

  x1 = 110;
  x2 = 210;
  x3 = 310;
  x4 = 410;
  x5 = 510;
  x6 = 610;
  x7 = 710;
  x8 = 810;

  font = loadFont("ArvilSans-48.vlw");
  textAlign (CENTER);

  m = new Minim(this);

  s1 = m.loadFile("s1.mp3", 1024);
  s2 = m.loadFile("s2.mp3", 1024);
  s3 = m.loadFile("s3.mp3", 1024);
  s4 = m.loadFile("s4.mp3", 1024);
  s5 = m.loadFile("s5.mp3", 1024);
  s6 = m.loadFile("s6.mp3", 1024);
  s7 = m.loadFile("s7.mp3", 1024);
  s8 = m.loadFile("s8.mp3", 1024);
}


void draw () {
  //boomBoom ();
  strokeCap(SQUARE);
  fill (255);
  textFont (font, 42);
  text ("DO", x1+40, y1+550);
  text ("RAE", x2+40, y1+550);
  text ("MI", x3+40, y1+550);
  text ("FA", x4+40, y1+550);
  text ("SOL", x5+40, y1+550);
  text ("LA", x6+40, y1+550);
  text ("TI", x7+40, y1+550);
  text ("DO", x8+40, y1+550);

  textFont(font, 32);
  text ("Press the keys 1-8 to play", x5-20, y1+80);

  drawBars ();
}

void drawBars () {

  strokeWeight (10);
  stroke (random (255), random (255), random (255));
  line (x1, y1+500, x1+80, y1+500);
  line (x2, y1+500, x2+80, y1+500);
  line (x3, y1+500, x3+80, y1+500);
  line (x4, y1+500, x4+80, y1+500);
  line (x5, y1+500, x5+80, y1+500);
  line (x6, y1+500, x6+80, y1+500);
  line (x7, y1+500, x7+80, y1+500);
  line (x8, y1+500, x8+80, y1+500);
}


//key pressed sound
void keyPressed () {
  if (key == '1')
  {
    fill (random (255), random (255), random (255));
    line (x1, y1+500, x1+80, y1+500);

    s1.play();
    s1.rewind();


    fill (247, 30, 30);
    line (x1, y1+480, x1+80, y1+480);
  } 

  if (key == '2')
  {
    fill (random (255), random (255), random (255));
    line (x2, y1+500, x2+80, y1+500);

    s2.play ();
    s2.rewind();

    for (float i = 480, j = 0, r = random(255),g = random(255); i >=460; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x2, y1+i, x2+80, y1+i);
    }
  }

  if (key == '3')
  {
    fill (random (255), random (255), random (255));
    line (x3, y1+500, x3+80, y1+500);

    s3.play ();
    s3.rewind();

    for (float i = 480, j = 0, r = random(255),g = random(255); i >=440; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x3, y1+i, x3+80, y1+i);
    }
  }

  if (key == '4')
  {
    fill (random (255), random (255), random (255));
    line (x4, y1+500, x4+80, y1+500);

    s4.play ();
    s4.rewind();


    for (float i = 480, j = 0, r = random(255),g = random(255); i >=420; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x4, y1+i, x4+80, y1+i);
    }
  }

  if (key == '5')
  {
    fill (random (255), random (255), random (255));
    line (x5, y1+500, x5+80, y1+500);

    s5.play ();
    s5.rewind();

    for (float i = 480, j = 0, r = random(255),g = random(255); i >=400; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x5, y1+i, x5+80, y1+i);
    }
  }

  if (key == '6')
  {
    fill (random (255), random (255), random (255));
    line (x6, y1+500, x6+80, y1+500);

    s6.play ();
    s6.rewind();


    for (float i = 480, j = 0, r = random(255),g = random(255); i >=380; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x6, y1+i, x6+80, y1+i);
    }
  }

  if (key == '7')
  {
    fill (random (255), random (255), random (255));
    line (x7, y1+500, x7+80, y1+500);

    s7.play ();
    s7.rewind();

    for (float i = 480, j = 0, r = random(255),g = random(255); i >=360; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x7, y1+i, x7+80, y1+i);
    }
  }

  if (key == '8')
  {
    fill (random (255), random (255), random (255));
    line (x8, y1+500, x8+80, y1+500);

    s8.play ();
    s8.rewind();

    for (float i = 480, j = 0, r = random(255),g = random(255); i >=340; i -= 20, j+=40 ) {

      stroke(r, g, j);

      line (x8, y1+i, x8+80, y1+i);
    }
  }
}



