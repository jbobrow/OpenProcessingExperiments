

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


class Orb {
  float x, y, r;

  // Default constructor
  Orb() {
  }

  Orb(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    
  }
}
Orb orb;
PVector velocity;

Minim minim;
AudioOutput out;
SineWave sine;
SineWave sine2;


void setup() {
  size(700, 700);
  smooth();
  orb = new Orb(50, 50, 10);
  velocity = new PVector(0, 0);
  
   minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(100, 0.5, out.sampleRate());
  sine2 = new SineWave(100, 0.3, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(10);
  sine2.portamento(30);
  // add the oscillator to the line out
  out.addSignal(sine);
  out.addSignal(sine2);

  
}
void draw() {
  // Background
  //------------
  strokeWeight(8);
  stroke(255);
  
  
  float freq = map(orb.y, 0, height, 600, 60);
  sine.setFreq(freq);

float freq2 = map(orb.x, 0, width, 400, 60);
  sine2.setFreq(freq2);
  float pan = map(orb.x, orb.y, width, -1, 1);
  sine.setPan(pan);


//
//
//
//
//
//
//line(orb.x,0,orb.x,height);
//line(0,orb.y,width,orb.y);

stroke(orb.x/2,orb.y/3,orb.x/2,50);
strokeWeight(15);
//line(orb.x,0,0,orb.y);
//line(0,orb.x,orb.y,0);
//line(width,orb.y,orb.x,height);
//line(orb.y,height,width,orb.x);
//line(0,orb.y,orb.x,height);
//line(orb.y,0,width,orb.x);
//line(width,orb.y,orb.x,0);
//line(orb.y,height,0,orb.x);
stroke(50,50);
//line(0,500,orb.x,orb.y);
//line(0,0,orb.x,orb.y);
//line(500,0,orb.x,orb.y);
//line(500,500,orb.x,orb.y);
stroke(255-((orb.y/2)-100),255-((orb.y/2)-100),255-((orb.y/2-100)));
//stroke(255);
strokeWeight(10);
  if(orb.x > -20 && orb.x < 20) {
    line(0,0,0,height);
  }
  if(orb.x > 10 && orb.x < 30) {
    line(20,0,20,height);
  }
  if(orb.x > 30&& orb.x < 50) {
    line(40,0,40,height);
  }
  if(orb.x > 50&& orb.x < 70) {
    line(60,0,60,height);
  }
  if(orb.x > 70&& orb.x < 90) {
    line(80,0,80,height);
  }
  if(orb.x > 90&& orb.x < 110) {
    line(100,0,100,height);
  }
  if(orb.x > 110 && orb.x < 130) {
    line(120,0,120,height);
  }
  if(orb.x > 130 && orb.x < 150) {
    line(140,0,140,height);
  }
  if(orb.x > 150 && orb.x < 170) {
    line(160,0,160,height);
  }
  if(orb.x > 170 && orb.x < 190) {
    line(180,0,180,height);
  }
  if(orb.x > 190 && orb.x < 210) {
    line(200,0,200,height);
  }
  if(orb.x > 210 && orb.x < 230) {
    line(220,0,220,height);
  }
  if(orb.x > 230 && orb.x < 250) {
    line(240,0,240,height);
  }
  if(orb.x > 250 && orb.x < 270) {
    line(260,0,260,height);
  }
  if(orb.x > 270 && orb.x < 290) {
    line(280,0,280,height);
  }
  if(orb.x > 290 && orb.x < 310) {
    line(300,0,300,height);
  }
  if(orb.x > 310 && orb.x < 330) {
    line(320,0,320,height);
  }
  if(orb.x > 330 && orb.x < 350) {
    line(340,0,340,height);
  }
  if(orb.x > 350 && orb.x < 370) {
    line(360,0,360,height);
  }
  if(orb.x > 370 && orb.x < 390) {
    line(380,0,380,height);
  }
  if(orb.x > 390 && orb.x < 410) {
    line(400,0,400,height);
  }
  if(orb.x > 410 && orb.x < 430) {
    line(420,0,420,height);
  }
  if(orb.x > 430 && orb.x < 450) {
    line(440,0,440,height);
  }
  if(orb.x > 450 && orb.x < 470) {
    line(460,0,460,height);
  }
  if(orb.x > 470 && orb.x < 490) {
    line(480,0,480,height);
  }
  if(orb.x > 490 && orb.x < 510) {
    line(500,0,500,height);
  }
  if(orb.x > 510 && orb.x < 530) {
    line(520,0,520,height);
  }
  if(orb.x > 530 && orb.x < 550) {
    line(540,0,540,height);
  }
  if(orb.x > 550 && orb.x < 570) {
    line(560,0,560,height);
  }
  if(orb.x > 570 && orb.x < 590) {
    line(580,0,580,height);
  }
  if(orb.x > 590 && orb.x < 610) {
    line(600,0,600,height);
  }
  if(orb.x > 610 && orb.x < 630) {
    line(620,0,620,height);
  }
  if(orb.x > 630 && orb.x < 650) {
    line(640,0,640,height);
  }
  if(orb.x > 650 && orb.x < 670) {
    line(660,0,660,height);
  }
  if(orb.x > 670 && orb.x < 690) {
    line(680,0,680,height);
  }
  if(orb.x > 680 && orb.x < 710) {
    line(700,0,700,height);
  }
  //|||||||||||||||
  //
  //
  //
  //
  //
  //stroke((orb.x/2)+20,(orb.x/2)+20,(orb.x/2+20));
  
  if(orb.y > -20 && orb.y < 20) {
    line(0,0,500,0);
  }
  if(orb.y > 10 && orb.y < 30) {
    line(0,20,width,20);
  }
  if(orb.y > 30&& orb.y < 50) {
    line(0,40,width,40);
  }
  if(orb.y > 50&& orb.y < 70) {
    line(0,60,width,60);
  }
  if(orb.y > 70&& orb.y < 90) {
    line(0,80,width,80);
  }
  if(orb.y > 90&& orb.y < 110) {
    line(0,100,width,100);
  }
  if(orb.y > 110 && orb.y < 130) {
    line(0,120,width,120);
  }
  if(orb.y > 130 && orb.y < 150) {
    line(0,140,width,140);
  }
  if(orb.y > 150 && orb.y < 170) {
    line(0,160,width,160);
  }
  if(orb.y > 170 && orb.y < 190) {
    line(0,180,width,180);
  }
  if(orb.y > 190 && orb.y < 210) {
    line(0,200,width,200);
  }
  if(orb.y > 210 && orb.y < 230) {
    line(0,220,width,220);
  }
  if(orb.y > 230 && orb.y < 250) {
    line(0,240,width,240);
  }
  if(orb.y > 250 && orb.y < 270) {
    line(0,260,width,260);
  }
  if(orb.y > 270 && orb.y < 290) {
    line(0,280,width,280);
  }
  if(orb.y > 290 && orb.y < 310) {
    line(0,300,width,300);
  }
  if(orb.y > 310 && orb.y < 330) {
    line(0,320,width,320);
  }
  if(orb.y > 330 && orb.y < 350) {
    line(0,340,width,340);
  }
  if(orb.y > 350 && orb.y < 370) {
    line(0,360,width,360);
  }
  if(orb.y > 370 && orb.y < 390) {
    line(0,380,width,380);
  }
  if(orb.y > 390 && orb.y < 410) {
    line(0,400,width,400);
  }
  if(orb.y > 410 && orb.y < 430) {
    line(0,420,width,420);
  }
  if(orb.y > 430 && orb.y < 450) {
    line(0,440,width,440);
  }
   if(orb.y > 450 && orb.y < 470) {
    line(0,460,width,460);
  }
  if(orb.y > 470 && orb.y < 490) {
    line(0,480,width,480);
  }
  if(orb.y > 480 && orb.y < 510) {
    line(0,500,width,500);
  }
  if(orb.y > 510 && orb.y < 530) {
    line(0,520,width,520);
  }
  if(orb.y > 530 && orb.y < 550) {
    line(0,540,width,540);
  }
  if(orb.y > 550 && orb.y < 570) {
    line(0,560,width,560);
  }
  if(orb.y > 570 && orb.y < 590) {
    line(0,580,width,580);
  }
  if(orb.y > 590 && orb.y < 610) {
    line(0,600,width,600);
  }
  if(orb.y > 610 && orb.y < 630) {
    line(0,620,width,620);
  }
  if(orb.y > 630 && orb.y < 650) {
    line(0,640,width,640);
  }
  if(orb.y > 650 && orb.y < 670) {
    line(0,660,width,660);
  }
  if(orb.y > 670 && orb.y < 690) {
    line(0,680,width,680);
  }
  if(orb.y > 680 && orb.y < 710) {
    line(0,700,width,700);
  }
  //
  //
  //
  //
  //
  //
  //orb.y/2,orb.y/2,orb.y/2
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

  // Move orb
  orb.x += velocity.x;
  orb.y += velocity.y;

noStroke();
  fill(255,255,255,0);
  ellipse(orb.x, orb.y, orb.r*2, orb.r*2);
 
  

  if (mousePressed) {
     // Draw orb
    
    //orb.x = mouseX;
    //orb.y = mouseY;
    velocity.x = (mouseX-orb.x)/2;
    velocity.y = (mouseY-orb.y)/2;
  }

  if (orb.x > width-orb.r) {
    orb.x = width-orb.r;
    velocity.x *= -1;
  }
  else if (orb.x < orb.r) {
    orb.x = orb.r;
    velocity.x *= -1;
  }
  if (orb.y > height-orb.r) {
    orb.y = height-orb.r;
    velocity.y *= -1;
  }
  else if (orb.y < orb.r) {
    orb.y = orb.r;
    velocity.y *= -1;
  }
}


