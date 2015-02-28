
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
  AudioPlayer song7;
  AudioPlayer song8;
  AudioPlayer song9;
  AudioPlayer song10;

void setup(){
  size(500,500);
  background(255);
  minim = new Minim(this);
  song1 = minim.loadFile("1.wav");
  song2 = minim.loadFile("2.wav");
  song3 = minim.loadFile("3.wav");
  song4 = minim.loadFile("4.wav");
  song5 = minim.loadFile("5.wav");
  song6 = minim.loadFile("6.wav");
  song7 = minim.loadFile("7.wav");
  song8 = minim.loadFile("8.wav");
  song9 = minim.loadFile("9.wav");
  song10 = minim.loadFile("10.wav");
}
void draw(){
}
void mouseDragged(){
  background(255);
  smooth();
  stroke(0);
  strokeWeight(0.2);
  int x1,x2;
  int m1=mouseX;
  int m2=mouseY;
  for(x1=0; x1<=500; x1=x1+5){
      line(x1,0,m1,m2);
    }
  for(x2=0; x2<=500; x2=x2+5){
      line(m1,m2,x2,500);
    }
    //song.play();
}

void mouseClicked(){
  background(255);
  smooth();
  stroke(50);
  strokeWeight(0.2);
  int x3,x4;
  int m3=mouseX;
  int m4=mouseY;
  for(x3=0; x3<=500; x3=x3+5){
      line(x3,0,m3,m4);
    }
  for(x4=0; x4<=500; x4=x4+5){
      line(m3,m4,x4,500);
    }
    if (m3<=100){
      song1.play();
    }
}
void mouseReleased(){
  background(255);
  smooth();
  stroke(0);
  strokeWeight(0.2);
  int x1,x2;
  int m1=mouseX;
  int m2=mouseY;
  for(x1=0; x1<=500; x1=x1+5){
      line(x1,0,m1,m2);
    }
  for(x2=0; x2<=500; x2=x2+5){
      line(m1,m2,x2,500);
    }
}
void stop()
{
    song1.close();
    song2.close();
    song3.close();
    song4.close();
    song5.close();
    song6.close();
    song7.close();
    song8.close();
    song9.close();
    song10.close();
    minim.stop();
    super.stop();
}
  
void keyPressed()
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

