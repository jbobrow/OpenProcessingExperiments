
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;



//Drum Kit

//Create squares

//Link key strokes to squares

//key strokes activate .WAV files for Drum Kit



import processing.video.*;
Movie myMovie;
Movie myMovie1;
Movie myMovie2;
Movie myMovie3;
Movie myMovie4;
Movie myMovie5;
Movie myMovie6;
Movie myMovie7;
Movie myMovie8;
Movie myMovie9;
Movie myMovie10;
Movie myMovie11;
Movie myMovie12;
Movie myMovie13;
Movie myMovie14;
Movie myMovie15;
Movie myMovie16;
Movie myMovie17;
Movie myMovie18;
Movie myMovie19;
Movie myMovie20;
Movie myMovie21;
Movie myMovie22;
Movie myMovie23;
Movie myMovie24;
Movie myMovie25;
Movie myMovie26;
Movie myMovie27;

int playList = 0;
int playList1 = 0;
int playList2 = 0;
int playList3 = 0;
int playList4 = 0;
int playList5 = 0;
int playList6 = 0;
int playList7 = 0;
int playList8 = 0;


int rectColor;


void setup() {


  minim = new Minim(this);
  player = minim.loadFile("1/1.wav");
  player1 = minim.loadFile("1/1-1.wav");
  
  size(650, 650);
  background(0, 167, 157);
  //each .wav file has to have separate myMovie(...)

  myMovie1 = new Movie(this, "1/1.wav");
  myMovie2 = new Movie(this, "1/1-1.wav");
  myMovie3 = new Movie(this, "1/1-2.wav");
  myMovie4 = new Movie(this, "2/2.wav");
  myMovie5 = new Movie(this, "2/2-1.wav");
  myMovie6 = new Movie(this, "2/2-2.wav");
  myMovie7 = new Movie(this, "3/3.wav");
  myMovie8 = new Movie(this, "3/3-1.wav");
  myMovie9 = new Movie(this, "3/3-2.wav");
  myMovie10 = new Movie(this, "4/4.wav");
  myMovie11= new Movie(this, "4/4-1.wav");
  myMovie12 = new Movie(this, "4/4-2.wav");
  myMovie13= new Movie(this, "5/5.wav");
  myMovie14 = new Movie(this, "5/5-1.wav");
  myMovie15= new Movie(this, "5/5-2.wav");
  myMovie16 = new Movie(this, "6/6.wav");
  myMovie17 = new Movie(this, "6/6-1.wav");
  myMovie18 = new Movie(this, "6/6-2.wav");
  myMovie19 = new Movie(this, "7/7.wav");
  myMovie20 = new Movie(this, "7/7-1.wav");
  myMovie21 = new Movie(this, "7/7-2.wav");
  myMovie22 = new Movie(this, "8/8.wav");
  myMovie23 = new Movie(this, "8/8-1.wav");
  myMovie24 = new Movie(this, "8/8-2.wav");
  myMovie25 = new Movie(this, "9/9.wav");
  myMovie26= new Movie(this, "9/9-1.wav");
  myMovie27 = new Movie(this, "9/9-2.wav");

  rectColor=0;
}

void keyPressed() {
  if (key == 'a') {
    if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
  }
}



