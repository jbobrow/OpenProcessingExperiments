
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;
AudioPlayer track;                                  //for the mp3...

PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12;           //declare image
float amp, amp2;                                //amp2 for louder sounds

////////////////////////////////////////SETUP////////////////////////////////////////

void setup()
{
 size(800,800);
minim = new Minim(this);
track = minim.loadFile("misinevetzenevel.mp3", 2048);        //load mp3 file
  track.loop();
  // track.setGain(26);                                    //volume
//input = minim.getLineIn(Minim.MONO,400);               //for microphone input....
amp2 = 0;  
img = loadImage("misinevet1bolcsi_blur.jpg");                      //load image into program...
img2 = loadImage("misinevet1bolcsi.jpg");
img3 = loadImage("misinevet2becs_blur.jpg"); 
img4 = loadImage("misinevet2becs.jpg"); 
img5 =loadImage("misinevet3karacsony_blur.jpg"); 
img6 = loadImage("misinevet3karacsony.jpg");
img7 = loadImage("misinevet4furdes_blur.jpg"); 
img8 = loadImage("misinevet4furdes.jpg"); 
img9 = loadImage("misinevet5gabor_blur.jpg");
img10 = loadImage("misinevet5gabor.jpg"); 
img11 = loadImage("misinevet6_blur.jpg"); 
img12 = loadImage("misinevet6.jpg"); 
}

////////////////////////////////////////DRAW////////////////////////////////////////

void draw()
{
  background(0);
  amp = abs(track.left.get(1));                      //abs = absolute value, always positive
  if(amp2 > amp)
  {
   amp2 = amp;
  }
  amp2*=.98;                                        //amp2 constantly seeking 0 after lLOUD sounds
  
float rad = amp*200;                          //10 = starts at 10 radius and increaes from there
float rad2 = amp2*100+40;
/////////////////////////////////////////1stIMAGE/////////////////////////////////////////
tint(255-rad2,255-rad2,255-rad2);
image(img2,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img,0,0);                                //blurred
float sec = millis() / 1000.0;
/////////////////////////////////////////2ndIMAGE/////////////////////////////////////////
if(sec > 11.6)
{
tint(255-rad2,255-rad2,255-rad2);
image(img4,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img3,0,0);                                 //Blurry
}
/////////////////////////////////////////3rdIMAGE/////////////////////////////////////////
if(sec > 27.1)
{
tint(255-rad2,255-rad2,255-rad2);
image(img6,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img5,0,0);                                 //Blurry
}
/////////////////////////////////////////4thIMAGE/////////////////////////////////////////
if(sec > 32.6)
{
tint(255-rad2,255-rad2,255-rad2);
image(img8,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img7,0,0);                                 //Blurry
}
/////////////////////////////////////////5thIMAGE/////////////////////////////////////////
if(sec > 41.0)
{
tint(255-rad2,255-rad2,255-rad2);
image(img10,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img9,0,0);                                 //Blurry
}
/////////////////////////////////////////6thIMAGE/////////////////////////////////////////
if(sec > 50.0)
{
tint(255-rad2,255-rad2,255-rad2);
image(img12,0,0);                                //Sharp
tint(255-rad,255-rad);
image(img11,0,0);                                 //Blurry
}





//float r = amp*255;

////////////////////////////////////////REST////////////////////////////////////////  
    
}

void stop()
{
                                            // always close Minim audio classes when you are done with them
  track.close();
  minim.stop();
  super.stop();
}

