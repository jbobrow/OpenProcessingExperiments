
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;
//AudioPlayer song;
AudioPlayer groove;

float r= 200;
float c= 10;
float z= 50;
float g= 250;
float b= 300;
float a= 300;

float diam = 20;
float x= 100;
float y= 100;

void setup() {
  size(512,500,P3D);
  
  minim = new Minim(this);
  
  //song = minim.loadFile("STE-012.mp3");
  //song.play();
  groove = minim.loadFile("01 - Ophelia's song.mp3");
  groove.play();
  
  /*textFont( loadFont("serif.v1w") );
  textMode(SCREEN);*/
  
  background(r);
  smooth();
  frameRate(20);
}

/*int ys = 15;
int yi = 15;*/

void draw() {

  background(0);
  
  /*int y = ys;
  text("File Name: " + meta.fileName(), 5, y);
  text("Length (in milliseconds): " + meta.length(), 5, y+=yi);
  text("Title: " + meta.title(), 5, y+=yi);
  text("Author: " + meta.author(), 5, y+=yi);
  text("Album: " + meta.album(), 5, y+=yi);
  text("Date: " + meta.date(), 5, y+=yi);
  text("Comment: " + meta.comment(), 5, y+=yi);
  text("Track: " + meta.track(), 5, y+=yi);
  text("Genre: " + meta.genre(), 5, y+=yi);
  text("Copyright: " + meta.copyright(), 5, y+=yi);
  text("Disc: " + meta.disc(), 5, y+=yi);
  text("Composer: " + meta.composer(), 5, y+=yi);
  text("Orchestra: " + meta.orchestra(), 5, y+=yi);
  text("Publisher: " + meta.publisher(), 5, y+=yi);
  text("Encoded: " + meta.enocoded(), 5, y+=yi);*/
  
  
  
  //r = random(255);
  
  if (!mousePressed) {
    stroke(0);
    fill(r,g,b,a);
    rect (mouseX+pmouseY,mouseY+pmouseX,mouseX,c);
    noFill();
    stroke(0);
    fill(r,g,b,a);
    rect (mouseX,mouseY-pmouseX,c,mouseY);
    noFill();
  } else {
      stroke(0);
      fill(r,g,b,a);
      ellipse (mouseX+pmouseY,mouseY+pmouseX,mouseX,mouseY);
      noFill();
      
  }
  
  
  for(int i = 0; i<groove.bufferSize() - 1; i++) {
    fill(r);
    ellipse(i, 50+ groove.left.get(i)*50, 50 + groove.left.get(i+1)*50, i+1);
    noFill();
    line(i, 150+ groove.right.get(i)*50, i+1, 150 + groove.right.get(i+1)*50);
  }
  
}
/*void mousePressed () {
   r = random(255);
   for(int i = 0; i<song.bufferSize() - 1; i++) {
    fill(r);
    ellipse(i, 50+ song.left.get(i)*50, 50 + song.left.get(i+1)*50, i+1);
    noFill();
    line(i, 150+ song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
    
  }
   
}*/
void mouseReleased () {
  
}
void stop() {
  groove.close();
  minim.stop();
  
  super.stop();
}

