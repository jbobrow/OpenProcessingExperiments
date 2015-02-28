
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

void setup() {
  size(600,600, P2D);
  minim = new Minim(this);
  mysound = minim.loadFile("02 Ruby Blue.mp3", 600);
  meta = mysound.getMetaData();
  mysound.loop();

  println("File Name: " + meta.fileName());
  println("Length (in milliseconds): " + meta.length());
  println("Title: " + meta.title());
  println("Author: " + meta.author());
}

void draw() {
  background(9, 65, 89);
  noFill();

  for(int i = 0; i < mysound.bufferSize() -1; i++) {
    ellipse(300, 300, 50 + mysound.left.get(i)*50, 50 + mysound.left.get(i+1)*50);
    ellipse(300, 300, 200 + mysound.right.get(i)*200, 200 + mysound.right.get(i+1)*200);

    if(i < 200) {
      stroke(64, 0, 5);
    } else if(i > 200 && i < 300) {
      stroke(140, 0, 23);
    } else if(i > 300 && i < 400) {
      stroke(191, 4, 19);
    } else if(i > 400 && i < 500) {
      stroke(229, 149, 163);
    } else if(i > 500) {
      stroke(229, 195, 201);
    }
  }
}

void stop() {
  mysound.close();
  minim.stop();
  super.stop();
}

