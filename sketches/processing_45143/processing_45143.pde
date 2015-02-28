
// learning - easy stuff

// TYMPANUM
// real time audio visualization
// www.chris-saner.net
// (c) music by Chris Saner

import ddf.minim.*;
import ddf.minim.analysis.*;
 
float x;
float y;
Minim minim;
AudioPlayer sample1;
AudioPlayer sample2;
AudioPlayer sample3;
int backgroundcolor = 0;
boolean animationboolean = false;
FFT fft;
boolean playing= false;

void setup() 
{
  size(600, 600);

  background(backgroundcolor);
  
  minim = new Minim (this);

  sample1 = minim.loadFile ("sample1.mp3");
  sample2 = minim.loadFile ("sample2.mp3");
  sample3 = minim.loadFile ("sample3.mp3");
  

  sample1.play ();
    sample1.loop();
    
  fft = new FFT(sample2.bufferSize(), sample2.sampleRate());
  
}

boolean playbutton = true;

            PFont font;

int restdauer = 255;

void draw() 
{
  
            smooth();
            fill(255);
            font = loadFont("Aharoni-Bold-48.vlw"); 
            textAlign(CENTER);
            if (animationboolean==false){
            intro ();}
            else if (animationboolean==true) {
            animation();}
}

  
void intro() {
                textFont(font, (width/15)); 
            text("tympanum", (width/2), (height/10));
            textFont(font, (width/40)); 
            text("real time audio visualization", (width/2), (height/10)+(width/25));
            textFont(font, (width/35)); 
                fill(200);
            text("mmp.chris-saner.net", (width/2), (height/20)*19);
            
    int buttoncolor = 0;
    if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
    cursor(HAND);
    if (sample3.isPlaying()==false && playing==false) {
    sample3.play(0);
    playing=true;}
    }
    else {cursor(ARROW); if (sample3.isPlaying()==false){
    playing=false; }
    }
    
  noStroke();
    float kreisgroesse9 = width/5; 

  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(80, 90, 220, 50);
  }
  else {fill(30);}
  ellipse((width/2), (height/2), kreisgroesse9, kreisgroesse9);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(60, 80, 220, 30);
  }
  else {fill(20);}
  ellipse((width/2), (height/2), kreisgroesse9+10, kreisgroesse9+10);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(50, 70, 220, 10);
  }
  else {fill(10);}
  ellipse((width/2), (height/2), kreisgroesse9+20, kreisgroesse9+20);
  fill(backgroundcolor);
  ellipse((width/2), (height/2), kreisgroesse9/1.2, kreisgroesse9/1.2);
   
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(250, 50);
  }
  else {fill(50, 50);}
  triangle((width/2)-(kreisgroesse9/4), (height/2)-(kreisgroesse9/3), (width/2)+(kreisgroesse9/2.5), (height/2), (width/2)-(kreisgroesse9/4), (height/2)+(kreisgroesse9/3));
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(250, 100);
  }
  else {fill(50, 30);}
  triangle((width/2)-(kreisgroesse9/4)+2, (height/2)-(kreisgroesse9/3)+10, (width/2)+(kreisgroesse9/2.5)-10, (height/2), (width/2)-(kreisgroesse9/4)+2, (height/2)+(kreisgroesse9/3)-10);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(250, 150);
  }
  else {fill(50, 20);}
  triangle((width/2)-(kreisgroesse9/4)+5, (height/2)-(kreisgroesse9/3)+15, (width/2)+(kreisgroesse9/2.5)-15, (height/2), (width/2)-(kreisgroesse9/4)+5, (height/2)+(kreisgroesse9/3)-15);
  
}




