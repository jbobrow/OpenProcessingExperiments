
import ddf.minim.*;
Minim minim;
AudioSample kick;
AudioSample snare;
AudioSample hihat;
AudioSample ride;
AudioSample lowtom;
AudioSample hightom;
AudioSample ekick;
AudioSample esnare;
AudioSample ehihat;
AudioSample eride;
AudioSample elowtom;
AudioSample ehightom;

void setup()
{
  size (1000, 700);
  background(255);
  String a = "for acoustic drumset press 'x'";
  String b = "for electric drumset press 'e' and caps lock";
  String c = "clip alligator clip to finger or make copper ring to complete circuit";
  String d = "make a beat using the 'drums' in front of you";
  String e = "DRUMSET";
  fill(1);
  textSize(30);
  text(a,100,175,900,100);
  text(b,100,300,900,100);
  text(c,100,425,900,100);
  text(d,100,550,900,100);
  textSize(60);
  fill(random(255), random(255), random(255));
  text(e,100,25,900,200);
  minim = new Minim(this);
  kick = minim.loadSample( "34498__biodegry__bass-drum.wav", 512);
  snare = minim.loadSample ( "82583__kevoy__snare-drum-4.wav", 512);
  hihat = minim.loadSample ( "171480__xicecoffeex__savannah-closed-hh.wav", 512);
  ride = minim.loadSample ( "28741__teleport8__ride2.wav", 512);
  lowtom = minim.loadSample ( "86334__zgump__tom-0104.wav", 512);
  hightom = minim.loadSample ( "81593__suicidity__high-tom-of-god-wet-020.wav", 512);
  ekick = minim.loadSample ( "2085__opm__kk-set1.wav", 512);  //PROBLEM LOADING
  ehihat = minim.loadSample ( "183151__ondrosik__hihat3.wav", 512);
  eride = minim.loadSample ( "9614__noisecollector__cyberride.wav", 512);
  elowtom = minim.loadSample ( "173837__rocknessmonster89__tom-low.wav", 512);
  ehightom = minim.loadSample ( "34843__zin__low-floor-tom-punk.wav", 512);
  esnare = minim.loadSample ( "17202__bitbeast__znare.wav", 512);
}
void draw()
{ 
  if (keyPressed)
  {
    if ((key== 'e') || (key == 'E'))
    {
      background(255);
      fill(2);
      strokeWeight(2);
      ellipse(500, 500, 200, 200);
      ellipse(300, 300, 120, 120);
      ellipse(700, 300, 120, 120);
      ellipse(260, 480, 100, 100);
      ellipse(500, 340, 60, 60);
      ellipse(740, 480, 100, 100);
    }
  }
  if (keyPressed)
  {
    if ((key=='x') || (key=='X'))
    {
      background(0);
      fill(255);
      strokeWeight(2);
      ellipse(500, 500, 200, 200);
      rect(260, 400, 120, 50);
      rect(200, 295, 7, 300);
      rect(150, 380, 100, 10);
      rect(150, 360, 100, 10);
      rect(395, 310, 100, 80);
      rect(505, 310, 100, 80);
      ellipse(750, 250, 130, 50);
    }
  }
}  
void keyPressed()
{

  if (key=='w')
  {
    fill(random(255), random(255), random(255));
    rect(260, 400, 120, 50);
    snare.trigger();
  }  
  if (key=='s')
  {
    fill(random(255), random(255), random(255));
    rect(200, 295, 7, 300);
    rect(150, 380, 100, 10);
    rect(150, 360, 100, 10);
    hihat.trigger();
  }
  if (key=='d') 
  {
    fill(random(255), random(255), random(255));
    ellipse(500, 500, 200, 200);
    kick.trigger();
  }
  if (key=='a') 
  {
    fill(random(255), random(255), random(255));
    ellipse(750, 250, 130, 50);
    ride.trigger();
  }
  if (key=='f')
  {
    fill(random(255), random(255), random(255));
    rect(395, 310, 100, 80);
    hightom.trigger();
  }  
  if (key=='g')
  {
    fill(random(255), random(255), random(255));
    rect(505, 310, 100, 80);
    lowtom.trigger();
  }  
  if (key == 'A')
  {
    fill(random(255), random(255), random(255));
    ellipse(740, 480, 100, 100);
    eride.trigger();
  }
  if (key == 'S')
  {
    fill(random(255), random(255), random(255));
    ellipse(260, 480, 100, 100);
    ehihat.trigger();
  }
  if (key == 'D')
  {
    fill(random(255), random(255), random(255));
    ellipse(500, 500, 200, 200);
    ekick.trigger();
  }
  if (key == 'F')
  {
    fill(random(255), random(255), random(255)); 
    ellipse(300, 300, 120, 120);
    ehightom.trigger();
  }
  if (key == 'G')
  {
    fill(random(255), random(255), random(255)); 
    ellipse(700, 300, 120, 120);
    elowtom.trigger();
  }
  if (key == 'W')
  {
    fill(random(255), random(255), random(255));
    ellipse(500, 340, 60, 60);
    esnare.trigger();
  }
}
