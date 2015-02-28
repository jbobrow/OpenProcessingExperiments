
PImage trumpet;
PImage oval;
PImage petals;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  trumpet  = loadImage("motif 4.png");
  oval = loadImage("motif 5.png");
  petals = loadImage("motif 6.png");
  
  

background (190, 123, 123);
}



void draw(){
  
  float speed=dist(pmouseX, pmouseY, mouseX, mouseY);
  speed= constrain (speed,0,200);
  speed=map(speed,0,200, 0,200);
  strokeWeight(speed);
  stroke(mouseX,mouseY,400);
  println(speed);
 image(oval, mouseX, mouseY, 200, 400);
   
 
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
  
  //press 'b' to draw a random oval once'
  if (keyPressed) { 
  if (key == 'b') {
    image(oval , mouseX, mouseY, 400, 200);
  }
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

 
  



