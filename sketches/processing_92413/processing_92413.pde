
PImage trumpet;
PImage oval;
PImage petals;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  trumpet  = loadImage("Motif_1.png");
  oval = loadImage("Motif_3.png");
  petals = loadImage("Motif_5.png");

}



void draw(){
  
  //DRAWING RANDOM PETALS
  if(!paused){
    aspect = random(0, 2.0);
    image(petals, random(width), random(height), petals.width*aspect, petals.height*aspect);
  }
}


//draw trupets wherever the mouse is pressed
void mousePressed(){
    image(trumpet, mouseX, mouseY, trumpet.width/10, trumpet.height/10);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(0);
  }
  
  //press 'o' to draw a random oval once'
  if (key == 'o' || key == 'O') {
    image(oval, random(width), random(height), oval.width/4,oval.height/4);
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

 
  


