
float inc;
float orale;
float arriba;
int colorcito = 0;
int speed = 15;
PImage pira;
PImage ola;
PImage bobo;
PImage canon;
PImage luz;
PImage plancha;

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
TriangleWave sine;


void setup(){
  size(1000,750);
  colorMode(HSB,200);

  //all the code from the oscillator copyed from www.code.compartmental.net
  
   minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new TriangleWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  
  //pira = loadImage("pira.jpeg");
  //pira = loadImage("bubble.jpg");
  //pira = loadImage("01trentmitchell.jpg");
   // pira = loadImage("montana.JPG");
    pira = loadImage("canon.JPG");
    luz = loadImage("luz.JPG");
    plancha = loadImage("planchaso.gif");
}

void draw(){
 
 

  //code found in www.codasign.com
  // colrcito increases and than decreases
  
   colorcito =  colorcito + speed;    
 
  
  if (colorcito > 200)  
  {
    colorcito = 200;
    speed = -speed; 
  }
 
  else if (colorcito < 0)
  {
    colorcito = 0;
    speed = -speed;  
  } 
 
  photoFilter();
  //photoLight();
  photoPlancha();
  /*tint(200,20);
  scale(.8);
  image(pico, 0, 0);*/
  

  //discarded random loop
  
  for(int x = 0; x < 500; x+=20){
    for(int y = 0; y < 500; y+=20){
    float bla = random(100);
    // fill(bla);
   /*if(bla < .5){
    fill(random(255));
    } else{
  if(bla > .5){
    fill(255*noise(inc),1,45);
    inc += .1;
    }
    }*/
    //scale(1);
    
    //ellipses
    /*smooth();
  noFill();
  stroke(255,23,45);
  ellipse(width/2, height/2, 20+x, 20+y);*/
  
   //tint(colorcito,25*noise(inc), colorcito);
  
 //image(bobo,x*500,y*417);
  /*noStroke();
  smooth();
  fill(155*noise(inc), colorcito, 123);
   ellipse(x*55,y*55, 50, 50);*/
   
   
  }
    }
     
   //mountain tones
   
      noStroke();
      fill(colorcito*50,100,90);
      translate(0,0);
      rect(1350,100,40,40);
      ellipse(350,65,40,40);
      ellipse(450,300,40,40);
      ellipse(550,310,40,40);
      ellipse(650,300,40,40);
      ellipse(750,290,40,40);
      ellipse(850,295,40,40);
      ellipse(950,299,40,40);
      ellipse(1050,330,40,40);
      ellipse(1150,430,40,40);
      ellipse(1250,530,40,40);
      ellipse(1350,895,40,40);
      ellipse(1450,1185,40,40);
      ellipse(1550,1580,40,40);
      ellipse(1650,1475,40,40);
      ellipse(1750,1385,40,40);
      ellipse(1850,1365,40,40);
      ellipse(1950,1260,40,40);
      ellipse(2050,1175,40,40);
      ellipse(2150,1110,40,40);
      ellipse(2250,1025,40,40);
      ellipse(2350,848,40,40);
      ellipse(2450,720,40,40);
      ellipse(2550,540,40,40);
      ellipse(2650,175,40,40);
      
      
 // button in the center with image and ellipses        
if(mouseX > 400 && mouseX < 600 && mouseY > 0 && mouseY < 100 && mousePressed) {
  if(mousePressed = true){
    //tint(200,20);
    image(luz, 0,0);
    for(int x = 0; x < 100; x++){
    for(int y = 0; y < 100; y++){
      noFill();
      stroke(random(250)*noise(inc),100,71);
     ellipse(x*65,y*65,50,50);
    }
    }
    }
   }
   
 for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  if(mousePressed){
{
  // with portamento on the frequency will change smoothly
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
}
}
   
}
    
    
//}

  
// color changing filter

void photoFilter(){
  
   /* pira2. loadPixels();
    for(int j = 0; j < piraSize; j++){
      
     color cp = pira. pixels[j];
  float h = hue(cp);
  float s = saturation(cp);
  float b = brightness(cp);
  pira2. pixels[j] = color(colorcito, 100, b);
    }*/
  
     pira. loadPixels(); // without pira, will load screen
  int piraSize = pira.width * pira.height; // # of pixels
    for(int j = 0; j < piraSize; j++){
      //for(int x = 0; x < 10; x+=1){
    //for(int y = 0; y < 10; y+=1){
  color cp = pira. pixels[j];
  float h = hue(cp);
  float s = saturation(cp);
  float b = brightness(cp);
  pira. pixels[j] = color(colorcito,50, b);
} 

pira.updatePixels();
//for(int x = 0; x < 10; x+=1){
  //  for(int y = 0; y < 10; y+=1){
     

     // tint(200,50);
      scale(.37);
image(pira, 0, 0);
//image(pira, x*700, y*300);
//}  
   // }
}
   // }
 
//}

//flying men

void photoPlancha(){
  //orale = 0;
    float vuela = 500* cos(radians(orale));
    float ahora = 500* sin(radians(arriba))*cos(radians(orale)*sin(radians(arriba)));
     
orale+= 70;
for(int x = 0; x < 15; x+=2){
    for(int y = 0; y < 15; y+=1.5){
      image(plancha, vuela+(x*500), vuela+(y*500));
      
    
    
}
    }
 
}


void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

