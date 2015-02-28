
import ddf.minim.*;
float radian, rad, vol=0, distance, time = 0;
int deg;


Minim minim;
AudioInput in;

void setup() {
  size(600, 600);
  background(0);
  minimSet();
  fill(0);
  stroke(255);
  strokeWeight(.5);
}

void minimSet() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  translate(width/2, height/2);
  smooth();
  beginShape();
  for(deg=0; deg<99; deg++) {
    if(in.mix.level()*1600 > vol) {
      vol = in.mix.level()*1600;
    }
    radian = deg*PI/48;
    rad = vol*noise(time*sin(radian));
    curveVertex(rad*cos(radian), rad*sin(radian));
  } 
  endShape();
  time+=.05;
  vol-=10;
  /*r=255*sin(time*3);
  g=255*cos(time/2);
  b=b+10*(noise(time)-.5);;*/
}

void keyPressed() {
  if(keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}

