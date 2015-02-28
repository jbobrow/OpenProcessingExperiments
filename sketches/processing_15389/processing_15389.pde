
//Visual Synth

// Sound reactive visual generator with 7 Patterns
// Paterns can be combined using letters zxcvbnm to form a custom pattern
// They can also be alternated between when the sound peaks at a certain frequency 
// which frequency band can be altered using keys [ and ]

// The keys qwertyu attach the 7 patterns respectivley to the NON Triggered state of the alternation
// The key i attaches the custom pattern to the NON Triggered state of the alternation
// The key o attaches the opposit of the custom pattern to the NON Triggered state of the alternation

// The keys asdfghj attach the 7 patterns respectivley to the TRIGGERED state of the alternation
// The key k attaches the custom pattern to the TRIGGERED state of the alternation
// The key l attaches the opposit of the custom pattern to the TRIGGERED  state of the alternation

// The keys `1234567890 set fixed framerates in this accending order 1,2,4,8,12,16,24,25,30,50,60
// The keys - and = reduces and increases the frames per second by 1 respectively i.e -+ fps

// The keys , and . change the amount of possible colours are in the screen scrolled through 2,4,8,16,32,64,128,256 colours

// Hit space bar and all variable are randomised

// Hit p and the screen will freeze

// and finally hit / and a key board layout will apear hit any other key to remove it

//Enjoy 
//DYSbomb 


import ddf.minim.analysis.*;         //import some minim classes
import ddf.minim.*;

Minim minim;                 //Set up some minim objects for the sound analysis
AudioPlayer track;
FFT fft;
int trackposition=0;
float as=1;                  //aspect ratio skew value - used for exporting to an enviroment with non square pixels like wide screen pal or ntsc with pixels with a 1.422 aspect ratio

int h;                       //current hue
int hval=16;                 //the amount the hue changes when triggered can be halfed or doubled by using the ',' and '.' when th program is playing
float ht=1;                  //HUE Tuneing coefficent to keep it in check

float srt=1;                 //SCREEN REFRESH Tune coefficent

float a;                     //the X coordinate attached to Lowest bass frquincies  0-344 hz
float b;                     //the Y coordinate attached to Next Lowest bass frquincies
float targetA;               //used in the easing process
float targetB;               //used in the easing process
float easing = 0.08;         //easing coefficient
int amp=40;                  //start amplitude b 
int aamp=40;                 //start amplitude a 

int lineamp=8;               //start amplitude for lines 

float dia;                   //diameter float
int diaamp=40;               //start amplitude for diameters 


PFont f;                     //Sets up a font
int sec=second();            //time function used in keeping the DIAMETER/WIDTH function
int fr=25 ;                  //start frameRate
PShape joy;                  //Sets up a Vector Sha[e
PImage keyboard;             //Sets up a Image used in the keyboard layout accesable by pressing '/'

float band=1;                //Tunes the jitter between patterns to keep it in check
int bandval=20;              //The Frequency band for the jitter loop starts at 6536-6880 hz aimed at the snare 
int lower=1;                 //Sets the pattern that plays when the Bandval is NOT Triggered 1-7 single pattern 8=a custom combination pattern set up by using the letters zxcvbnm 9=the oposite of the custom pattern and 10= Pause 
int higher=8;                //Sets the pattern that plays when the Bandval IS Triggered 1-7 single pattern 8=a custom combination pattern set up by using the letters zxcvbnm 9=the oposite of the custom pattern and 10= Pause 


//an on off system for the letters below

int z=1;      ///Key ints change from 0 to 1 for an on off signal for the key pressed
int x=1;
int c=1;
int v=0;
int B=1;
int n=0;
int m=0;



