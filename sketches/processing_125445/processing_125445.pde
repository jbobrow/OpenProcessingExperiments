

//Declare PImage //
PImage alien1;
PImage alien2;
PImage alien3;
PImage alien4;
PImage alien5;

//Input Minim//
import ddf.minim.*;

//Declare sounds//
Minim minim;
AudioPlayer opening;
AudioSample insects;
AudioSample ufo;
AudioSample laser;
AudioSample explosion;
AudioSample dog;

void setup () {
  background (0);
  size (1280, 720);
  imageMode (CENTER);
  
//Text 1//  
  textSize(24);
  fill(#D3D313);
  text("PRESS 1 TO CONTINUE", 500, 360);   
  textSize(36);
  text("ALIEN ATTACK", 500, 300);
  textSize(24);
  
//set up images // 
  alien1 = loadImage ("Alien-attact-1.png"); 
  alien2 = loadImage ("Alien-attact-2.png");
  alien3 = loadImage ("Alien-attact-3.png");
  alien4 = loadImage ("Alien-attact-4.png");  
  alien5 = loadImage ("Alien-attact-5.png");  

//set up sounds //  
  minim = new Minim (this);
  opening = minim.loadFile ("Opening Audio 2.wav");
  opening. play (); 
  insects = minim.loadSample ("Insects.mp3");
  ufo = minim.loadSample ("UFO.mp3");
  laser = minim.loadSample ("Laser.mp3");
  explosion = minim.loadSample ("Explosion.mp3");
  dog = minim.loadSample ("Dog.wav");  
}

void draw () {  
  
}

// key trigger /
void keyPressed(){
  if (key == '1') {
  background (0);
  image (alien1, 640, 300);
  insects.trigger();
  text("PRESS 2 TO CONTINUE", 520, 600);  
  }
  
  
  if (key == '2') { 
  background (0);
  image (alien2, 640, 300);
  ufo.trigger();
  text("PRESS 3 TO CONTINUE", 520, 600);  
  }
  
  if (key == '3') { 
  background (0);
  image (alien3, 640, 300);
  laser.trigger();
  text("PRESS 4 TO CONTINUE", 520, 600);  
  }
  
  if (key == '4') { 
  background (0);
  image (alien4, 640, 300);
  explosion.trigger();
  text("PRESS 5 TO CONTINUE", 520, 600);  
  }
  
  if (key == '5') { 
  background (0);
  image (alien5, 640, 300);
  dog.trigger();
  text("THANK YOU FOR WATCHING !", 500, 600);  
  }
}

