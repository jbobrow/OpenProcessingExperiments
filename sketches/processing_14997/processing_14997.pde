
//Moving on from user interaction in my first sketchs this one 
//is all down to the sound. An easing staement controls the X Y 
//using the bass frequencies and some higher up frequencies 
//control the hue and refesh the screen. Also quiet a few 'if' 
//statements are used to keep everything in order hence all the 
//equations are self tuning.

//If you would like to see the constants press 'n' for the notes.

//Also by all means copy the code into processing and see what it 
//draws with some of your favourite tunes by copying a file into 
//the data folder and renaming the loadFile line.

//Enjoy 
//DYSbomb 


import ddf.minim.analysis.*;         //import some minim classes
import ddf.minim.*;

Minim minim;
AudioPlayer track;
FFT fft;
float as=1; //aspect ratio skew value
 
  float a;                     //the X coordinate
  float b;                 //the Y coordinate
  float targetA, targetB;  //used in the easing process
  float easing = 0.08;         //easing coefficient
  float dia;                   //diameter float
  int h;                       //current hue
  
  int amp=40;                  //start amplitude b
  int aamp=40;                 //start amplitude a
  int lineamp=8;               //start amplitude for lines 
  int diaamp=40;               //start amplitude for diameters 
   float band=1;
   PFont f;
  
void setup()
{
  size(800,480, P2D);
  noCursor();
  minim = new Minim(this);
  background(0);
  track = minim.loadFile("Squarepusher - Welcome To Europe - 02 - Hanningfield Window.mp3",128);
  track.loop();
  fft = new FFT(track.bufferSize(), track.sampleRate());
  f = loadFont("Tahoma-18.vlw");
  textFont(f);
  frameRate(25);
  key='q';
}

