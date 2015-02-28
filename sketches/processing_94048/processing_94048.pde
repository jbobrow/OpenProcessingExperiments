

PImage trumpet;
PImage oval;
PImage petals;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  trumpet  = loadImage("pattern7.png");
  oval = loadImage("pattern2.png");
  petals = loadImage("pattern6.png");

}



void draw(){
  
  //DRAWING RANDOM PETALS
  if(!paused){
    aspect = random(0, 0.5);
    image(petals, random(width), random(height), petals.width*aspect, petals.height*aspect);
  }
}


//draw trupets wherever the mouse is pressed
void mousePressed(){
    image(trumpet, mouseX, mouseY, trumpet.width, trumpet.height);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
     fill(200,200,300,150);
    rect(0, 0, width, height);
  }
  
  //press 'o' to draw a random oval once'
  if (key == 'o' || key == 'O') {
   tint(0,20,255,100);
//   tint(210,190,255,100);
//***why does one press of the "o" affect all sequential interactions??
    image(oval, random(width), random(height), oval.width/4,oval.height/4);
//noTint();
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

 
  



