
import ddf.minim.*;
import JMyron.*;

JMyron theMov;
int[] currFrame;
int[] prevFrame;
int[] storFrame;
int tolerance = 0 ; 
int count =0 ;
int maxNum = 76800;
int cc=0;
Minim minim;
AudioPlayer s1;
AudioPlayer s2;
AudioPlayer s3;
AudioPlayer s4;
AudioPlayer s5;
AudioPlayer s6;
AudioPlayer s7;

void setup() {
  println("   Sammi Yin  ");
  size(320, 240);
  minim = new Minim(this);

  s1 = minim.loadFile("1.mp3");
  s2 = minim.loadFile("2.wav");
  s3 = minim.loadFile("3.mp3");
  s4 = minim.loadFile("4.wav");
  s5 = minim.loadFile("5.wav");
  s6 = minim.loadFile("6.aiff");
  s7 = minim.loadFile("1.mp3");
  theMov = new JMyron();
  theMov.start(width, height);
 // theMov.findGlobs(0);

  // initialize the pixel arrays to avoid a NullPointerException
  loadPixels();
  currFrame = prevFrame = pixels;
  tolerance = 40;  
}

void draw() {

  theMov.update();
  // save the last frame before updating it
  currFrame  = theMov.image();
  // draw each pixel to the screen only if its change factor is 
  // higher than the tolerance value
  loadPixels();
  
    for (int x = 0; x < width; x ++ )
    {
    for (int y = 0; y <height; y ++ ) 
    {
      int loc = x + y*width; 
      color fgColor = currFrame[loc]; 
      color bgColor = prevFrame[loc];
      
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      if (diff > tolerance) {
        color c =color((r1+r2)/2,(g1+g2)/2,(b1+b2)/2);
        pixels[loc] = c;
        count++;
      } else {
        pixels[loc] = prevFrame[loc];
      }
  
    }
    }
  if ( count > 0 && count <= 2000)
  {
  println (" 1 Come!!!");
  s1.play(0);
  } 
    if ( count >= 2000 && count <= 3000)
  {
  println (" 2 Come Closer!");
  s2.play(0);
  }
    else if (count > 3000 && count <= maxNum/16)
  {
  println (" 3 Closer!! ");
  s3.play(0);
  }
  else if (count > maxNum/17 && count <= maxNum/8)
  {
   println (" 4 You are so close!"); 
   s4.play(0);
   s4.rewind();
   for (int x = 0; x < width; x ++ )
    {
    for (int y = 0; y <height; y ++ ) 
    {
      int loc = x + y*width; 
      color bgColor = prevFrame[loc];
        pixels[loc] = prevFrame[loc];
    }
    }
  }
  
  else if (count > maxNum/7.5 && count <= maxNum/4)
  {
   println (" 5 "); 
   s5.play(0);
  
  }
   else if (count > maxNum/3.7 && count <= maxNum/2)
  {
   println (" 6 "); 
   s6.play(0);
   
  }
  else if  (count > maxNum/1.8 )
  {
   println (" 7 "); 
   s7.play(0);
   prevFrame = theMov.image();
  
  }

  
  updatePixels();
  count = 0;
}

void mousePressed() {
  prevFrame = theMov.image();
  updatePixels();
}



void stop()
{
s1.close();
s2.close();
s3.close();
s4.close();
s5.close();
s6.close();
s7.close();
minim.stop();
super.stop();
} 


