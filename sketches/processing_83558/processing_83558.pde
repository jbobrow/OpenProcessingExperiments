
//Matt Dawson
//Project 2
//Copyright Matt Dawson, Carnegie Mellon University, 12/16/12
//all rights reserved
//credit to Minim library examples

//this is an attempt at a basic synthesizer
//use the number keys (0-9) to call different drum sounds
//viual output is generated according to the input
//make music

import ddf.minim.*;

Minim minim;
//AudioSample kick1;
AudioSample kick2;
AudioSample kick3;
AudioSample snare1;
//AudioSample snare2;
AudioSample snare3;
AudioSample rimsnare;
AudioSample tom;
AudioSample stickhit;
AudioSample cowbell;
AudioSample crash;
AudioSample electricdrum;

float rWidth, rHeight;

PImage fade;


void setup()
{
  size(600, 600, P3D);
  minim = new Minim(this);
  
   rWidth = width*0.99;
   rHeight = height*0.99;

  //kick1 = minim.loadSample( "21KICK.WAV",512);
  kick2 = minim.loadSample( "KICK.WAV",512);
  kick3 = minim.loadSample("BD.mp3", 512);
  snare1 = minim.loadSample("SD.wav", 512);
 // snare2 = minim.loadSample("SNARE_2.WAV", 512);
  snare3 = minim.loadSample("SNARE_3.WAV", 512);
  rimsnare = minim.loadSample("rimsnare_12.wav", 512);
  tom = minim.loadSample("TOM.WAV", 512);
  stickhit = minim.loadSample("STICKHIT.WAV", 512);
  cowbell = minim.loadSample("COWBELL.WAV", 512);
  crash = minim.loadSample("crash4.wav", 512);
  electricdrum = minim.loadSample("ELDRUM44.WAV", 512);

background(0);
  fade = get(0,0,width,height);
  
  
}

void draw()
{
  
  
  background(0,10);

 
 tint(255,255,255,252);
 image(fade,((width-rWidth)/2),((height-rHeight)/2),rWidth,rHeight);
 noTint();
 
  stroke(255);

  for (int i = 0; i < kick2.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick2.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick2.bufferSize(), 0, width);
    stroke(0,0,220);
    line(x1, 50 - kick2.mix.get(i)*50, x2, 50 - kick2.mix.get(i+1)*50);
    stroke(255,0,0);
    line(x1, 100 - kick3.mix.get(i)*50, x2, 100 - kick3.mix.get(i+1)*50);
    stroke(0,255,0);
    line(x1, 150 - snare1.mix.get(i)*50, x2, 150 - snare1.mix.get(i+1)*50);
    stroke(0,0,255);
    line(x1, 200 - snare3.mix.get(i)*50, x2, 200 - snare3.mix.get(i+1)*50);
    stroke(230,0,0);
    line(x1, 250 - rimsnare.mix.get(i)*50, x2, 250 - rimsnare.mix.get(i+1)*50);
    stroke(0,230,0);
    line(x1, 300 - tom.mix.get(i)*50, x2, 300 - tom.mix.get(i+1)*50);
    stroke(0,0,230);
    line(x1, 350 - stickhit.mix.get(i)*50, x2, 350 - stickhit.mix.get(i+1)*50);
    stroke(220,0,0);
    line(x1, 400 - cowbell.mix.get(i)*50, x2, 400 - cowbell.mix.get(i+1)*50);
    stroke(0,220,0);
    line(x1, 450 - crash.mix.get(i)*50, x2, 450 - crash.mix.get(i+1)*50);
    stroke(0,0,220);
    line(x1, 500 - electricdrum.mix.get(i)*50, x2, 500 - electricdrum.mix.get(i+1)*50);
  }
  
   fade = get(0,0,width,height);
   //saveFrame("project2.jpg");
}

void keyPressed()
{
  if ( key == '1' ) kick2.trigger();
  if ( key == '2' ) kick3.trigger();
  if ( key == '3' ) snare1.trigger();
  if ( key == '4' ) snare3.trigger();
  if ( key == '5' ) rimsnare.trigger();
  if ( key == '6' ) tom.trigger();
  if ( key == '7' ) stickhit.trigger();
  if ( key == '8' ) cowbell.trigger();
  if ( key == '9' ) crash.trigger();
  if ( key == '0' ) electricdrum.trigger();
}

void stop()
{
  
  kick2.close();
  kick3.close();
  snare1.close();
  snare3.close();
  rimsnare.close();
  tom.close();
  stickhit.close();
  cowbell.close();
  crash.close();
  electricdrum.close();
  minim.stop();

  super.stop();
}


