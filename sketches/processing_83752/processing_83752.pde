
//Project 2
//Kevin Hyun
//khyun@andrew.cmu.edu
//copyright © Kevin Hyun December 2012 Pittsburgh PA 15213 All Rights Reserved
//Music is from Red Hot Chili Peppers and Passion Pit

//Use keys q,w,e,a,s,d and i,o,p,j,k,l to play the drums.
//Keys 1 and 2 turn on music for you to match a drum beat to.
//Have fun!

import ddf.minim.*;

Minim minim;
//AudioPlayer a1;
AudioPlayer aa2; //songs
//drum sounds
AudioSample sound1;
AudioSample sound2;
AudioSample sound3;
AudioSample sound4;
AudioSample sound5;
AudioSample sound6;
AudioSample sound7;
AudioSample sound8;
AudioSample sound9;
AudioSample sound10;
AudioSample sound11;
AudioSample sound12;

boolean p, p1;

void setup()
{
  size(500, 700, P3D);
  minim = new Minim(this);

  // load BD.wav from the data folder
//  a1 = minim.loadFile("01a.mp3", 2048);
  aa2 = minim.loadFile("02a.mp3", 2048);

  sound1 = minim.loadSample( "1.wav", 512);
  sound2 = minim.loadSample("2.wav", 512);
  sound3 = minim.loadSample("3.aif", 512);
  sound4 = minim.loadSample("4.wav", 512);
  sound5 = minim.loadSample("5.wav", 512);
  sound6 = minim.loadSample("6.wav", 512);
  sound7 = minim.loadSample("7.wav", 512);
  sound8 = minim.loadSample("8.wav", 512);
  sound9 = minim.loadSample("9.wav", 512);
  sound10 = minim.loadSample("10.wav", 512);
  sound11 = minim.loadSample("11.aif", 512);
  sound12 = minim.loadSample("12.aif", 512);
}

void draw()
{
  background(0);
  stroke(255);
  //  init();
  drawEQ();
}

//void init()
//{
//  background(0);
//  stroke(255);
//}

void drawEQ()
{
  for (int i = 0; i < sound1.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, sound1.bufferSize(), 0, width);
    float x2 = map(i+1, 0, sound1.bufferSize(), 0, width);
//    line(x1, 50 - a1.mix.get(i)*50, x2, 50 - a1.mix.get(i+1)*50);
    line(x1, 50 - aa2.mix.get(i)*50, x2, 50 - aa2.mix.get(i+1)*50);
    line(x1, 100 - sound1.mix.get(i)*50, x2, 100 - sound1.mix.get(i+1)*50);
    line(x1, 150 - sound2.mix.get(i)*50, x2, 150 - sound2.mix.get(i+1)*50);
    line(x1, 200 - sound3.mix.get(i)*50, x2, 200 - sound3.mix.get(i+1)*50);
    line(x1, 250 - sound4.mix.get(i)*50, x2, 250 - sound4.mix.get(i+1)*50);
    line(x1, 300 - sound5.mix.get(i)*50, x2, 300 - sound5.mix.get(i+1)*50);
    line(x1, 350 - sound6.mix.get(i)*50, x2, 350 - sound6.mix.get(i+1)*50);
    line(x1, 400 - sound7.mix.get(i)*50, x2, 400 - sound7.mix.get(i+1)*50);
    line(x1, 450 - sound8.mix.get(i)*50, x2, 450 - sound8.mix.get(i+1)*50);
    line(x1, 500 - sound9.mix.get(i)*50, x2, 500 - sound9.mix.get(i+1)*50);
    line(x1, 550 - sound10.mix.get(i)*50, x2, 550 - sound10.mix.get(i+1)*50);
    line(x1, 600 - sound11.mix.get(i)*50, x2, 600 - sound11.mix.get(i+1)*50);
    line(x1, 650 - sound12.mix.get(i)*50, x2, 650 - sound12.mix.get(i+1)*50);
  }
}


void keyPressed()
{
  if ( key == 'q' ) sound1.trigger();
  if ( key == 'w' ) sound2.trigger();
  if ( key == 'e' ) sound3. trigger();
  if ( key == 'a' ) sound4. trigger();
  if ( key == 's' ) sound5. trigger();
  if ( key == 'd' ) sound6. trigger();
  if ( key == 'i' ) sound7. trigger();
  if ( key == 'o' ) sound8. trigger();
  if ( key == 'p' ) sound9. trigger();
  if ( key == 'l' ) sound10. trigger();
  if ( key == 'k' ) sound11. trigger();
  if ( key == 'j' ) sound12. trigger();

  //songs
//  if (key == '1' ) 
//  {
//    a1.play();
//    aa2.pause();
//    aa2.rewind();
//  }  
  
 
  if (key == '2' ) 
  {
    aa2.play();
//    a1.pause();
//    a1.rewind();
  }
  
}


void stop()
{
  // always close Minim audio classes when you are done with them
  sound1.close();
  sound2.close();
  sound3.close();
  sound4.close();
  sound5.close();
  sound6.close();
  sound7.close();
  sound8.close();
  sound9.close();
  sound10.close();
  sound11.close();
  sound12.close();
//  a1.close();
  aa2.close();


  minim.stop();

  super.stop();
}


