
PImage clear;
PImage rounded;
PImage layer;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  clear = loadImage("usebeetle5.png");
  rounded = loadImage("usebeetle4.png");
  layer = loadImage("UseMotif4.png");

}



void draw(){
  
  //DRAWING RANDOM PETALS
  if(!paused){
    aspect = random(-20,5
    );
    image(layer, random(width), random(height), layer.width*aspect,layer.height*aspect);
  }
}


//draw trupets wherever the mouse is pressed
void mousePressed(){
    image(rounded, mouseX, mouseY, rounded.width/4, rounded.height/4);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(0);
  }
  
  //press 'o' to draw a random oval once'
  if (key == 'o' || key == 'O') {
    image(clear, random(width), random(height), clear.width/3,clear.height/3);
  }
  
  
  //press the space bar to pause and unpause
  if(key == ' '){
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if(paused) {paused = false;} 
    //otherwise, pause it. 
    else {paused = true; }
  }
}

 
  


