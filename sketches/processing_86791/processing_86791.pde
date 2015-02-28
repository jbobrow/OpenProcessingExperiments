
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
PFont font;
int[][] nums;
AudioSnippet[] soundbank;
//boolean array to remember if a sfx is played
boolean[] played;

void setup() {
  size(450, 450);
  smooth();

  font = loadFont("CenturyGothic-48.vlw");
  textAlign(CENTER);
  textFont(font, 32);

  nums=new int[3][3];
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      nums[i][j]=i*3+j+1;
    }
  }
  stroke(255);
  strokeWeight(3);

  //initiate the Minim class
  minim = new Minim(this);
  //initiate the AudioSnippet array
  soundbank= new AudioSnippet[9];
  played=new boolean[9];
  for (int m=0;m<9;m++) {
    soundbank[m] = minim.loadSnippet(m+1+".wav");
    played[m]=false;
  }
}

void draw() {
  background(0);
  //go through all the numbers 
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      //check if mouse is over the number 
      if (mouseX>75+j*150-25 && mouseX<75+j*150+25 && mouseY>75+i*150-25 && mouseY<75+i*150+25)
      {
        //check if the sound effect is playing
        if (!played[i*3+j] && !soundbank[i*3+j].isPlaying()) {
          //play the sound
          soundbank[i*3+j].play();
          //true means played
          played[i*3+j]=true;
        }
        fill(90, 158, 101);
      }
      else {
        if (played[i*3+j]) {
          played[i*3+j]=false;
          soundbank[i*3+j].rewind();
        }
        noFill();
      }
      ellipse(75+j*150, 75+i*150, 50, 50);
      fill(255);
      text(nums[i][j]+"", 75+j*150, 87+i*150);
    }
  }
}


