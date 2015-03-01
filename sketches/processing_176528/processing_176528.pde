

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


import ddf.minim.*;

int num = 3;

Minim minim;
AudioPlayer player[] = new AudioPlayer[num];

int nowPlayNum = 0;

int rectX[] = new int[num], rectY[] = new int[num];     
int rectSize = 90;     
boolean rectOver[] = new boolean[num];
color rectColor[] = new color[num], rectHighlight;


color bgColor;
boolean music = false;
void setup() {
  size(512, 200);
  bgColor = color(102);     // background Color

  for (int i=0; i<num; i++) {
    rectX [i] = width/2 - rectSize * (i-num/2);
    rectY [i] = height/2 - rectSize/2;
    rectColor[i] = color(255);
  }

  rectHighlight = color(0);

  minim = new Minim(this);

  player[0] = minim.loadFile("circles.mp3");
  player[1] = minim.loadFile("happy.mp3");
  player[2] = minim.loadFile("love.mp3");
}

void draw() {
  update(mouseX, mouseY);
  background(bgColor);

  for (int i=0; i< num; i++) {
    if (rectOver[i]) {
      fill(rectHighlight);
    } else {
      fill(rectColor[i]);
    }
    stroke(255);
    rect(rectX[i], rectY[i], rectSize, rectSize);
  }
}

void update(int x, int y) {
  for (int i=0; i<num; i++) {
    if ( overRect(rectX[i], rectY[i], rectSize, rectSize) ) {
      rectOver[i] = true;
    } else {
      rectOver[i] = false;
    }
  }
}

void mousePressed() {
  for (int i=0; i<num; i++) {
    if (rectOver[i]) {
       // i == now Pressed Button Number
       
      if( i!= nowPlayNum){ // 1->2

        player[nowPlayNum].pause(); 
        player[nowPlayNum].rewind(); 
        nowPlayNum = i;
        player[i].play();
      }
      else{  //1->1
        //minim.stop();
        if(player[i].isPlaying()){
          player[i].pause();
          player[i].rewind();
        }
        else{
           player[i].play(); 
        }
      }
    }
  }
}


boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

