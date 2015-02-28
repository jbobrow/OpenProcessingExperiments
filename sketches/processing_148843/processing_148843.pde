
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

/*
import ddf.minim.*;

Minim minim;
AudioInput input;
*/
float x;
float y;

boolean onOff = true;
boolean Colors = true;

void setup () {
  size (600, 600);
  smooth();

  x = 0;
  y = 40;
/*
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
*/
  background (#f9f8da);
  stroke(#867e73);
}

void draw () {
  if (Colors) {
    background(#867e73);
    stroke(#f9f8da);
  }
  if (!Colors) {
    background(#f9f8da);
    stroke(#867e73);
  }
  float dia = input.mix.level() * 100;
  println(dia);
  x += input.mix.level() * 100;

  strokeWeight(dia/3);
  for (float a = 0; a <= width; a = a+(width/12)) {
    for (float b = 0; b <= height; b = b+(height/8)) {
      if ((dia>0)&&(dia<10)) {
        line(width/2, height/4, a, b);
        line(width/2, (height/4)*3, a, b);
      }
      if ((dia>10)&&(dia<20)) {
        line(width/4, height/4, a, b);
        line((3*width)/4, (3*height)/4, a, b);
      }
      if ((dia>20)&&(dia<30)) {
        line((3*width)/4, height/4, a, b);
        line(width/4, (3*height)/4, a, b);
      }
      if (dia>30) {
        line(width/2, height/2, a, b);
      }
    }
  }
  if (Colors) fill(255);
  if (!Colors) fill(0);
  title();
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (keyCode==TAB) Colors = !Colors;
}

void title() { 
  textSize(10);
  textAlign(LEFT);
  text("S = saveFrame / Tab = Change Color / Space = On/Off", 30, height-20);
  textAlign(RIGHT);
  text("Song YoungJun, Spider web, Dynamic Media, 2014", width-30, height-20);
}

