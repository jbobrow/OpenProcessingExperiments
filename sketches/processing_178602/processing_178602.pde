
Star s1, s2, s3, s4, s5, s6, s7;
boolean makeSM=false;
PImage img;


import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

void setup() {
  size(1000, 500);
  colorMode(HSB, 360, 100, 100);
  background(253, 96, 24);
  img = loadImage("building.png");
  s1 = new Star(100, 10, 10, color(335, 100, 100, 50), color(335, 100, 100)); 
  s2 = new Star(220, 10, 10, color(30, 100, 100, 50), color(30, 100, 100)); 
  s3 = new Star(360, 10, 10, color(60, 100, 100, 50), color(60, 100, 100));
  s4 = new Star(480, 10, 10, color(100, 100, 100, 50), color(100, 100, 100));
  s5 = new Star(600, 10, 10, color(190, 100, 100, 50), color(190, 100, 100));
  s6 = new Star(720, 10, 10, color(230, 100, 100, 50), color(230, 100, 100));
  s7 = new Star(840, 10, 10, color(290, 100, 100, 50), color(290, 100, 100));

  minim = new Minim(this);
  song = minim.loadFile("test.mp3");
  song.loop();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
  noCursor();
}


int max=100000;
shoting [] ls= new shoting[max];
int cnt =0;
int timeCount = 0;

float sos, sOs;

void draw() {

  for (float h=0; h<height; h++) {
    float b= map(h, 0, height, 0, 100);
    strokeWeight(1);
    stroke(262, 96, b, 100);
    line(0, h, width, h);
  }

  wStar();


  s1.sss();
  s2.sss();
  s3.sss();
  s4.sss();
  s5.sss();
  s6.sss();
  s7.sss();

  s1.display(); 
  s2.display(); 
  s3.display();
  s4.display();
  s5.display();
  s6.display();
  s7.display();
  //window();

  image(img, 20, height-img.height);
  tint(100);
  
  strokeWeight(2);
  stroke(255);
  point(mouseX,mouseY);

  for (int i = 0; i < song.bufferSize () - 1; i++)
  {  
    sos=abs(song.left.get(i)*50);
    sOs=map(sos, 0, 35, 2, 15);
  }
}


void mousePressed() {
  s1.press(); 
  s2.press(); 
  s3.press();
  s4.press();
  s5.press();
  s6.press();
  s7.press();
}


void wStar()
{
  for (int i=0; i<10; i++) {
    float x= random(0, width);
    float y= random(0, height/4); 
    float r= random(1, 4);
    strokeWeight(r);
    stroke(255);
    point(x, y);
  }
}

void heart(float a, float b, float s)
{
  noStroke();
  beginShape();
  vertex(a, b);
  bezierVertex(a+3*s, b-20*s, a+20*s, b-3*s, a, b+10*s);
  bezierVertex(a-20*s, b-3*s, a-3*s, b-20*s, a, b);
  endShape();
}


//////
class shoting
{
  float x, y;
  float mx=0;
  float my=0;
  float t;
  color c;
  float hk=1;
  float hx, hy;

  shoting(float xp, float yp, float tp, color cp)
  {
    x=xp;
    y=yp;
    t=tp;
    c = cp;
  }
  void render()
  {
    mx+=t/2;
    my+=t;
    strokeWeight(3);
    stroke(c);
    fill(c);
    point(x+mx, y+my);
  }
}
////////

class Star {
  int x, y;
  int s;
  color Cliked, noCliked;
  boolean pressed = false;
  boolean isPressed() {
    return pressed;
  }

  Star(int xp, int yp, int sz, color o, color p) {
    x=xp;
    y=yp;
    s = sz; 
    Cliked = o; 
    noCliked = p;
  }

  void press() { 
    if ((mouseX >= x-2*s) && (mouseX <= x+2*s) &&
      (mouseY >= y) && (mouseY <= y+5*s)) {
      pressed = true;
    } else {
      pressed = false;
    }
  }

  void display() { 
    if (pressed) {
      fill(Cliked);
    } else {
      fill(noCliked);
    }
    float r= random(-10, 10);

    pushMatrix();
    translate(x, y+2*s);
    rotate(radians(r));
    noStroke();
    beginShape( );
    vertex(0, -2*s);
    vertex(-1.3*s, 1.5*s);
    vertex(2*s, -0.7*s);
    vertex(-2*s, -0.7*s);
    vertex(1.3*s, 1.5*s);
    vertex(0, -2*s);
    endShape( );
    popMatrix();
  }

  void sss()
  {
    stroke(noCliked);
    fill(noCliked);
    if (pressed) {
      if (timeCount%20 ==0) {
        generatShoting();
      }
      for (int i=0; i<cnt; i++) {
        ls[i].render();
      }
      timeCount++;
      window();
    }
   
  }
  
  
void window()
{ 
  beginShape();
  vertex(480, 333);
  vertex(476, 411);
  vertex(508, 413);
  vertex(509, 334);
  endShape();
  //
  beginShape();
  vertex(813, 403);
  vertex(803, 430);
  vertex(827, 433);
  vertex(833, 411);
  endShape();
  //
  beginShape();
  vertex(566, 390);
  vertex(565, 415);
  vertex(584, 413);
  vertex(586, 390);
  endShape();
  //
  beginShape();
  vertex(204, 393);
  vertex(216, 443);
  vertex(227, 439);
  vertex(214, 389);
  endShape();
  //
  beginShape();
  vertex(425, 361);
  vertex(429, 414);
  vertex(438, 414);
  vertex(435, 363);
  endShape();
  //
  beginShape();
  vertex(384, 390);
  vertex(384, 417);
  vertex(394, 415);
  vertex(392, 390);
  endShape();
  //
  beginShape();
  vertex(445, 393);
  vertex(446, 411);
  vertex(454, 412);
  vertex(455, 390);
  endShape();
  //
  beginShape();
  vertex(664, 386);
  vertex(656, 414);
  vertex(671, 420);
  vertex(676, 389);
  endShape();
  //
  beginShape();
  vertex(732, 373);
  vertex(722, 417);
  vertex(736, 428);
  vertex(741, 373);
  endShape();
  //
  beginShape();
  vertex(162, 400);
  vertex(174, 455);
  vertex(195, 448);
  vertex(183, 394);
  endShape();

  //vertex(,);
  //vertex(,);
  //rect();
  //rect();
}

  void generatShoting() {
    if (cnt<10000)
      ls[cnt++]= new shoting(mouseX, mouseY, sOs, noCliked);
  }
}


