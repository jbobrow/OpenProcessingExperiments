
/* MP3 Player for Three Rock Dove Songs
by Hank May
CMSC 117
May 17, 2010 */

import ddf.minim.*;
Minim minim;
AudioPlayer[] song;
AudioOutput out;
AudioInput input; 

float a = 0.0;
float b = -188.0;
float c = -188.0;
float d = -188.0;
float e = -188.0;
float f = -188.0;
float g = -203.0;
float h = -253.0;
float i = -81.0;
float j = -371.0;
float rSize; 
PImage bg, sign, c1, c2, c3, c4, c5, p, cl1, cl2, cl3, cl4, stop;
int s = 2;

void setup(){
  size(1061, 500, P3D);

  textFont(loadFont("TimesNewRomanPSMT-48.vlw"));
  minim = new Minim(this); 
  input = minim.getLineIn(); 
  out = minim.getLineOut(); 
  song = new AudioPlayer[3];
  song[0] = minim.loadFile("walker.mp3");
  song[1] = minim.loadFile("steedtrap.mp3");
  song[2] = minim.loadFile("cityboy.mp3");


  rSize = width/13;
  smooth();
  bg = loadImage("vermont.png");
  sign = loadImage("sign.png");
  c1 = loadImage("car1.png");
  c2 = loadImage("car2.png");
  c3 = loadImage("car3.png");
  c4 = loadImage("car4.png");
  c5 = loadImage("car5.png");
  p = loadImage("play.png");
  stop = loadImage("stop.png");
  cl1 = loadImage("cloud1.png");
  cl2 = loadImage("cloud2.png");
  cl3 = loadImage("cloud3.png");
  cl4 = loadImage("cloud4.png");

}

void draw(){
  background(bg);
  image(p, 0, 0);       //pause button
  image(stop, 1005, 0); //stop button

  if(song[0].isPlaying()){ //text to clarify which song is playing
    fill(0);
    text("walker", 180, 320);
  }
  if(song[1].isPlaying()){
    fill(0);
    text("speed trap", 410, 480);
  }
  if(song[2].isPlaying()){
    fill(0);
    text("city boy", 765, 480);
  } 

  a += 0.005;        //spinning sign
  if(a > TWO_PI) { 
    a = 0.0; 
  }

  translate(87, 255);

  rotateY(a*8.0);
  image(sign, -rSize, -rSize, rSize*2, rSize*2);

  camera();  //back to 2d
  
  image(cl1, g, 100); //clouds
  g = g + .6;
  if (g>width){
    g = -203.0;
  }
  image(cl2, h, 100);
  h = h + 0.4;
  if (h>width){
    h = -253.0;
  }
  image(cl3, i, 50);
  i = i + .2;
  if (i>width){
    i = -81.0;
  }
  image(cl4, j, 20);
  j = j + .8;
  if (j>width){
    j = -371.0;
  }

  image(c1, b, height-64);  //cars
  b = b + 20;
  if(b> width){
    b = -188.0;
  }
  image(c2, c, height-64);
  c = c + 30;
  if(c> width){
    c = -188.0;
  }
  image(c3, d, height-64);
  d = d + 25;
  if(d> width){
    d = -188.0;
  }
  image(c4, e, height-64);
  e = e + 9;
  if(e> width){
    e = -188.0;
  }
  image(c5, f, height-64);
  f = f + 15;
  if(f> width){
    f = -188.0;
  }
}

void mousePressed(){

  println(mouseEvent);

  if(mouseX>0 && mouseX<71 && mouseY>0 && mouseY<53) //pause button. (to resume, click the building again.)
    if(song[0].isPlaying()){
      song[0].pause();
    }
    else if(song[1].isPlaying()){
      song[1].pause();
    }
    else if(song[2].isPlaying()){
      song[2].pause();
    }

  if(mouseX>1005 && mouseX<width && mouseY>0 && mouseY<59) //stop button
    if(song[0].isPlaying()){
      song[0].pause();
      song[0].rewind();
    }
    else if(song[1].isPlaying()){
      song[1].pause();
      song[1].rewind();
    }
    else if(song[2].isPlaying()){
      song[2].pause();
      song[2].rewind();
    }



  if(mouseX>0 && mouseX<325 && mouseY>180 && mouseY<height){ //buildings as buttons
    song[0].play();
    song[1].pause();
    song[1].rewind();
    song[2].pause();
    song[2].rewind();
  }
  if(mouseX>340 && mouseX<675 && mouseY>325 && mouseY<height){
    song[1].play();
    song[0].pause();
    song[0].rewind();
    song[2].pause();
    song[2].rewind(); 
  }

  if(mouseX>690 && mouseX<width && mouseY>330 && mouseY<height){
    song[2].play();
    song[0].pause();
    song[0].rewind();
    song[1].pause();
    song[1].rewind();
  }

}

void stop() { 
  input.close(); 
  song[s].close();
  out.close();
  minim.stop(); 
  super.stop(); 
} 




