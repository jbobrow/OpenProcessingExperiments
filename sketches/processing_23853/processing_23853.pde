
import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage img;

void setup(){
  size(700, 450);
  background(0);
}

void draw(){
  tint (255, 100);   
}

void keyPressed() {
  if (key == '1') {
  img = loadImage("window.jpg");
  image(img,0,-70);
  minim = new Minim(this);
  player = minim.loadFile("goingup.mp3", 2048);
  player.play();
  }
  else if (key == '2'){
  img = loadImage("window.jpg");
  image(img,0,-120);
  minim = new Minim(this);
  player = minim.loadFile("secondfloor.mp3", 2048);
  player.play();
  } 
  else if (key == '3'){
  img = loadImage("window.jpg");
  image(img,0,-170);  
  minim = new Minim(this);
  player = minim.loadFile("thirdfloor.mp3", 2048);
  player.play();
  }  
  else if (key == '4'){
  img = loadImage("window.jpg");
  image(img,0,-220);
  minim = new Minim(this);
  player = minim.loadFile("fourthfloor.mp3", 2048);
  player.play();  
  } 
  else if (key == '5'){
  img = loadImage("window.jpg");
  image(img,0,-270);
  minim = new Minim(this);
  player = minim.loadFile("fifthfloor.mp3", 2048);
  player.play();
  } 
  else if (key == '6'){
  img = loadImage("window.jpg");
  image(img,0,-320);
  minim = new Minim(this);
  player = minim.loadFile("sixthfloor.mp3", 2048);
  player.play();  
  } 
  else if (key == '7'){
  img = loadImage("window.jpg");
  image(img,0,-370); 
   minim = new Minim(this);
  player = minim.loadFile("seventhfloor.mp3", 2048);
  player.play(); 
  } 
  else if (key == '8'){
  img = loadImage("window.jpg");
  image(img,0,-420);
  minim = new Minim(this);
  player = minim.loadFile("eighthfloor.mp3", 2048);
  player.play();  
  } 
  else if (key == '9'){
  img = loadImage("top.jpg");
  image(img,0,0);
  minim = new Minim(this);
  player = minim.loadFile("ninthfloor.mp3", 2048);
  player.play();
 } 
}

