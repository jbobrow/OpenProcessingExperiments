

/* James Pullan. Interactive Appplication. Project 2. DSDN 142.*/


import ddf.minim.*;

Minim minim;
//AudioPlayer song0;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song8;
//AudioPlayer song9;
AudioPlayer song10;

int value = 0;

void setup() {
  background(255);
  size(500,500);  

  minim = new Minim(this);
  //song0 = minim.loadFile("piano.wav");
  song1 = minim.loadFile("spaceship.wav");
  song2 = minim.loadFile("burst.wav");
  song3 = minim.loadFile("neck.wav");
  song4 = minim.loadFile("chamber.wav");
  song5 = minim.loadFile("boom.wav");
  song6 = minim.loadFile("scratch.wav");
  song7 = minim.loadFile("bass.wav");
  song8 = minim.loadFile("drums.wav");
  //song9 = minim.loadFile("symbol.wav");
  song10 = minim.loadFile("lead.wav");
  
}
void draw()
{

  strokeWeight(5);
  stroke(5,5,5);
  line(mouseX,1,mouseX,500);
  strokeWeight(2.5);
  stroke(128,127,129);
  line(1,mouseY,500,mouseY);
  //test();
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
  test8();
  //test9();
  test10();
}

 
void mouseClicked() { 


  fill(255);
  rect(0,0,width,height);
}

/*void test() {
  if(song0.isPlaying() == false){
  if(mouseX < 200 && mouseX > 0) {
    if (mouseY < 200 && mouseY > 0) {
      song0.loop(0);
    }
  }
  else {
    song0.pause();}
  }
}*/
void test1() {
  if(song1.isPlaying() == false){
  if(mouseX < 50 && mouseX > 350) {
    if (mouseY < 50 && mouseY > 350) {
      song1.loop(0);
    }
  }
  else {
    song1.pause();}
  }
}
void test2() {
  if(song2.isPlaying() == false){
  if(mouseX < 250 && mouseX > 500) {
    if (mouseY < 250 && mouseY > 500) {
      song2.loop(0);
    }
  }
  else {
    song2.pause();}
  }
}
void test3() {
  if(song3.isPlaying() == false){
  if(mouseX < 30 && mouseX > 75) {
    if (mouseY < 30 && mouseY > 75) {
      song3.loop(0);
    }
  }
  else {
    song3.pause();}
  }
}
void test4() {
  if(song4.isPlaying() == false){
  if(mouseX < 100 && mouseX > 325) {
    if (mouseY < 100 && mouseY > 325) {
      song4.loop(0);
    }
  }
  else {
    song4.pause();}
  }
}
void test5() {
  if(song5.isPlaying() == false){
  if(mouseX < 375 && mouseX > 0) {
    if (mouseY < 375 && mouseY > 0) {
      song5.loop(0);
    }
  }
  else {
    song5.pause();}
  }
}
void test6() {
  if(song6.isPlaying() == false){
  if(mouseX < 400 && mouseX > 200) {
    if (mouseY < 400 && mouseY > 200) {
      song6.loop(0);
    }
  }
  else {
    song6.pause();}
  }
}
void test7() {
  if(song7.isPlaying() == false){
  if(mouseX < 500 && mouseX > 300) {
    if (mouseY < 500 && mouseY > 300) {
      song7.loop(0);
    }
  }
  else {
    song7.pause();}
  }
}
void test8() {
  if(song8.isPlaying() == false){
  if(mouseX < 500 && mouseX > 200) {
    if (mouseY < 500 && mouseY > 200) {
      song8.loop(0);
    }
  }
  else {
    song8.pause();}
  }
}

/*void test9() {
  if(song9.isPlaying() == false){
  if(mouseX < 500 && mouseX > 200) {
    if (mouseY < 500 && mouseY > 200) {
      song9.loop(0);
    }
  }
  else {
    song9.pause();}
  }

}*/
void test10() {
  if(song10.isPlaying() == false){
  if(mouseX < 500 && mouseX > 200) {
    if (mouseY < 500 && mouseY > 200) {
      song10.loop(0);
    }
  }
  else {
    song10.pause();}
  }
}

