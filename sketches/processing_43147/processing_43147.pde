
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mysound;
AudioMetaData meta;


void setup()
{
  size(512, 400, P2D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("Pixies.mp3", 512);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop();                                // set it to loop
}

void draw()
{
background(#2E849D);
//  background (0);
  fill (0, 0, random(255), random(255));
  //stroke(255, 100);     
  noStroke(); 
  for (int i = 0; i <mysound.bufferSize() - 1; i += 2) {
    float l1 = mysound.left.get(i)*150;
    float r1 = mysound.right.get(i)*100;
    float l2 = mysound.left.get(i+1)*150;
    float r2 = mysound.right.get(i+1)*100;
    ellipse(i++, (height/2)-(l1+l2), l1, r1);
    ellipse(i++, 3*((height/2)-(r1+r2)), r2, l2);
   ellipse (i, (height/4), mysound.left.get(i)*random(150), mysound.left.get(i+1)*random(150));
   ellipse (i, 3*(height/4), mysound.right.get(i)*random(150), mysound.right.get(i+1)*random(150));

  }
}



void stop()
{

  mysound.close();
  minim.stop();

  super.stop();
}


