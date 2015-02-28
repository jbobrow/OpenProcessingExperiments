
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

void setup()
{
  size(500, 200, P2D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("09 - Girl Talk - Make Me Wanna.mp3", 512);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop();                                // set it to loop
  colorMode(HSB);

  println("File Name: " + meta.fileName());
  println("Length (in milliseconds): " + meta.length());
  println("Title: " + meta.title());
  println("Author: " + meta.author());
}

void draw()
{
  
 noStroke();
  int Add = 0;
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  fill(200,10,210,10);
  rect(0, 0,width,height);

  for(int i = 0; i < mysound.bufferSize() - 1; i++)          // for every value in the buffer
  {

    float left = 0;
    left = mysound.left.get(i);
    left = map(left,-1,1,0,200);
    float right = 0;
    right = mysound.right.get(i);
    right = map(right,-1,1,0,200);
    Add++;
     stroke(100, 100, 200, 60);
    right = right+Add;

fill(100,70,300);
    ellipse(right-100,left,10,10);
    


    



    stroke(100,mysound.left.get(i)*50,100);
    //line(i, 50 + mysound.left.get(i)*50, i*Add, 50 + mysound.left.get(i+1)*50);
    // line(i, 150 + mysound.right.get(i)*50, i*Add, 150 + mysound.right.get(i+1)*50);
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


