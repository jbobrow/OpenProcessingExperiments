
/*

MOUSE
drag : draw

KEYS
c : circle
r : rectangle
t : triangule
del, backspace : erase sketch
s : save a png image

*/

import ddf.minim.*;

color[] paleta = {#00E867,#FFEA00,#0023FF,#E8006D,#FF9D00};
char modo = 'c';

//Audio
Minim minim;
AudioSample sound;

//Image
PImage logo;

void setup(){
  size(800,600);
  background(0);
  //For audio
  minim = new Minim(this);
  sound = minim.loadSample("sound.mp3");
  //Image
  logo = loadImage("logo.png");
}

void draw(){
  //Draw image
  image(logo, width/2 - 50, height/2 - 50, 100, 100);
  
  //Pressing keys
  if(mousePressed){
    //Random weight
    strokeWeight(int(random(1,5)));
    //Colors!
    stroke(paleta[int(random(0,4))]);
    //Empty
    noFill();
    //Size of the figure
    int size = int(random(10,100));
    
    switch(modo){
      //circle
      case 'c':
        ellipse( mouseX, mouseY, size, size);
        break;
        
      //rectangle
      case 'r':
        pushMatrix();
        rotate(radians(int(random(1,90))));
        rect( mouseX, mouseY, size, size);
        popMatrix();
        break;
        
      //triangle
      case 't':
        triangle( mouseX - size, mouseY, mouseX + size, mouseY, mouseX, mouseY + 2*size);
        break;
    }
  }
}

void keyPressed(){
  //Sound
  sound.trigger();
  
  if(key == 's' || key == 'S'){
    //Save all the images yo wanted
    saveFrame("screenshot-##.png");
  }

  if(key == DELETE || key == BACKSPACE){
    //re-draw the background
    background(0);
  }
  
  //Different modes of figures
  if(key == 'c' || key == 'C'){
    modo = 'c';
  }
  
  if(key == 'r' || key == 'R'){
    modo = 'r';
  }
  
  if(key == 't' || key == 'T'){
    modo = 't';
  }
}

