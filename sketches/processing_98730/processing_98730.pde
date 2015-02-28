
//Sketch used to play music files using audio player
//Using the teachers example and what we learnt in class
//I made the music play/colours change via mouse position
//Changes to different sounds based on location of mouse

import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

void setup()
{

//uses Minim to load files from data directory   
  
  minim = new Minim(this); 

//bellow are files from data
//sounds vary (e.g: dog barking, birds chirping, bells, beat)
 
  player = minim.loadFile("184870__keweldog__bird-chirps5.wav");
  player1 = minim.loadFile("74495__robinhood76__01082-ratter-dogs-barking.wav");
  player2 = minim.loadFile("45047__daveincamas__sleighbells3.wav");
  player3 = minim.loadFile("35122__zin__hip-hop-beat-1-95.wav");

//plays the files

  player.play();
  player1.play();
  player2.play();
  player3.play();

//dimensions of sketch
  
  size(100,400);
  background(225, 225, 255);
  smooth();
  
}

void draw()
{
  background(255);
  
//player0. Square one. Mouse positions are defined. 
//Rectangles are called and drawn based on mouse position
//Fill is called based on mouse position
//music is called based on mouse position

  if((mouseY<100 && mouseY>0) && (mouseX<100 && mouseX>0))
  { 
     rect(0,0,100,100);
     fill(191,85,85);
     if(!player.isPlaying()){
      player.play();
    }
  } else{
   fill(232,210,106); 
   player.pause();
  }
  
//player1

  if((mouseY<200 && mouseY>100) && (mouseX<100 && mouseX>0))
  { 
     rect(0,100,100,100);
     fill(234,32,53);
     if(!player1.isPlaying()){
      player1.play();
    }
  } else{
   fill(186,232,106); 
   player1.pause();
  }

//player2

  if((mouseY<300 && mouseY>200) && (mouseX<100 && mouseX>0))
  { 
     rect(00,200,100,100);
     fill(0);
     if(!player2.isPlaying()){
      player2.play();
    }
  } else{
   fill(148,196,224); 
   player2.pause();
  }
  
//player3

    if((mouseY<400 && mouseY>300) && (mouseX<100 && mouseX>0))
  { 
     rect(00,300,100,100);
     fill(0);
     if(!player3.isPlaying()){
      player3.play();
    }
  } else{
   fill(191,85,85); 
   player3.pause();
  }
}

  


