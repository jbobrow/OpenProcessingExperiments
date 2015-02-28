
//colorSound by Gabychica©


import ddf.minim.*;
//import fullscreen.*;

  
/** Variables */
Minim minim;          /** Minim object for music apps */
AudioPlayer sonido;  /** AudioPlayer for background music */
AudioPlayer[] samples;  /** Sound sample's array */

//FullScreen fs;    /** Fullscreen object */



PImage lienzo;

void setup(){
  
  size(400,400/* ,P3D*/);
  lienzo= loadImage ("paper01.jpg");
  image(lienzo,0,0);
  //noCursor();
 // background(#EDECBF);
 
   /** bajar música */
   minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  sonido = minim.loadFile("123.mp3", 2048);
  // play the file
  sonido.pause();
  
}

void draw(){
  
 
  if (mousePressed){
    stroke(59,165,255,50);
    strokeWeight(2*random(10));
    line (pmouseX,pmouseY,mouseX,mouseY);
  }
 
}




void mouseReleased(){
  //rect (0*random(1),0*random(2),400,400);
  strokeWeight (3*random(2));
  //ellipse(mouseX,mouseY, random(100), random (100));
  sonido.pause();
}

void mouseDragged(){
  
//strokeWeight (1);
strokeWeight (random (55));
stroke(34,12,23,80);
line (pmouseX, pmouseY, mouseX, mouseY); 
translate(pmouseX,pmouseY);
//fill(255,50);
//sphere(20);
sonido.play();
  
}

void keyPressed (){
  
  if (keyCode == UP) {
  lienzo= loadImage ("paper01.jpg");
  image(lienzo,0,0);
  } else if (keyCode == DOWN) {
      saveFrame ("watercolor.jpg");
    } 
  
}
  