void animation() {
    cursor(ARROW);
    if (sample2.isPlaying() == false) {sample2.play ();}
  
    fft.forward(sample2.mix);
   // FFT================================================
   
     float tiefen = 0;
  for (int o=0; o < ((fft.specSize())/5); o++)
  {
  float[] tiefenspectrum = new float[fft.specSize()];
  tiefenspectrum[o] = fft.getBand(o); 
  tiefen = tiefen + fft.getBand(o);
  }
  
  float mitten = 0;
  for (int o= ((fft.specSize())/5) ; o < (((fft.specSize())/5)*3); o++)
  {
  float[] mittenspectrum = new float[fft.specSize()];
  mittenspectrum[o] = fft.getBand(o); 
  mitten = mitten + fft.getBand(o);
  }
  
  
  float hoehen = 0;
  for (int o= (((fft.specSize())/5)*3); o < fft.specSize(); o++)
  {
  float[] hoehenspectrum = new float[fft.specSize()];
  hoehenspectrum[o] = fft.getBand(o); 
  hoehen = hoehen + fft.getBand(o);
  }
   
   // ===================================================
    

    
            float dim1prov = ( sample1.mix.level() * width * 3);
            float dim2prov = ( sample2.mix.level() * width * 3);
            float dim = dim1prov + dim2prov;
          
            smooth();
            noStroke();
            fill(backgroundcolor, 50);
            rect(0, 0, width, height);
            
            if (restdauer > 0) {
            fill(restdauer);
            textAlign(CENTER);
            textFont(font, (width/15)); 
            text("tympanum", (width/2), (height/10));
            textFont(font, (width/40)); 
            text("real time audio visualization", (width/2), (height/10)+(width/25));
            }
            
            if (dim > 1 && dim <= 50) {
              if ((sample2.length()/6)*3.5 > sample2.position()  || (sample2.length()/6)*5.1 < sample2.position()) { 
                stroke(random(150), random(150), random(180, 255));
                for (int i=0; i<(dim/10); i=i+1) {
                  point(random((width/2)-(dim/5), (((width/2)+(dim/5))) ), random((height/2)-(dim/5), (height/2)+(dim/5)));
                }
              }
              
              if ((sample2.length()/6)*3.5 < sample2.position()  && (sample2.length()/6)*5.6 > sample2.position()) {               
                stroke(random(150), random(150), random(180, 255));
              noFill();
              float kreisgroesse3 = random(width/250); 
              for (int i=0; i<(dim/20); i=i+1) {
              ellipse(random((width/2)-(dim), (((width/2)+(dim))) ), random((height/2)-(dim), (height/2)+(dim)), kreisgroesse3, kreisgroesse3); 
              }
              }
              if ((sample2.length()/6)*4 < sample2.position()  && (sample2.length()/6)*5.4 > sample2.position()) {
              stroke(random(30, 50), random(130, 150), random(140,160));                for (int i=0; i<(dim/20); i=i+1) {
                  point(random((width/2)-(dim*2), (((width/2)+(dim*2))) ), random((height/2)-(dim*2), (height/2)+(dim*2)));
                }
              }
              if ((sample2.length()/6)*4.5 < sample2.position() && (sample2.length()/6)*5.2 > sample2.position()) {
              stroke(random(30, 60), random(90, 150), random(80,180));
              noFill();
              float kreisgroesse3 = random(width/250); 
              for (int i=0; i<(dim/20); i=i+1) {
              ellipse(random((width/2.2), width-(width/2.2)), random((height/2.2), height-(height/2.2)), kreisgroesse3, kreisgroesse3); 
              }
              }
              
            }
            
              print("++  tiefen: " + tiefen + "  mitten: " + mitten + "  hoehen: " + hoehen);
            
                        if (dim <53 && dim>40.5 && tiefen<120 && hoehen>4){
              stroke(random(80, 100), random(100, 120), random(100,255));
              noFill();
              float kreisgroesse3 = random(width/200); 
              for (int i=0; i<(dim/30); i=i+1) {
              ellipse(random(width), random(height), kreisgroesse3, kreisgroesse3); 
              }
              
            }  

if (dim > 45 && (sample2.length()/6)*3.5 < sample2.position()) {
                                noStroke();
              for (int anzahlkreise2 = 0; anzahlkreise2 < random(dim/500); anzahlkreise2 = anzahlkreise2 + 1) {
                
                
                      float kreisgroesse1 = random(1, 20);
                      float kreislagex1 = (width/2)+(random(-(width/7), width/7)); 
                      float kreislagey1 = (((height/2)+random(-(height/7), height/7)));
                      fill(random(20, 50), random(80, 100), random(90), 200);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1, kreisgroesse1);
                      fill(random(10, 40), random(60, 80), random(70), 150);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1+10, kreisgroesse1+10);
                      fill(backgroundcolor, 50);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1/1.5, kreisgroesse1/1.5);
              }
            }

            if (dim > 50) {
              if ((sample2.length()/6)*3.7 > sample2.position()) { 
                float kreisgroesse0 = random((dim/10), dim/2);
         
              
                noStroke();
                fill(random(150), random(150), random(180, 255), 50);
                ellipse((width/2), (height/2), kreisgroesse0, kreisgroesse0);
                fill(random(120), random(170), random(180, 255), 30);
                ellipse((width/2), (height/2), kreisgroesse0+10, kreisgroesse0+10);
                fill(random(100), random(190), random(180, 255), 10);
                ellipse((width/2), (height/2), kreisgroesse0+20, kreisgroesse0+20);
                fill(backgroundcolor);
                ellipse((width/2), (height/2), kreisgroesse0/1.5, kreisgroesse0/1.5);
            }

            }
            
            
            if (dim>250) {
            backgroundcolor = backgroundcolor+10; }
            else {backgroundcolor = 0;}
         
            
            
            float zufall = random(2);
            if (dim>200) {       
                   
              stroke(random(180, 255), random(100), random(100));
              noFill();
              float kreisgroesse3 = random(width/100); 
              for (int i=0; i<(dim/150); i=i+1) {
              ellipse(random(width), random(height), kreisgroesse3, kreisgroesse3);  
              }
                
              
                    noStroke();
              for (int anzahlkreise = 0; anzahlkreise < random(dim/200); anzahlkreise = anzahlkreise + 1) {
                
                
                      float kreisgroesse1 = random(10, 30);
                      float kreislagex1 = (width/2)+(random(-(width/4), width/4)); 
                      float kreislagey1 = (((height/2)+random(-(height/4), height/4)));
                      fill(random(180, 255), random(100), random(100), 200);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1, kreisgroesse1);
                      fill(random(180, 255), random(100), random(100), 150);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1+10, kreisgroesse1+10);
                      fill(random(180, 255), random(100), random(100), 100);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1+20, kreisgroesse1+20);
                      fill(backgroundcolor, 50);
                      ellipse(kreislagex1, kreislagey1, kreisgroesse1/1.5, kreisgroesse1/1.5);
                    }
               
                  }
            if (sample2.isPlaying() == false) {restdauer = 255; animationboolean=false; return;}
            if (restdauer>0) {restdauer = restdauer-1;} else if (restdauer==0) {restdauer = 0;}
          }
              


       
void mouseClicked() {if (sample2.isPlaying()==false) {if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {sample2.cue(0); animationboolean=true; return;} }}

