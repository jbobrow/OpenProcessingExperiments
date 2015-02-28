
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; 
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;

PImage pg;
boolean active;
boolean rectOver = false;
float x=10;
float y=10;

void setup(){
  size(485,500);
  smooth();
  pg = loadImage("Photo26_25.jpg");
  minim = new Minim(this); 
  song1 = minim.loadFile("06 lubrication reduces friction.mp3", 2048); 
  song2 = minim.loadFile("02 kapelvej.mp3", 2048);
  song3 = minim.loadFile("03 tape in shasta.mp3", 2048);
  song4 = minim.loadFile("04 untit ed.mp3", 2048);
  song5 = minim.loadFile("08 clap you.mp3", 2048);
  song6 = minim.loadFile("Drifting.mp3", 2048);
}

void draw(){
  background(0);
  image(pg,0,0);
 x = map(mouseX, 0, 400, 2, 100);
  for(int i = 0; i < 23; i++){
    for(int j = 0; j < 22; j++){
      stroke(23 + i*20, mouseX, mouseY);
      noFill();
      {
        rect(10 + i*20,30 + 20*j,20,20); 
      }
    }
    if(mouseX<=50 && mouseY<=100){
      song5.play();
      song1.pause();
      song2.pause();
      song3.pause();
      song4.pause();
    }
    if (mouseX<=100 && mouseY>200){
      song3.play();
      song1.pause();
      song5.pause();
      song2.pause();
      song4.pause();
    }
    if (mouseX>=300 && mouseY <100){
      song4.play();
      song1.pause();
      song5.pause();
      song2.pause();
      song3.pause();

    }
    if (mouseX<=300 && mouseX>=200 && mouseY>=100 && mouseY <=200){
      song2.play();
      song1.pause();
      song5.pause();
      song4.pause();
      song3.pause();

    }
    if (mouseX>=100 && mouseY >400){
      song1.play();
      song2.pause();
      song5.pause();
      song4.pause();
      song3.pause();

    }
     if (mousePressed){
      song6.play();
      song2.pause();
      song5.pause();
      song4.pause();
      song3.pause();

    }
  }
}
boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

void stop()
{
 song1.close();
song2.close();
      song3.close();
      song4.close();
      song5.close(); 
  minim.stop(); 
 
  super.stop(); 
} 


