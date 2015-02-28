
PImage brush;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer music;

void setup() {
  size(640, 640, P3D);
  smooth();

  minim = new Minim(this);  
  music = minim.loadFile("music.mp3", 2048);
  music.loop();

  brush=loadImage("test.jpg");
}

void draw() { 
  for (int i = 0; i < music.left.size()-1; i++)
  {  
    beginShape();
    texture(brush);
    vertex(width/2, height/2, music.left.get(i)*1000, music.right.get(i)*1000+300);
    vertex(0, width, music.right.get(i)*1000, mouseX+500) ;
    vertex(width, height, mouseX, mouseY+ music.right.get(i));
    vertex(width, 0, mouseX, music.left.get(i)+500);
  }
  endShape();

  for (int i = 0; i < music.left.size()-1; i++)
  {  
    beginShape();
    noStroke();
    texture(brush);
    vertex(width/2, height/2, music.left.get(i)*1000, music.right.get(i)*1000+300);
    vertex(0, height, music.right.get(i)*1000, mouseX+500);
    vertex(0, 0, mouseX, mouseY+ music.right.get(i));
    vertex(width, 0, mouseX, music.left.get(i)+500);
  }
  endShape();
}


void stop()
{

  music.close();
  minim.stop();

  super.stop();
}


