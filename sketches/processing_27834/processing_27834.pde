
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer song1;

ArrayList rains=new ArrayList();

int radius = 10;
int x=0;
int y=10;
int z=30;
float vari=random(0,500);

void setup() {
  size(500,500);
  smooth();  
  minim=new Minim(this);
  song=minim.loadFile("raindrop.wav");
  song1=minim.loadFile("Wind.wav");
}

void draw() {
  background(5,161,255);
  if (y<800) {
    x=x+1;
    y+=3;
    z+=6;
    noStroke();
    fill(12,146,227,(255-(x/5)));
    ellipse(0,0,x,x);
    fill(101,196,254,(255-(x/5)));
    ellipse(0,0,y,y);
    fill(40,158,229,(255-(x/5)));
    ellipse(0,0,z,z);
    //
    fill(12,146,227,(255-(x/5)));
    ellipse(500,500,x,x);
    fill(101,196,254,(255-(x/5)));
    ellipse(500,500,y,y);
    fill(40,158,229,(255-(x/5)));
    ellipse(500,500,z,z);
    //
    fill(12,146,227,(255-(x/5)));
    ellipse(0,500,x,x);
    fill(101,196,254,(255-(x/5)));
    ellipse(0,500,y,y);
    fill(40,158,229,(255-(x/5)));
    ellipse(0,500,z,z);
    //
    fill(12,146,227,(255-(x/5)));
    ellipse(500,0,x,x);
    fill(101,196,254,(255-(x/5)));
    ellipse(500,0,y,y);
    fill(40,158,229,(255-(x/5)));
    ellipse(500,0,z,z);
  }
  else {
    x=0;
    y=0;
    z=0;
  }
  loop();
  for (int i=rains.size()-1;i>=0;i--) {
    Rain rain=(Rain) rains.get(i);
    rain.extend();
    rain.display();
    if (rain.fadeout()) {
      rains.remove(i);
    }
  }
}

void mousePressed() {
  if (mouseButton==LEFT) {
    song.play();
    song.rewind();
    rains.add(new Rain(mouseX,mouseY,radius));
  }
}

class Rain {
  float x;
  float y;
  float r;
  float life=255;

  Rain(float tempX, float tempY, float tempR) {
    x=tempX;
    y=tempY;
    r=tempR;
  }

  void extend() {
    r=r+1;
    if (r>150) {
      r=0;
    }
  }

  boolean fadeout() {
    life-=2;
    if (life<255*(r/150)) {
      return true;
    }
    else {
      return false;
    }
  }
  void display() {
    noFill();
    fill(149,221,255,life);
    stroke(255,life);
    ellipse(x,y,r,r);
  }
}

