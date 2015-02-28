
import processing.video.*;

Capture cam;
PImage img;

import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.video.*;



Minim minim;
AudioInput player;
FFT fft;
float pitch;
float highestAmp = 0, freq, frequency;
float amplitude;




void setup() {
  size(1024, 768, P2D);
  smooth();
  frameRate(30);
 
 //////// CAM 01
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();   
   
  }  

  
////////// MINIM

  minim = new Minim(this);
  
  minim.debugOn();
  player = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(player.bufferSize(), player.sampleRate()); 
  
  ////// Text Revelation

  img = loadImage("lettering.png");
  
  
} // END SETUP

void draw() {


/////////CAM  
  
  if (cam.available() == true) {
    cam.read();
  }
  
  image(cam, 0, 0);
  tint(255, 126);  // Apply transparency without changing color
  image(cam, 50, 0);
  
///////////// MINIM AUDIO
  
  stroke(255);
  //line(0,100,width,100);
  float r = random(10);
  float t = random(700);
  
  int count = 0;
  int lowTot = 0;
  int medTot = 0;
  int hiiTot = 0;
  for (int i = 0; i < player.left.size()/3.0; i+=5){
    lowTot+= (abs(player.left.get(i)) * 50 );
    count++;
  }
  fill( map( lowTot, 0, count * 50, 0, 255 ), 0, 0);
  noStroke();
  rect(0,0,20,20);
  stroke(255);
  
  
  for (int i = 0; i < player.left.size()-1; i+=5)
  {
//    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
//    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
     
      
      
      strokeWeight(5);
      point( 2*i, 400 + player.left.get(i)*50 );
  
  
      strokeWeight(player.left.get(i)*50);
      point( 2*i, player.left.get(i)*100 + player.left.get(i)*50 );
      
     // println(player.left.get(i)*50);
   
////HANDLER FOR SOUD PEAK DETECTION      
      
      if (player.left.get(i)*50 > 5.8986206) {
      
        
      image(img, player.left.get(i), 0);
      //tint(100, 126);  // Apply transparency without changing color
      image(img, player.left.get(i)*random(100), 0);
      filter(INVERT);
      
     }
  }
    
   
}///end Draw



void stop()
{
  player.close();
  minim.stop(); 
  super.stop();
}



