
PImage Y;
PImage G;

float aspectG;
float aspectY;
boolean paused = false;


void setup() {  
  background(180);
  size(800,800);
    Y = loadImage("yellow1.png");
    G = loadImage("green1.png");
}


void draw(){
  
  //DRAWING RANDOM PETALS
  if(!paused){
    aspectG = random(0, 1);
    image(G, random(-width,width), random(-height,height), G.width*aspectG, G.height*aspectG);
  }
}


//draw trupets wherever the mouse is pressed
void mousePressed(){
  imageMode(CENTER);
  aspectY=random(0,1);  
  image(Y, mouseX, mouseY, Y.width*aspectY, Y.height*aspectY);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(180); }
  
   
  //press the space bar to pause and unpause
  if(key == ' '){
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if(paused) {paused = false;} 
    //otherwise, pause it. 
    else {paused = true; }
    }
  }