void setup()
{
// size(720,576);
  size(screen.width,screen.height, P2D);            //Sketch Size and renderer
  noCursor();                     //removes mouse pointer
  minim = new Minim(this);        //Starts Minim
  background(0);                  //Starts with a black background
  colorMode(HSB);                 //Sets the Colour Mode to 
                                  //Hue, Saturation, Brightness
 
 
 
  ///////////////////////////////////////////////////////////////////////////////////////////////  
  ////User Section//////Change Track//////User Section////////Change Track///////////////////////               
  ///////////////////////////////////////////////////////////////////////////////////////////////
              // This is where to change the MP3                                               //                                                                                          //
                                                                                               //
              // Copy file into Data folder                                                    //
                                                                                               //  
              // Paste file name in here                                                       //
                                                                                               //
                                                                                               //
  track = minim.loadFile("Mastered Mix.mp3",128);                                               //
                                                                                               //     
                                                                                             //                                                    
  ///////////////////////////////////////////////////////////////////////////////////////////////                                                                
  ////User Section//////Change Track//////User Section////////Change Track///////////////////////                                                                
  ///////////////////////////////////////////////////////////////////////////////////////////////                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
  track.loop();  
  track.cue(360000);   //Loops the Track
  fft = new FFT(track.bufferSize(), track.sampleRate());        //Starts the Fast Fourier Transform used as the data source for all the graphics
  
  //Font Stuff
  
  f = loadFont("Tahoma-18.vlw");            //Loads the font
  textFont(f);                              //Setc the font
  
  //Vectors and Images
 
  joy = loadShape("DYS.svg");               //Loads a Vector
  keyboard = loadImage("keyboard.jpg");     //Loads an Image
}



