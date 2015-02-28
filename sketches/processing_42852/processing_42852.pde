
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;
 
void setup()
{
  size(700, 700, P3D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("Indian Poker [Part 3].mp3", 512);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop();                                // set it to loop
  
  println("File Name: " + meta.fileName());
  println("Length (in milliseconds): " + meta.length());
  println("Title: " + meta.title());
  println("Author: " + meta.author());
  
  
}
 
void draw()
{
  background(0);
  stroke(255, 38, 207, 85);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
  {

    stroke (255, 38, 207);
    translate (-50, 600);
    rotate (10);
    line(i, mouseX+ mysound.left.get(i)*250, i+1, 50 + mysound.left.get(i+1)*150);
    stroke (118, 57, 194);
    rotate (20);
    line(i, mouseY + mysound.right.get(i)*250, i+1, 150 + mysound.right.get(i+1)*150);
    

  }
}
 
 // this function gets called when you close out of your app
void stop()
{
  // always close Minim audio classes when you finish with them
  mysound.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
  
    }
   
  
  
   

  

  

