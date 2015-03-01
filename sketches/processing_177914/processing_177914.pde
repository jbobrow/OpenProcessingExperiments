

import ddf.minim.*;

// declare 
/// Image
PImage compoImage1;
PImage compoImage2;
/// Minim
Minim minim;
/// Audio
AudioSample excite;
AudioSample excite2;
AudioSample spiritual1;
AudioSample spiritual2;

//load image & audio

void setup () {
 size(800, 800);
 compoImage1=loadImage("compoImage1.png");
 compoImage2=loadImage("compoImage2.png");
 minim = new Minim(this);
 excite = minim.loadSample("excitation.wav");
 excite2 = minim.loadSample("excite2.wav");
 spiritual1 = minim.loadSample("spiritual1.wav");
 spiritual2 = minim.loadSample("spiritual2.wav");
  
}

// define user interaction
float xPrev=mouseX;
float yPrev=mouseY;

void draw (){
  
  float dx=mouseX-xPrev;
  float dy=mouseY-yPrev;
  
  image(compoImage2, 0, 0, 800, 800);
  tint(255,mouseX/4);  // Apply varying transparency in x direction 
  
  image(compoImage1, 0, 0, 800, 800);  
  tint(255,mouseY/4);  // Apply varying transparency in y direction
  
  // store current value for next iteration
  xPrev=mouseX; 
  yPrev=mouseY;
  
}


// create excitation
void mouseClicked(){

   if(mouseX<mouseY) excite.trigger(); // zither
   else excite2.trigger(); // drum
}



