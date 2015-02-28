
PImage swirl;
PImage drips;
PImage bug;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  background(250);
  swirl  = loadImage("pattern10.png");
  drips = loadImage("pattern11.png");
  bug = loadImage("pattern3.png");

}



void draw(){
  
  //DRAWING RANDOM BUG
  if(!paused){
    aspect = random(0, 2.0);
    image(bug, random(width), random(height), bug.width*aspect, bug.height*aspect);
    
    fill(205,  55,  0, 10);
    rect(0, 0, width, height);
    
  }
}


//draw swirl wherever the mouse is pressed
void mousePressed(){
    image(swirl, mouseX, mouseY, swirl.width/2, swirl.height/2);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(205,  55,  0,  14285);
  }
  
  //press 'o' to draw a random drips once'
  if (key == 'o' || key == 'O') {
    image(drips, random(width), random(height), drips.width/2,drips.height/2);
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

 
  



