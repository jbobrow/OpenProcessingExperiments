
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;
 
void setup()
{
  size(600, 200, P2D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("Cursed.mp3", 600);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop(); 


println("File Name: " + meta.fileName());
  println("Length (in milliseconds): " + meta.length());
  println("Title: " + meta.title());
  println("Author: " + meta.author());
}


void draw() {
  background(0);
  
  //two circles
  
  
  stroke (0);
  
  if (mysound.left.level() >0.2) {
  fill (248, 252, 23);
  ellipse (width/4, height/2, mysound.left.level()*1000, mysound.left.level()*1000);
 
  } else if (mysound.left.level() >0.1) {
    fill (118, 252, 23);
  ellipse (width/4, height/2, mysound.left.level()*1000, mysound.left.level()*1000);
  } else {
    fill (23, 235, 252);
    ellipse (width/4, height/2, mysound.left.level()*1000, mysound.left.level()*1000);
  }
  
  if (mysound.right.level() >0.2) {
    fill (248, 252, 23);
     ellipse (3*width/4, height/2, mysound.right.level()*1000, mysound.right.level()*1000);
  } else if (mysound.right.level() >0.1){
    fill (247, 114, 5);
     ellipse (3*width/4, height/2, mysound.right.level()*1000, mysound.right.level()*1000);
  } else {
    
    fill (252, 23, 242);
     ellipse (3*width/4, height/2, mysound.right.level()*1000, mysound.right.level()*1000);
  }
    

// waveform


for(int i = 0; i < mysound.bufferSize() - 1; i++) {
  stroke (255);
  strokeWeight (mysound.mix.get(i));
    line(300 + mysound.mix.get(i)*300, i, 300 + mysound.mix.get(i+1)*300, i+1);
   
   
  }
    

//volume control


 float currGain = map(mouseX, 0, 600, -10, 12);      // map value to mouse 
  println(currGain);
  mysound.setGain(currGain);
    
  
 
}







void stop()
{
  // always close Minim audio classes when you finish with them
  mysound.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
}
  