void draw() {

  println(mouseX, mouseY);



  //if (!myMovie1.available()) { 
  //  myMovie1.jump(0);
  // }

  noStroke();
  fill(0);
  rect(50, 50, 150, 150, 20, 20, 20, 20);
  rect(250, 50, 150, 150, 20, 20, 20, 20);
  rect(450, 50, 150, 150, 20, 20, 20, 20);
  rect(50, 250, 150, 150, 20, 20, 20, 20);
  rect(250, 250, 150, 150, 20, 20, 20, 20);
  rect(450, 250, 150, 150, 20, 20, 20, 20);
  rect(50, 450, 150, 150, 20, 20, 20, 20);
  rect(250, 450, 150, 150, 20, 20, 20, 20);
  rect(450, 450, 150, 150, 20, 20, 20, 20);

  //Row 1
  if (mouseX > 50 && mouseX<200 && mouseY > 50 && mouseY < 200) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(50, 50, 150, 150, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }


  if (mouseX > 50 && mouseX<200 && mouseY > 250 && mouseY < 400) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(50, 250, 150, 350, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }

  if (mouseX > 50 && mouseX<200 && mouseY > 450 && mouseY < 600) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(50, 450, 150, 600, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }
  //Row 2
  if (mouseX > 250 && mouseX<400 && mouseY > 50 && mouseY < 200) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
       rect(250, 50, 350, 150, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }


  if (mouseX > 250 && mouseX<400 && mouseY > 250 && mouseY < 400) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(250, 250, 350, 350, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }

  if (mouseX > 250 && mouseX<400 && mouseY > 450 && mouseY < 600) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(250, 450, 350, 550, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }
  //Row 3
  if (mouseX > 450 && mouseX<600 && mouseY > 50 && mouseY < 200) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(450, 50, 550, 200, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }

  if (mouseX > 450 && mouseX<600 && mouseY > 250 && mouseY < 400) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(450, 250, 550, 350, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
  }

  if (mouseX > 450 && mouseX<600 && mouseY > 450 && mouseY < 600) {
    if (mousePressed) {
      rectColor = 255;
      fill(rectColor); 
      rect(450, 450, 550, 550, 20, 20, 20, 20);
      if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
    } else {
      rectColor = 0;
    }
    

  }  

  //println(mouseX, mouseY);

  //This secton will tell the button which playlist it is using depending
  //on how many clicks



  //This section tells the button that when key is pressed play (playlist depending on 
  //what the playlist number is


  if (keyPressed) { 


    //key a
    if (key == 'a') {
      if (playList == 1) {
        if (!player1.isPlaying()) {
      player1.rewind();
      player1.play();
        }  
      }
      }
      if (playList == 2) {
        myMovie2.play();
      }
      if (playList == 3) {
        myMovie3.play();
      }
    }
//
//    //key s
//    if (key == 's') {
//      if (playList1 == 1) {
//        myMovie4.play();
//      }
//      if (playList1 == 2) {
//        myMovie5.play();
//      }
//      if (playList1 == 3) {
//        myMovie6.play();
//      }
//    }
//
//    //key d
//    if (key == 'd') {
//      if (playList2 == 1) {
//        myMovie7.play();
//      }
//      if (playList2 == 2) {
//        myMovie8.play();
//      }
//      if (playList2 == 3) {
//        myMovie9.play();
//      }
//    }
//
//    //key f
//    if (key == 'f') {
//      if (playList3 == 1) {
//        myMovie10.play();
//      }
//      if (playList3 == 2) {
//        myMovie11.play();
//      }
//      if (playList3 == 3) {
//        myMovie12.play();
//      }
//    }
//    //key g
//    if (key == 'g') {
//      if (playList4 == 1) {
//        myMovie13.play();
//      }
//      if (playList4 == 2) {
//        myMovie14.play();
//      }
//      if (playList4 == 3) {
//        myMovie15.play();
//      }
//    }
//    //key z
//    //key z
//    if (key == 'z') {
//      if (playList5 == 1) {
//        myMovie16.play();
//      }
//      if (playList5 == 2) {
//        myMovie17.play();
//      }
//      if (playList5 == 3) {
//        myMovie18.play();
//      }
//    }
//    //key x
//    if (key == 'x') {
//      if (playList6 == 1) {
//        myMovie19.play();
//      }
//      if (playList6 == 2) {
//        myMovie20.play();
//      }
//      if (playList6 == 3) {
//        myMovie21.play();
//      }
//    }
//    //key c
//    if (key == 'c') {
//      if (playList7 == 1) {
//        myMovie22.play();
//      }
//      if (playList7 == 2) {
//        myMovie23.play();
//      }
//      if (playList7 == 3) {
//        myMovie24.play();
//      }
//    }
//    //key v
//    if (key == 'v') {
//      if (playList8 == 1) {
//        myMovie25.play();
//      }
//      if (playList8 == 2) {
//        myMovie26.play();
//      }
//      if (playList8 == 3) {
//        myMovie27.play();
//      }
//    }
//  }
//}
//  image(myMovie, 0, 0);
//
//void movieEvent(Movie m) {
//  m.read();


//
//void mousePressed() {
//  println(playList);
//  if (mouseX > 50 && mouseX<200 && mouseY > 50 && mouseY < 200) {
//    if (mousePressed) {
//      playList = playList + 1;
//      //      if (playList == 1) {
//      //        playList = 1;
//      //      }
//      //      if (playList == 2) {
//      //        playList = 2;
//      //        if (playList == 3) {
//      //          playList = 3;
//      //          if (playList == 4) {
//      //            playList = 1;
//      //          }
//      //        }
//      //      }
//    }
//  }
//} 


}



