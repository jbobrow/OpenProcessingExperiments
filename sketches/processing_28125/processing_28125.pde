
import ddf.minim.*;

Minim minim;
AudioSample bass;
AudioSample snare;
AudioSample HH;



void setup (){
  size (700, 500);
  
  minim = new Minim(this);
  bass = minim.loadSample("Cassette808_BD02.wav", 2048);
  snare = minim.loadSample("Boombox808_2.wav", 2048);
  HH = minim.loadSample("Boombox808_3.wav", 2048);
}



void draw(){
  background(255);
  
  strokeWeight(3);
  stroke(255);
  smooth();
  fill(170);
  
  //body and outer handle
  rect (100, 100, 500, 300);
  rect (200, 50, 300, 50);
  
  //inside handle
  fill(255);
  strokeWeight(1);
  rect (225, 68, 250, 30);
  
  //speakers
  fill(0);
  ellipse (230, 250, 150, 150);
  ellipse (470, 250, 150, 150);
  
  if (keyPressed) {
   
    if (key == 'h' || key == 'h') {
      
    int cols = round(width/30);
    for(int x = 1; x < cols; x ++) {
    int rows = round(random(1,20));

    for(int y = 0; y < rows; y++) {
    fill (18, 195, 224); 
    rect(x*30,y*30,20,20);
    }
    }
      
    strokeWeight(3);
    stroke(255);
    smooth();
    fill(170);
  
    //body and outer handle
    rect (100, 100, 500, 300);
    rect (200, 50, 300, 50);
  
    //inside handle
    fill(255);
    strokeWeight(1);
    rect (225, 68, 250, 30);
    
    fill (0);
    ellipse (230, 250, 175, 175);
    ellipse (470, 250, 175, 175);
    }
  
    if (key == 'k' || key == 'k') {
      
    int cols = round(width/30);
    for(int x = 1; x < cols; x ++) {
    int rows = round(random(1,20));

    for(int y = 0; y < rows; y++) {
    fill (255, 105, 18); 
    rect(x*30,y*30,20,20);
    }
    }
      
    strokeWeight(3);
    stroke(255);
    smooth();
    fill(170);
  
    //body and outer handle
    rect (100, 100, 500, 300);
    rect (200, 50, 300, 50);
  
    //inside handle
    fill(255);
    strokeWeight(1);
    rect (225, 68, 250, 30);
    
    fill (0);
    ellipse (230, 250, 175, 175);
    ellipse (470, 250, 175, 175);
    }
 

    
     if (key == 'l' || key == 'l') {
       
    int cols = round(width/30);
    for(int x = 1; x < cols; x ++) {
    int rows = round(random(1,20));

    for(int y = 0; y < rows; y++) {
    fill (255, 77, 160); 
    rect(x*30,y*30,20,20);
    }
    }
      
    strokeWeight(3);
    stroke(255);
    smooth();
    fill(170);
  
    //body and outer handle
    rect (100, 100, 500, 300);
    rect (200, 50, 300, 50);
  
    //inside handle
    fill(255);
    strokeWeight(1);
    rect (225, 68, 250, 30);
    
    fill (0);
    ellipse (230, 250, 175, 175);
    ellipse (470, 250, 175, 175);
    }
 
  }
}



  void keyPressed() {
  if ( key == 'h' ) bass.trigger();
  if ( key == 'k' ) snare.trigger();
  if ( key == 'l' ) HH.trigger();
  }
  
  void stop() {
  // always close Minim audio classes when you are done with them
  snare.close();
  minim.stop();
  
  super.stop();
  }


