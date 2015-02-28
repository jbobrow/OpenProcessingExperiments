
import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage a, b;
int N=21;
String fname;
int c=0, d=1, m=0, n=0;
//int mx=150;
int mx=160;
//int mx=225;
//int mx=300;
boolean start=true;

void setup()
{
  //size(320+2*mx, 480, P2D);
  size(640, 480, P2D);
  //size(480+2*mx, 720, P2D);
  //size(930, 720, P2D);
  //size(640+2*mx, 960, P2D);
  smooth();
  noStroke();
  fill(0, 0, 0);
  rect(0, 0, mx, height-mx);
  fill(64, 0, 0);
  rect(width-mx, mx, mx, height);
  a=loadImage("TR Logo 1.jpg");
  image(a, 0, height-mx, mx, mx);
  a=loadImage("TR Logo 2.jpg");
  image(a, width-mx, 0, mx, mx);
  a=loadImage("bg.jpg");
  b=loadImage("bg1.jpg");
  image(a, mx, 0, width-2*mx, height);
  minim=new Minim(this);
  player=minim.loadFile("TombRaider.mp3", height-mx);
  m=millis()-10000;
}

void draw()
{
  noStroke();
  fill(0, 0, 0, 64);
  rect(0, 0, mx, height-mx);
  fill(64, 0, 0, 64);
  rect(width-mx, mx, mx, height);
  if(c<255 && b.width>0) {
    image(a, mx, 0, width-2*mx, height);
    c+=d++;
    constrain(c, 0, 255);
    tint(255, c);
    image(b, mx, 0, width-2*mx, height);
  }
  strokeWeight(2);
  for(int i=0; i<player.left.size()-1; i++)
  {
    stroke(64, 64, 64);
    line(mx/2+player.left.get(i)*mx/2, i, mx/2+player.left.get(i+1)*mx/2, i+1);
    stroke(128, 0, 0);
    line(width-mx/2+player.right.get(i)*mx/2, mx+i, width-mx/2+player.right.get(i+1)*mx/2, mx+i+1);
  }
  float y=(float)player.position()/player.length()*(height-mx);
  stroke(255, 0, 0);
  strokeWeight(1);
  line(0, y, mx, y);
  line(width-mx, mx+y, width, mx+y);
  if(millis()-m>15000) {
    if(start) {
      start=false;
      player.loop();
    }
    nextSlide();
  }
}

void keyPressed() {
  nextSlide();
}

void mousePressed() {
  if(mouseX>=mx && mouseX<width-mx) {
    nextSlide();
  }
  else {
    if(mouseX<mx) {
      if(mouseY>=0 && mouseY<height-mx) player.cue(int((float)mouseY/(height-mx)*player.length()));
    }
    else {
      if(mouseY>=mx && mouseY<height) player.cue(int((float)(mouseY-mx)/(height-mx)*player.length()));
    }
  }
}

void nextSlide() {
  m=millis();
  c=0;
  d=1;
  fname="p"+nf(n, 2)+".jpg";
  a=b;
  b=requestImage(fname);
  if(++n==N) n=0;
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}

