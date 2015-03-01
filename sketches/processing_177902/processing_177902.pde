

import ddf.minim.*;

//declare PImage
PImage compoImage1;
PImage compoImage2;
Minim minim;
AudioSample excite;
AudioSample excite2;
AudioSample spiritual1;
AudioSample spiritual2;

//load an image from HDD

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

// draw image on screen at (0,0)
float xPrev=mouseX;
float yPrev=mouseY;

void draw (){
  //float dy = (mouseY) ;
  //float dx = (mouseX) ;
  //println(dy);
  //println(compoImage1.height/2);
  //println(mouseY);
  
  float dx=mouseX-xPrev;
  float dy=mouseY-yPrev;
  
  image(compoImage2, 0, 0, 800, 800);
  tint(255,mouseX/4);  // Apply transparency without changing color
  image(compoImage1, 0, 0, 800, 800);  
  tint(255,mouseY/4);  // Apply transparency without changing color
  
  xPrev=mouseX;
  yPrev=mouseY;
//  println(dy);
//  if (dy>10) spiritual1.trigger();
//  if (dy<-10) spiritual2.trigger();
  
}


// create excitation
void mouseClicked(){

   if(mouseX<mouseY) excite.trigger();
   else excite2.trigger();
}

//void keyPressed(){
// if (key== 'b') excite.trigger(); 
//}

