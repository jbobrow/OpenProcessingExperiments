

/* James Pullan. Interactive Appplication. Project 2. DSDN 142.*/


import ddf.minim.*;

Minim minim;
AudioPlayer song0;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;

int value = 0;

void setup() {
  background(255);
  size(500,500);  

  minim = new Minim(this);
  song0 = minim.loadFile("A.wav");
  song1 = minim.loadFile("B.wav");
  song2 = minim.loadFile("C.wav");
  song3 = minim.loadFile("D.wav");
  song4 = minim.loadFile("E.wav");
  song5 = minim.loadFile("G.wav");
 
}
void draw()
{

  
  /*New Visuals*/
  fill(255);
  strokeWeight(5);
  rect(0,0,500,500);//background
  
  fill(10,190,252);
  strokeWeight(5);
  rect(95,95,100,100);//test
  
  fill(33,150,191);
  strokeWeight(5);
  rect(135,135,100,100);//test1
  
  fill(34,121,152);
  strokeWeight(5);
  rect(175,175,100,100);//test2
  
  fill(27,93,116);
  strokeWeight(5);
  rect(215,215,100,100);//test3
  
  fill(17,67,85);
  strokeWeight(5);
  rect(255,255,100,100);//test4
 
  fill(7,38,49);
  strokeWeight(5);
  rect(295,295,100,100);//test5
  
 /* fill(55,237,150);
  strokeWeight(5);
  rect(265,265,100,100);//test6
  
  fill(100,23,209);
  strokeWeight(5);
  rect(305,305,100,100);//test7
  
  fill(0,16,180);
  strokeWeight(5);
  rect(345,345,100,100);//test8*/
 
 
   test();
   test1();
   test2();
   test3();
   test4();
   test5();
 
 
}


 
void test() { 
  if(song0.isPlaying() == false) {
  if(mouseX < 195 && mouseX > 95) {
    if(mouseY < 195 && mouseY > 95) {
      song0.loop(0); 
    }
  }
  
  else {
    song0.pause();}
  }
}
void test1() {
  if(song1.isPlaying() == false){
  if(mouseX < 235 && mouseX > 135 ) {
    if (mouseY < 235 && mouseY > 135) {
      song1.loop(0);
    }
  }
  else {
    song1.pause();}
  }
}
void test2() {
  if(song2.isPlaying() == false){
  if(mouseX < 275  && mouseX > 175) {
    if (mouseY < 275 && mouseY > 175) {
      song2.loop(0);
    }
  }
  else {
    song2.pause();}
  }
}
void test3() {
  if(song3.isPlaying() == false){
  if(mouseX < 315 && mouseX > 215) {
    if (mouseY < 315 && mouseY > 215) {
      song3.loop(0);
    }
  }
  else {
    song3.pause();}
  }
}
void test4() {
  if(song4.isPlaying() == false){
  if(mouseX < 355 && mouseX > 255) {
    if (mouseY < 355 && mouseY > 255) {
      song4.loop(0);
    }
  }
  else {
    song4.pause();}
  }
}
void test5() {
  if(song5.isPlaying() == false){
  if(mouseX < 395 && mouseX > 295) {
    if (mouseY < 395 && mouseY > 295) {
      song5.loop(0);
    }
  }
  else {
    song5.pause();}
  }
}


