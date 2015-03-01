
/*
drawing flowers

click everywhere on screen

*/


import ddf.minim.*;
import ddf.minim.ugens.*;

float x0, y0;
float x1, y1, dx1, dy1, d1, vx1, vy1;
float x2, y2, dx2, dy2, d2, vx2, vy2;
boolean styleTrait, styleMilieu, styleExtremite;

Minim       minim;
AudioOutput out;
Oscil w1;
Oscil w2;


void setup() {
  size(800, 600);
  x0 = width/2;
  y0 = height/2;
  colorMode(HSB, 100, 100, 100);
  initDepart(0,0);
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  Summer sum = new Summer();
  
  // create some Oscils to patch to the Summer
  w1 = new Oscil( Frequency.ofPitch("A4"), 0.3f, Waves.SINE );
  // patch the Oscil to the Summer
  w1.patch( sum );
  
  w2 = new Oscil( Frequency.ofPitch("C#5"), 0.3f, Waves.SINE );
  w2.patch( sum );
  // and the Summer to the output and you should hear a major chord
  sum.patch( out );

}

void distances() {
  dx1 = x0 - x1;
  dy1 = y0 - y1;
  d1 = abs(dx1) + abs(dy1);
  dx2 = x0 - x2;
  dy2 = y0 - y2;
  d2 = abs(dx2) + abs(dy2);
}

void initDepart(float ix, float iy) {
  background(95, 50, 25);
  x1 = ix;
  y1 = iy;
  distances();
  vx1 = random(-20, 20);
  vy1 = random(-20, 20);
  x2 = x1;
  y2 = y1;
  distances();
  vx2 = random(-20, 20);
  vy2 = random(-20, 20);
  styleExtremite = (random(10) > 5);
  styleTrait = (random(10) > 5);
  styleMilieu = (random(10) > 5);
  if( !styleExtremite && !styleTrait && !styleMilieu) 
    styleTrait = true;
}

void mousePressed() {
  background(95, 50, 25);
  initDepart(mouseX, mouseY);
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    saveFrame();
    println("save done");
  }
}

void draw() {
  //background(95,50,25);
  stroke(0);
  fill(255);
  ellipse(x0, y0, 10, 10);
  if (styleExtremite) {
    fill((float)(frameCount%1000)/10, 100, 100);
    ellipse(x1, y1, 10, 10); 
    fill((float)((frameCount+100)%1000)/10, 100, 100);
    ellipse(x2, y2, 10, 10);
  }
  if (styleMilieu) {
    fill((float)((frameCount+50)%1000)/10, 100, 100);
    ellipse((x1+x2)/2, (y1+y2)/2, 10, 10);
  }
  if (styleTrait) {
    stroke((float)((frameCount+50)%1000)/10, 100, 100);
    line(x1, y1, x2, y2);
  }
  distances();
  float ax1 = dx1 * 5 / d1;
  float ay1 = dy1 * 5 / d1;
  vx1 = vx1 + ax1 - vx1 / 500;
  vy1 = vy1 + ay1 - vy1 / 500;
  float v1 = abs(vx1) + abs(vy1);
  y1 = y1 + vy1;
  x1 = x1 + vx1;
  distances();
  if (d1 < 10 && v1 < 10) {
    vx1 = 0;
    vy1 = 0;
  }
  distances();
  float ax2 = dx2 * 5 / d2;
  float ay2 = dy2 * 5 / d2;
  vx2 = vx2 + ax2 - vx2 / 500;
  vy2 = vy2 + ay2 - vy2 / 500;
  float v2 = abs(vx2) + abs(vy2);
  y2 = y2 + vy2;
  x2 = x2 + vx2;
  distances();
  if (d2 < 10 && v2 < 10) {
    vx2 = 0;
    vy2 = 0;
  }
  //float f1 = map(d1,0,width,110,880);
  //float f2 = map(d2,0,height,110,880);
  float f1 = map(v1,5,200,110,880);
  float f2 = map(v2,5,200,110,880);
  float a1 = map(v1,5,200,0,0.3f);
  float a2 = map(v2,5,200,0,0.3f);
  w1.setFrequency(f1);
  //w1.setAmplitude(a1);
  w2.setFrequency(f2);
  //w2.setAmplitude(a2);
}