void draw()
{
   if(hval<1) {hval=1;}             //Limit the Values of hval from 1-128
   if(hval>128)  {hval=128;}
 
   if (bandval<1) {bandval=1;}      //Limit the Values of bandval from 1-63
   if (bandval>63) {bandval=63;}
 
   fft.forward(track.mix);          //analyses the track


////////////////////////////////////////////////////////////////////////////////////
//////////////PROPERTIES////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////
//                                      //
//   FRAME RATE = fr                    //
//   Hue = h                            //
//   SCREEN REFRESH when snare hit      //
//   DIAMETER / WIDTH = dia             //
//   BASS A = a                         //
//   BASS B = b                         //
//                                      //
//////////////////////////////////////////

   //FRAME RATE
   
  

      if (fr<1)  {fr=1;}      // limits fr to once a second
      if (fr>60) {fr=60;}     // limits max framRate to 60

 frameRate(fr);       // sets framerate to fr which is changed by the keys `1234567890-=
    
   //HUE
   
  

    if(hval<1) {hval=1;}                            //Limit the Values of hval from 1-128
    if(hval>128)  {hval=128;}

    if(fft.getBand(8) > ht*2)    {  ht=ht+0.1;  }   //HUE tuning section
    if(fft.getBand(8) < ht/10)   {  ht=ht-0.1;  }
    if(ht<0.2)                   {  ht=1;       }

  if(fft.getBand(8)>ht) {  h=h+hval; }            //an if statement that changes 
                                                    //the hue when the upper bass peaks
                                                    //2408-2752hz
                                                  
    if(h>255)             {   h=0;   }              //returns the hue back to zero for cycling


    //SCREEN REFRESH

   if (key=='p')   {                                                          //this stops the screen refeshing when 'p' is pressed
                   }else{ 
                          if(fft.getBand(20)>srt)  { background(0); }  }     //an if statement that refeshes
                                                                             //the screen when a snare is hit
                                                                             //freq 6536-6880 hz
          
    if(fft.getBand(20)>srt*1.5)  {  srt=srt+0.1;  }   //tuning SCREEN REFRESH\\
    if(fft.getBand(20)<srt/20)   {  srt=srt-0.1;  }
    if(srt<0.2)                  {  srt=1;        }



    //DIAMETER / WIDTH

    dia = fft.getBand(5)*(width/diaamp);          //sets diameter to an FFT Band
                                                  //freq 1376-1720 hz
                                                  
                                                  
   //tuning DIAMETER / WIDTH\\
    
    if(dia>10)     {  diaamp=diaamp+2;  }         //reduces the amp of the diameter when it gets too big
    if(diaamp>60)  {  diaamp=40;        }         //re-asks the question if the amplitude becomes too small
    if(sec==59)    {  diaamp=40;        }         //re-asks the question every minuet




    // BASS A

    targetA = fft.getBand(1)*aamp;      //an Easying formular for
    float dA = targetA - a;             //the X Cordinate which
    if(abs(dA) > 1) {                   //reacts to audios bass
      a += dA * easing;                 //freq 0-344 hz
    }
                                        //tuning BASS A\\    
    if (a >width/2) {  aamp--;   }      //stops the blobs going off screen too much
    if (a<width/5)  {  aamp++;   }      //stops the blobs looking too tied to the corners




    //BASS B

    targetB = fft.getBand(2 )*amp;      //an Easying formular for
    float dB = targetB - b;             //the Y Cordinate which
    if(abs(dB) > 1) {                   //reacts to audios bass
      b += dB * easing;                 //freq 344-688 hz
    }
                                        //tuning BASS B\\
    if (b >height/2)  {  amp--;   }     //stops the blobs going off screen too much
    if (b<height/5)   {  amp++;   }     //stops the blobs looking too tied to the corners



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////GRAPHICS CODE//////////////////////GRAPHICS CODE////////////////////////GRAPHICS CODE/////////////////////////GRAPHICS CODE///////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////
//                                      //
//   Hue = h                            //
//   SCREEN REFRESH when snare hit      //
//   DIAMETER / WIDTH = dia             //
//   BASS A = a                         //
//   BASS B = b                         //
//                                      //
//////////////////////////////////////////




    // VIS JITTER SECTION    

    if(fft.getBand(bandval)>band*2)   {  band=band*1.1;  }      //This all helps to tune the jitter so it fires at t 0.5
                                                                //when it gets louder by raising the threshold  by 10%  
    if(fft.getBand(bandval)<band/10)  {  band=band*0.9;  }      //and when it gets quiet lowering the threshold by 10%
    if(band<0.1)                      {   band=1;        }      //and if it apporaches ZERO re ask the question from 1
     
         

if(fft.getBand(bandval)<band)                                   //This section is important in the Vis Jitter it allows         
      {                                                         //a graphics code to be played the Bandval is LESS than t0.5 set by the above band tuning section
        if(lower==1){                                           //i.e NOT triggered by the attack of an instrument
                                                   
        
        background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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
        
        } //Close for statement
        } //Close 1
        
        if(lower==2){
           if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        
        } //Close 2
        
        if(lower==3){
          
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);
        } //Close 3
        
        if(lower==4){
             rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      
        } //Close 4
        
        if(lower==5){
          
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
      
        } //Close 5
        
        
        
        
        if(lower==6){
          strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }
      
        }   //Close 6
        
        
        
        
         
        if(lower==7){
           stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }
          
        }   //Close 7
        
        
        
        
         
        if(lower==8){
          
           
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE Z  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(z>0){
     
   background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE X  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(x>0){
     
   if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE C  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(c>0){
     
         
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);

 } else {
 //NO Code at ALL
 }
  
  
  
  

  //////////////////////////////////////////////////////////////  
///////  Graphics CODE V  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(v>0){
     
            rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      

 } else {
 //NO Code at ALL
 }
  
  
  

  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE B  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(B>0){
     
      
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
      

 } else {
 //NO Code at ALL
 }
  
  
  
    
//////////////////////////////////////////////////////////////  
///////  Graphics CODE N  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(n>0){
     
    strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE M ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(m>0){
     
   stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }

 } else {
 //NO Code at ALL
 }
        }   //Close 8
        
        
        
        
         
        if(lower==9){
          
           
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE Z  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(z<1){
     
   background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE X  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(x<1){
     
   if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE C  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(c<1){
     
         
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);

 } else {
 //NO Code at ALL
 }
  
  
  
  

  //////////////////////////////////////////////////////////////  
///////  Graphics CODE V  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(v<1){
     
            rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      

 } else {
 //NO Code at ALL
 }
  
  
  

  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE B  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(B<1){
     
      
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
      

 } else {
 //NO Code at ALL
 }
  
  
  
    
//////////////////////////////////////////////////////////////  
///////  Graphics CODE N  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(n<1){
     
    strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE M ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(m<1){
     
   stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }

 } else {
 //NO Code at ALL
 }
        }   //Close 9
        
        
        
        
         
        if(lower==10){
          
          // DO Nothing to Pause the screen
        }   //Close 10
      }

 
 
 
 
 
 
 
 
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////Greater Than Vis Jitter////////////////////////Greater Than Vis Jitter//////////////////////////////////////Greater Than Vis Jitter/////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




