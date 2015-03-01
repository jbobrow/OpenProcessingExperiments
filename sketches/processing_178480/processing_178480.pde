
import processing.video.*;

PImage img;

float delta = 0.5;
Movie music;

Movie player1; 
Movie player2; 
Movie player3; 
Movie player4; 
Movie player5; 
Movie player6;
Movie player7;
Movie player8;


boolean play1 = false;
boolean play2 = false;
boolean play3 = false;
boolean play4 = false;
boolean play5 = false;
boolean play6 = false;
boolean play7 = false;
boolean play8 = false;

void setup() {
  size(600, 600);
  img = loadImage("1.jpg");
  
  music = new Movie(this,"a.mp4");
  music.play();
  music.volume(0.3);
  
  player1 = new Movie(this,"1.mp4");
  player2 = new Movie(this,"2.mp4");
  player3 = new Movie(this,"3.mp4");
  player4 = new Movie(this,"4.mp4");
  player5 = new Movie(this,"5.mp4");
  player6 = new Movie(this,"6.mp4");
  player7 = new Movie(this,"7.mp4");
  player8 = new Movie(this,"8.mp4");
  
}

void draw() {
  background(255);
  scale(0.5);
  image(img, 0, 300);
  image(music, 280, 120);
  
  
  println(mouseX,mouseY);
  
}



void mousePressed() {
  
  if (mouseX>44 *delta && mouseX<257 *delta && mouseY>647 *delta && mouseY<900 *delta) {
    play1 = !play1;
    if (play1) {
      player1.play(); player1.loop();
    } else {
      player1.stop();
    }
  } else if (mouseX>270 *delta && mouseX<480 *delta && mouseY>647 *delta && mouseY<900*delta) {
    play2 = !play2;
    if (play2) {
      player2.play(); player2.loop();
    } else {
      player2.stop();
    }
  } else if (mouseX>494 *delta && mouseX<700 *delta && mouseY>647 *delta && mouseY<900*delta) {
    play3 = !play3;
    if (play3) {
      player3.play(); player3.loop();
    } else {
      player3.stop();
    }
  } else if (mouseX>715 *delta && mouseX<924 *delta && mouseY>647 *delta && mouseY<900*delta) {
    play4 = !play4;
    if (play4) {
      player4.play(); player4.loop();
    } else {
      player4.stop();
    }
  } else if (mouseX>44 *delta && mouseX<257 *delta && mouseY>917 *delta && mouseY<1163*delta) {
    play5 = !play5;
    if (play5) {
      player5.play(); player5.loop();
    } else {
      player5.stop();
    }   
  } else if (mouseX>270 *delta && mouseX<480 *delta && mouseY>917 *delta && mouseY<1163*delta) {
    play6 = !play6;
    if (play6) {
      player6.play(); player6.loop();
    } else {
      player6.stop();
    }
  } else if (mouseX>494 *delta && mouseX<700 *delta && mouseY>917 *delta && mouseY<1163*delta) {
    play7 = !play7;
    if (play7) {
      player7.play(); player7.loop();
    } else {
      player7.stop();
    }
  } else if (mouseX>715 *delta && mouseX<924 *delta && mouseY>917 *delta && mouseY<1163*delta) {
    play8 = !play8;
    if (play8) {
      player8.play(); player8.loop();
    } else {
      player8.stop();
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}

