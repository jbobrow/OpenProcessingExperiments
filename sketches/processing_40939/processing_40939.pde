
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer click;
AudioPlayer release;

AudioPlayer p;

int count = 10;
int boxSize = 60;

float spin = 0;
int xpos = 100;
int ypos = 100;
int ease = 20;

float[][] Box = new float[count][5];
int sel = 0;

boolean dragging=false;
void mouseDragged() {
  dragging=true;
}

void mouseReleased() {
  if(dragging==true) {

    int i = 0;
    while(i<count) {
      if (dist(mouseX, mouseY, Box[i][0], Box[i][1]) < 50) {
        if(release.isPlaying() == false) {
          release.loop(0);
        }
      }
      i = i +1;
    }
  }
  dragging=false;
}

void setup() {
  m = new Minim(this);
  click = m.loadFile("bottle_pop_2.wav");
  release = m.loadFile("paper-rip-1.wav");

  noFill();
  frameRate(90);
  size(700, 400);
  stroke(181);
  strokeWeight(2);
  for (int j=0;j< count;j++) {
    Box[j][0]=random(width); 
    Box[j][1]=random(height); 
    Box[j][2]=random(boxSize);      
    Box[j][3]=random(-1, 1); 
    Box[j][4]=random(-1, 1);
  }
}

void draw() {
  background(0);
  for (int j=0;j< count;j++) {
    stroke(255);
    float radi=Box[j][2];
    float diam=radi/2;

    if ( dist(Box[j][0], Box[j][1], mouseX, mouseY) < radi ) {
      fill(87, 54, 218);

      sel=1;

      if (dragging) {

        Box[j][0]=mouseX;
        Box[j][1]=mouseY;
      }
    } 
    else {
      noFill();
      sel=0;
    }
    star(Box[j][0], Box[j][1]);

    Box[j][0]+=Box[j][3];
    Box[j][1]+=Box[j][4];
  }
}

void mouseClicked() {
  int i = 0;
  while(i<count) {
    if (dist(mouseX, mouseY, Box[i][0], Box[i][1]) < 50) {
      if(click.isPlaying() == false) {
        click.loop(0);
      }
    }
    i = i +1;
  }
}

void star(float xpos, float ypos) {
  pushMatrix();
  translate (xpos, ypos);
  rotate(radians(spin));

  float rotation = 0;
  while (rotation<360) {
    pushMatrix();

    rotate (radians(rotation));
    rect (0, 0, 50, 50);
    rotation = rotation+60;
    popMatrix();
  }
  popMatrix();
}