if(fft.getBand(bandval)>band)                           //This section is important in the Vis Jitter it allows 
      {                                                 //a graphics code to be played the Bandval is MORE than t0.5 set by the above band tuning section
        if(higher==1){                                  ////i.e TRIGGER by the attack of an instrument
          
        
        background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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
        
        } //Close for statement
        } //Close 1
        
        if(higher==2){
           if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        
        } //Close 2
        
        if(higher==3){
          
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);
        } //Close 3
        
        if(higher==4){
             rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      
        } //Close 4
        
        if(higher==5){
          
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
   
        } //Close 5
         
         
         
         
        if(higher==6){
          strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }
      
      
        }   //Close 6
        
        
        
       
         if(higher==7){
           background(0);
           
           stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }
          
        }   //Close 7
        
        
        
        
         if(higher==8){
           
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE Z  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(z>0){
     
   background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE X  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(x>0){
     
   if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE C  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(c>0){
     
         
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);

 } else {
 //NO Code at ALL
 }
  
  
  
  

  //////////////////////////////////////////////////////////////  
///////  Graphics CODE V  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(v>0){
     
            rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      

 } else {
 //NO Code at ALL
 }
  
  
  

  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE B  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(B>0){
     
      
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
      

 } else {
 //NO Code at ALL
 }
  
  
  
    
//////////////////////////////////////////////////////////////  
///////  Graphics CODE N  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(n>0){
     
    strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE M ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(m>0){
     
   stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }

 } else {
 //NO Code at ALL
 }
          
        }   //Close 8
        
        
        
        
         if(higher==9){
          
           
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE Z  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(z<1){
     
   background(0);  //Black background

        //LINES CODE

        for(int i = 1; i < 4; i++)   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
        {

          strokeWeight(2+dia/10);             //Width minumim 2 plus 1/10th of the Diameter/Width value
          stroke(h,255,255,random(0,255));    //  Colour rolls with the hue and has random Transparency

          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
          line(width/2+ i*b, height/2 + random(-a+i/2.5,a-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
          line(width/2- i*b, height/2 + random(-a+i/2.5,a-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);

          //CIRCLE CODE

          noFill();                               //hollow circles
          stroke(255-h,255,255,random(0,255));    //hue is opposite of the lines for contrast

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

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE X  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(x<1){
     
   if(fft.getBand(1)>8) {
            background(255-h,255,255);
          }

          fill (h,255,random(0,255));     //references the hue and randomise the brightness

          for(int i = 0; i < 9; i++)
          {
            // draw the line for frequency band i, scaling it by 9 so we can see it a bit better
            strokeWeight(dia);
            stroke(h+i*5,255,random(0,255));    
            line(width/2+a*i,height/2+b*i,width/2+b*i,height/2+a*i);
            line(width/2+a*i,height/2-b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2+b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2-b*i,width/2-b*i,height/2-a*i);

            line(width/2+a*i,height/2+b*i,width/2-b*i,height/2-a*i);
            line(width/2+a*i,height/2-b*i,width/2-b*i,height/2+a*i);
            line(width/2-a*i,height/2+b*i,width/2+b*i,height/2-a*i);
            line(width/2-a*i,height/2-b*i,width/2+b*i,height/2+a*i);
          }
        

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE C  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(c<1){
     
         
     fill (h,255,random(0,225));
      shapeMode(CENTER);
     // background(random(0,255),255,255);
     shape(joy,a,b,dia,dia);
    shape(joy,a*2,2*b,dia*2,dia*2);
    shape(joy,a*3,3*b,dia*3,dia*3);

    shape(joy,width-a,b,dia,dia);
    shape(joy,width-a*2,2*b,dia*2,dia*2);
    shape(joy,width-a*3,3*b,dia*3,dia*3);

    shape(joy,a,height-b,dia,dia);
    shape(joy,a*2,height-2*b,dia*2,dia*2);
    shape(joy,a*3,height-3*b,dia*3,dia*3);

    shape(joy,width-a,height-b,dia,dia);
    shape(joy,width-a*2,height-2*b,dia*2,dia*2);
    shape(joy,width-a*3,height-3*b,dia*3,dia*3);

 } else {
 //NO Code at ALL
 }
  
  
  
  

  //////////////////////////////////////////////////////////////  
///////  Graphics CODE V  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(v<1){
     
            rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

  
 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
    
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
    
      

 } else {
 //NO Code at ALL
 }
  
  
  

  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE B  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(B<1){
     
      
      
         rectMode(CENTER);
     fill(0,0,255);
     stroke(255);
     strokeWeight(1);

 
 noStroke();
 
   
    //tuning for line script
   if(fft.getBand(1)>lineamp*2)      { lineamp++; }
   if(fft.getBand(1)<lineamp*0.01)   { lineamp--; }
   if(lineamp<4)                     { lineamp=8; }
     
   //line script
    if(fft.getBand(1)>lineamp)
    { 
    stroke(168,255,255,random(0,255));
    strokeWeight(2);
    line(0,a,width,a);
    line(0,height-a,width,height-a);
    stroke(0,255,255,random(0,255));
    line(0,(height/2)+b,width,(height/2)+b);
    line(0,(height/2)-b,width,(height/2)-b);
    noStroke();
    }
      
      
      //Mirrored triple ellipse code
    fill (h,255,random(0,255));
     ellipse(b,a,dia,as*dia);
    ellipse(b*2,2*a,dia*2,as*dia*2);
    ellipse(b*3,3*a,dia*3,as*dia*3);

    ellipse(width-b,a,dia,as*dia);
    ellipse(width-b*2,2*a,dia*2,as*dia*2);
    ellipse(width-b*3,3*a,dia*3,as*dia*3);

    ellipse(b,height-a,dia,as*dia);
    ellipse(b*2,height-2*a,dia*2,as*dia*2);
    ellipse(b*3,height-3*a,dia*3,as*dia*3);

    ellipse(width-b,height-a,dia,as*dia);
    ellipse(width-b*2,height-2*a,dia*2,as*dia*2);
    ellipse(width-b*3,height-3*a,dia*3,as*dia*3);
      

 } else {
 //NO Code at ALL
 }
  
  
  
    
//////////////////////////////////////////////////////////////  
///////  Graphics CODE N  ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(n<1){
     
    strokeWeight(1+dia/10);
              stroke(h,20*dia,a);
      for(float i = 0; i < width; i=i+a){
      for(float iy = 0; iy < height; iy=iy+a)
{line(0,i,height-iy,0);
line(width,i,height-iy,0);
line(width,i,height-iy,height);
line(0,i,height-iy,height);
}
      }

 } else {
 //NO Code at ALL
 }
  
  
  
  
//////////////////////////////////////////////////////////////  
///////  Graphics CODE M ////////////////////////////////////
//////////////////////////////////////////////////////////////

   if(m<1){
     
   stroke(h,255-dia,255-dia);
           for(float i = 0; i < width; i=i+dia){
   strokeWeight(1+dia/100);   
line(0,i,width-i*a/50,height);
line(width,i,i*a/50,height);
 strokeWeight(1+dia/20);
line(0,i,width-i*a/50,0);
line(width,i,i*a/50,0);
          }

 } else {
 //NO Code at ALL
 }
          
        }   //Close 9
        
        
        
        
        
         if(higher==10){
          //do nothing to pause everything
          
        }   //Close 10
        
        
        
        
      }    ///Close Higher Than Section






///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
///////////DRAW KEYBOARD/////////////////DRAW KEYBOARD////////////////////DRAW KEYBOARD/////////////////DRAW KEYBOARD/////////////////DRAW KEYBOARD///////////////////////////////////////////////////////////////////////////////////////////    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    



   if(key=='/')    { 
         imageMode(CENTER);
         image(keyboard,width/2,height/2);}
        
        
        
        
         
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
/////////PRINT VARIABLES////////////////////PRINT VARIABLES//////////////////////PRINT VARIABLES///////////////////////////PRINT VARIABLES/////////////////////////////////////////////////////////////////////////////////////////////    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
         
   
   //The user variables are printed in the text box for monitoring of what you have chosen
   
    print("Framerate  ");         println(fr);                    //Current Frame Rate
    print("Band value  ");        println(bandval);           //Current Band Value
    print("            Hz ");                println(   344*(bandval-1) );          //the average frequency of bandval
    print("Hue va1ue   ");         println(hval);                  //the amount of shades jumped by the hue when its triggered
    print("Number of colours  "); println(256/hval);       //possible colours available 
    print("Bass    Pattern  ");   println(lower);
    print("Trigger Pattern  ");   println(higher);
    print("Key  ");  println(key);

   
    
    print("Custom  Pattern  ");
 
            if (z==1)   {  print("  1111111 < ON  ||");  }  else {  print("  1111111 > OFF  ||"); }
            
           if (x==1)   {  print("  2222222 < ON  ||");  }  else {  print("  2222222 > OFF  ||"); }
          
            if (c==1)   {  print("  3333333 < ON  ||");  }  else {  print("  3333333 > OFF  ||"); }
        
             if (v==1)   {  print("  4444444 < ON  ||");  }  else {  print("  4444444 > OFF  ||"); }
      
              if (B==1)   {  print("  5555555 < ON  ||");  }  else {  print("  5555555 > OFF  ||"); }
    
               if (n==1)   {  print("  6666666 < ON  ||");  }  else {  print("  6666666 > OFF  ||"); }
  
                if (m==1)   {  print("  7777777 < ON  ||");  }  else {  print("  7777777 > OFF  ||"); }
 
 
 ////////Track position keeps it up to date
 
  print("Track Position  "); println(track.position());
             
             
             if (  track.position() > 0       && track.position () <  360000   )     {  trackposition  =  1  ;
         print(" 01 Wyles Mash  " );  
       }
             if (  track.position() > 360000  && track.position () <  503000   )     {  trackposition  =  2  ;  
         print(" 02 Viscocity  " );    
         }
             if (  track.position ()> 503000  && track.position()  <  727000   )     {  trackposition  =  3  ; 
          print(" 03 Up  " ); 
         }
             if (  track.position ()> 727000  && track.position () <  861000   )     {  trackposition  =  4  ; 
          print(" 04 Gaius  " ); 
         }
             if (  track.position ()> 861000  && track.position()  <  957000   )     {  trackposition  =  5  ; 
          print(" 05 Abatement  " ); 
         }
             if (  track.position ()> 957000  && track.position()  <  1102000  )     {  trackposition  =  6  ; 
          print(" 06 Weber  " ); 
         }
             if (  track.position() > 1102000 && track.position() <  1206000  )     {  trackposition  =  7  ;  
          print(" 07 No Wings  " );  
         }
             if (  track.position ()> 1206000 && track.position () <  1585000  )     {  trackposition  =  8  ; 
          print(" 08 Minimum Velocity  " );  
         }
             if (  track.position ()> 1585000  )                                   {  trackposition  =  9  ;  
          print(" 09 Collidor  " );  
         }
            
             
 
 
 
 

 
 //saveFrame("viscosity-####.tif");
 
 
 
  }   //Close the void draw  
    
  
  
  
  
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
///////Key Controls////////////////////////Key Controls/////////////////////////Key Controls////////////////////////Key Controls///////////////////Key Controls/////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   



  void keyPressed(){

  //Set frameRates
 
 if(key=='`')    {  fr  =  1  ;  }              // Slow Speeds
  if(key=='1')    {  fr  =  2  ;  }             //
   if(key=='2')    {  fr  =  4  ;  }            //
    if(key=='3')    {  fr  =  8  ;  }           //
     if(key=='4')    {  fr  =  12  ;  }         //
      if(key=='5')    {  fr  =  16  ;  }        //
       if(key=='6')    {  fr  =  24  ;  }       // Movies
        if(key=='7')    {  fr  =  25  ;  }      // PAL 25p
         if(key=='8')    {  fr  =  30  ;  }     // NTSC 30p
          if(key=='9')    {  fr  =  50  ;  }    // PAL 50p
           if(key=='0')    {  fr  =  60  ;  }   // NTSC 60p
            if(key=='-')    {  fr  --  ;  }     // Plus 1 fps
             if(key=='=')    {  fr  ++  ;  }    // Minus 1 fps
  
  
  //Lower Than Jitter Loop Dection Patterns
  
  if(key=='q'){lower  =  1  ;}                  //Paterns 1-8
   if(key=='w'){lower  =  2  ;}                 //
    if(key=='e'){lower  =  3  ;}                //
     if(key=='r'){lower  =  4  ;}               //
      if(key=='t'){lower  =  5  ;}              //
       if(key=='y'){lower  =  6  ;}             //
        if(key=='u'){lower  =  7  ;}            //
         if(key=='i'){lower  =  8  ;}           //Custom Pattern
          if(key=='o'){lower  =  9  ;}          //Opposit of Custom Pattern


  //NO PATTERNS
  
  if(key=='p') {  lower  = 10  ;
                  higher = 10  ;}
                  
                  
  //Lower Than Jitter Loop Dection Patterns                 
                
  if(key=='a'){higher =  1  ;}
   if(key=='s'){higher =  2  ;}
    if(key=='d'){higher =  3  ;}
     if(key=='f'){higher =  4  ;}
      if(key=='g'){higher =  5  ;}
       if(key=='h'){higher =  6  ;}
        if(key=='j'){higher =  7  ;}
         if(key=='k'){higher =  8  ;}
          if(key=='l'){higher =  9  ;}           
   
                
  //Turn on and off the Patterns in the Custom Pattern
  
   if(key=='z')   { if (z>0) { z=0;} else { z=1; }  }
    if(key=='x')   { if (x>0) { x=0;} else { x=1; }  }
     if(key=='c')   { if (c>0) { c=0;} else { c=1; }  }
      if(key=='v')   { if (v>0) { v=0;} else { v=1; }  }
       if(key=='b')   { if (B>0) { B=0;} else { B=1; }  }
        if(key=='n')   { if (n>0) { n=0;} else { n=1; }  }     
         if(key=='m')   { if (m>0) { m=0;} else { m=1; }  }
   
   
  //Raise or Lower the Jitter Trigger Frequency
   
   if(key=='[')   { bandval--;  }
   if(key==']')   { bandval++;  }
   
   
  //Halfs or double the HUE Increment 
   
   if(key=='.')  {hval=hval/2;}
   if(key==',')  {hval=hval*2;}
  
  
  //Turns on Keyboars Display
  
   if(key=='/')    {  imageMode(CENTER);
                      image(keyboard,width/2,height/2);  }
         
         
  //Random
  
   if(key==' ') {                     //SMASHING the SPACEBAR randomises EVERYTHING
    float rand=random(1,9.2);
     float rand2=random(1,9.2);
     float rand3=random(1,128.2);
     float rand4=random(1,63.2);
     float rand5=random(1,60.2);
     higher=int(rand);
     lower=int(rand2);
     hval=int(rand3);
     bandval=int(rand4);
     fr=int(rand5);
   
 }
     
     if (key==';'){
       
       float rand6=random(0,1.2);
         float rand7=random(0,1.2);
         float rand8=random(0,1.2);
         float rand9=random(0,1.2);
         float rand10=random(0,1.2);
         float rand11=random(0,1.2);
         float rand12=random(0,1.2);
         float rand13=random(0,1.2);
           z=int(rand6);      ///Key ints change from 0 to 1 for an on off signal for the key pressed
           x=int(rand7);
           c=int(rand8);
           v=int(rand9);
           B=int(rand10);
           n=int(rand11);
           m=int(rand13);
     } //Close Key
       
 if(key=='#'){
 
   trackposition++;
   if(trackposition>9) {  trackposition=1;  }
   
   
     if (trackposition==1) {  track.cue(0);  }
      if (trackposition==2) {  track.cue(360000);  }
       if (trackposition==3) {  track.cue(503000);  }
        if (trackposition==4) {  track.cue(727000);  }
         if (trackposition==5) {  track.cue(861000);  }
          if (trackposition==6) {  track.cue(957000);  }
           if (trackposition==7) {  track.cue(1102000);  }
            if (trackposition==8) {  track.cue(1206000);  }
             if (trackposition==9) {  track.cue(1585000);  }
             
 
 
   
   
   
 }    //Close letter "  #  "
   
 
}    ///CLOSE keyTyped




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
/////CLOSE MINIM//////////////////CLOSE MINIM//////////////////////CLOSE MINIM////////////////CLOSE MINIM////////////////////////CLOSE MINIM///////////////////////////////  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    


    void stop()
    {
      // always close Minim audio classes when you finish with them
      track.close();
      minim.stop();

      super.stop();
    }