void draw()
{
//if (keyPressed==true){
//
//if (key=='q')  {band=band-0.1;}
//if (key=='w')  {band=band+0.1;}
//}

if(fft.getBand(20)>band*2)  {band=band+0.1;}
if(fft.getBand(20)<band/10)  {band=band-0.1;}
if(band<0) {band=1;}

  fft.forward(track.mix); {       //analyses the track

if(key=='q'){
if(fft.getBand(20)<band){
  
  
  int sec=second();
 
  colorMode(HSB);                 //Sets the Colour Mode to 
                                  //Hue, Saturation, Brightness
   
  if(fft.getBand(1)>8) { h=h+16;
 background(255-h,255,255);

}  //an if statement that changes the hue when the bass peaks
 
  if(h>255)            { h=0; }     //returns the hue back to zero for cycling
  
  fill (h,255,random(0,255));     //references the hue and randomise the brightness


  if(fft.getBand(20)>1)   { background(0); }         //an if statement that refeshes
                                                     //the screen when a snare is hit
                                                     //freq 6536-6880 hz
 
    
    //diameter Tuning
      
    if(dia>10) { diaamp=diaamp+2; }       //reduces the amp of the diameter when it gets too big
    if(diaamp>60)    { diaamp=40; }             //re-asks the question if the amplitude becomes too small
    if(sec==59)      { diaamp=40; }             //re-asks the question every minuet
    
  dia = fft.getBand(5)*(width/diaamp);          //sets diameter to an FFT Band
                                                //freq 1376-1720 hz
   
   
    targetA = fft.getBand(2)*aamp;      //an Easying formular for
    float dA = targetA - a;             //the X Cordinate which
    if(abs(dA) > 1) {                   //reacts to audios bass
      a += dA * easing;                 //freq 344-688 hz
    }

    
    targetB = fft.getBand(1 )*amp;      //an Easying formular for
    float dB = targetB - b;             //the Y Cordinate which
    if(abs(dB) > 1) {                   //reacts to audios bass
      b += dB * easing;                 //freq 0-344 hz
    }
background(0);
//Tunning Section for ellipses X & Y

if (b >height/2)  { amp--; }    //stops the blobs going off screen too much
if (b<height/5)        { amp++; }    //stops the blobs looking too tied to the corners
if (a >width/2)   { aamp--; }   //stops the blobs going off screen too much
if (a<width/5)         { aamp++; }   //stops the blobs looking too tied to the corners

for(int i = 1; i < 4; i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(2+dia/10);
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(h,255,255,random(0,255));    //  Saturation mouseX-fft.getBand(i)*100
line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
noFill();
stroke(255-h,255,255,random(0,255));
 ellipse(a,b,dia,as*dia);
    ellipse(a*2,2*b,dia*2,as*dia*2);
    ellipse(a*3,3*b,dia*3,as*dia*3);

    ellipse(width-a,b,dia,as*dia);
    ellipse(width-a*2,2*b,dia*2,as*dia*2);
    ellipse(width-a*3,3*b,dia*3,as*dia*3);

    ellipse(a,height-b,dia,as*dia);
    ellipse(a*2,height-2*b,dia*2,as*dia*2);
    ellipse(a*3,height-3*b,dia*3,as*dia*3);

    ellipse(width-a,height-b,dia,as*dia);
    ellipse(width-a*2,height-2*b,dia*2,as*dia*2);
    ellipse(width-a*3,height-3*b,dia*3,as*dia*3);
}
}
if(fft.getBand(20)>band){
    int sec=second();
 
  colorMode(HSB);                 //Sets the Colour Mode to 
                                  //Hue, Saturation, Brightness
   
  if(fft.getBand(1)>8) { h=h+16;
 background(255-h,255,255);

}  //an if statement that changes the hue when the bass peaks
 
  if(h>255)            { h=0; }     //returns the hue back to zero for cycling
  
  fill (h,255,random(0,255));     //references the hue and randomise the brightness


  if(fft.getBand(20)>1)   { background(0); }         //an if statement that refeshes
                                                     //the screen when a snare is hit
                                                     //freq 6536-6880 hz
 
    
    //diameter Tuning
      
    if(dia>10) { diaamp=diaamp+2; }       //reduces the amp of the diameter when it gets too big
    if(diaamp>60)    { diaamp=40; }             //re-asks the question if the amplitude becomes too small
    if(sec==59)      { diaamp=40; }             //re-asks the question every minuet
    
  dia = fft.getBand(5)*(width/diaamp);          //sets diameter to an FFT Band
                                                //freq 1376-1720 hz
   
   
    targetA = fft.getBand(2)*aamp;      //an Easying formular for
    float dA = targetA - a;             //the X Cordinate which
    if(abs(dA) > 1) {                   //reacts to audios bass
      a += dA * easing;                 //freq 344-688 hz
    }

    
    targetB = fft.getBand(1 )*amp;      //an Easying formular for
    float dB = targetB - b;             //the Y Cordinate which
    if(abs(dB) > 1) {                   //reacts to audios bass
      b += dB * easing;                 //freq 0-344 hz
    }

//Tunning Section for ellipses X & Y

if (b >height/5)  { amp--; }    //stops the blobs going off screen too much
if (b<height/60)        { amp++; }    //stops the blobs looking too tied to the corners
if (a >width/5)   { aamp--; }   //stops the blobs going off screen too much
if (a<width/60)         { aamp++; }   //stops the blobs looking too tied to the corners

for(int i = 0; i < 9; i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(dia);
stroke(h+i*5,255,random(0,255));    //  Saturation a-fft.getBand(i)*100
line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);


}
  
}
  }
if(key=='w'){
 if(fft.getBand(20)>band){
  
  
  int sec=second();
 
  colorMode(HSB);                 //Sets the Colour Mode to 
                                  //Hue, Saturation, Brightness
   
  if(fft.getBand(1)>8) { h=h+16;
 background(255-h,255,255);

}  //an if statement that changes the hue when the bass peaks
 
  if(h>255)            { h=0; }     //returns the hue back to zero for cycling
  
  fill (h,255,random(0,255));     //references the hue and randomise the brightness


  if(fft.getBand(20)>1)   { background(0); }         //an if statement that refeshes
                                                     //the screen when a snare is hit
                                                     //freq 6536-6880 hz
 
    
    //diameter Tuning
      
    if(dia>10) { diaamp=diaamp+2; }       //reduces the amp of the diameter when it gets too big
    if(diaamp>60)    { diaamp=40; }             //re-asks the question if the amplitude becomes too small
    if(sec==59)      { diaamp=40; }             //re-asks the question every minuet
    
  dia = fft.getBand(5)*(width/diaamp);          //sets diameter to an FFT Band
                                                //freq 1376-1720 hz
   
   
    targetA = fft.getBand(2)*aamp;      //an Easying formular for
    float dA = targetA - a;             //the X Cordinate which
    if(abs(dA) > 1) {                   //reacts to audios bass
      a += dA * easing;                 //freq 344-688 hz
    }

    
    targetB = fft.getBand(1 )*amp;      //an Easying formular for
    float dB = targetB - b;             //the Y Cordinate which
    if(abs(dB) > 1) {                   //reacts to audios bass
      b += dB * easing;                 //freq 0-344 hz
    }
background(0);
//Tunning Section for ellipses X & Y

if (b >height/2)  { amp--; }    //stops the blobs going off screen too much
if (b<height/5)        { amp++; }    //stops the blobs looking too tied to the corners
if (a >width/2)   { aamp--; }   //stops the blobs going off screen too much
if (a<width/5)         { aamp++; }   //stops the blobs looking too tied to the corners

for(int i = 1; i < 4; i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(2+dia/10);
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(h,255,255,random(0,255));    //  Saturation mouseX-fft.getBand(i)*100
line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
noFill();
stroke(255-h,255,255,random(0,255));
 ellipse(a,b,dia,as*dia);
    ellipse(a*2,2*b,dia*2,as*dia*2);
    ellipse(a*3,3*b,dia*3,as*dia*3);

    ellipse(width-a,b,dia,as*dia);
    ellipse(width-a*2,2*b,dia*2,as*dia*2);
    ellipse(width-a*3,3*b,dia*3,as*dia*3);

    ellipse(a,height-b,dia,as*dia);
    ellipse(a*2,height-2*b,dia*2,as*dia*2);
    ellipse(a*3,height-3*b,dia*3,as*dia*3);

    ellipse(width-a,height-b,dia,as*dia);
    ellipse(width-a*2,height-2*b,dia*2,as*dia*2);
    ellipse(width-a*3,height-3*b,dia*3,as*dia*3);
}
}
if(fft.getBand(20)<band){
    int sec=second();
 
  colorMode(HSB);                 //Sets the Colour Mode to 
                                  //Hue, Saturation, Brightness
   
  if(fft.getBand(1)>8) { h=h+16;
 background(255-h,255,255);

}  //an if statement that changes the hue when the bass peaks
 
  if(h>255)            { h=0; }     //returns the hue back to zero for cycling
  
  fill (h,255,random(0,255));     //references the hue and randomise the brightness


  if(fft.getBand(20)>1)   { background(0); }         //an if statement that refeshes
                                                     //the screen when a snare is hit
                                                     //freq 6536-6880 hz
 
    
    //diameter Tuning
      
    if(dia>10) { diaamp=diaamp+2; }       //reduces the amp of the diameter when it gets too big
    if(diaamp>60)    { diaamp=40; }             //re-asks the question if the amplitude becomes too small
    if(sec==59)      { diaamp=40; }             //re-asks the question every minuet
    
  dia = fft.getBand(5)*(width/diaamp);          //sets diameter to an FFT Band
                                                //freq 1376-1720 hz
   
   
    targetA = fft.getBand(2)*aamp;      //an Easying formular for
    float dA = targetA - a;             //the X Cordinate which
    if(abs(dA) > 1) {                   //reacts to audios bass
      a += dA * easing;                 //freq 344-688 hz
    }

    
    targetB = fft.getBand(1 )*amp;      //an Easying formular for
    float dB = targetB - b;             //the Y Cordinate which
    if(abs(dB) > 1) {                   //reacts to audios bass
      b += dB * easing;                 //freq 0-344 hz
    }

//Tunning Section for ellipses X & Y

if (b >height/5)  { amp--; }    //stops the blobs going off screen too much
if (b<height/60)        { amp++; }    //stops the blobs looking too tied to the corners
if (a >width/5)   { aamp--; }   //stops the blobs going off screen too much
if (a<width/60)         { aamp++; }   //stops the blobs looking too tied to the corners

for(int i = 0; i < 9; i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(dia);
stroke(h+i*5,255,random(0,255));    //  Saturation a-fft.getBand(i)*100
line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);


}
  
} 
}
}    //close fft


println(band);
  }  //close drawVoid

    
    
    
    
    





void stop()
{
  // always close Minim audio classes when you finish with them
  track.close();
  minim.stop();

  super.stop();
}


