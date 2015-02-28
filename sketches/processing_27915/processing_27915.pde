

/* James Pullan. Interactive Appplication. Project 2. DSDN 142.*/


import ddf.minim.*;

Minim minim;
AudioPlayer song0;
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
  //song5 = minim.loadFile("F.wav");
  song6 = minim.loadFile("G.wav");

  
}
void draw()
{

  strokeWeight(5);
  stroke(5,5,5);
  line(mouseX,1,mouseX,500);
  strokeWeight(2.5);
  stroke(128,127,129);
  line(1,mouseY,500,mouseY);
  test();
  test1();
  test2();
  test3();
  test4();
  //test5();
  test6();
  
   fill(255);
  strokeWeight(10);
  rect(0,0,500,500);
  fill(119,240,125);
  strokeWeight(5);
  rect(50,450,75,350);
  fill(23,214,250);
  strokeWeight(10);
  rect(250,390,250,390);
  fill(195,86,242);
  strokeWeight(7.5);
  rect(75,300,250,500);
  fill(170,22,17);
  strokeWeight(15);
  rect(100,150,250,300);
  fill(254,255,52);
  strokeWeight(10);
  rect(300,75,150,400);
  fill(255,164,52);
  strokeWeight(12.5);
  rect(400,200,400,200);
  fill(55,237,150);
  strokeWeight(20);
  rect(350,50,210,450);
  fill(100,23,209);
  strokeWeight(15);
  rect(20,225,475,200);
  fill(0,16,180);
  strokeWeight(17.5);
  rect(335,400,220,280);


}

 
void mouseClicked() { 


  fill(255);
  rect(0,0,width,height);
}

void test() {
  if(song0.isPlaying() == false){
  if(mouseX < 50 && mouseX > 75) {
    if (mouseY < 350 && mouseY > 450) {
      song0.loop(0);
    }
  }
  else {
    song0.pause();}
  }
}
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



