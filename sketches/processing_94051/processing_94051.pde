
PImage motif5;
PImage motif8;
PImage motif7;

float aspect;
boolean paused = false;

void setup() {
  size(800,800);
  motif5  = loadImage("motif5olivia.png");
  motif8 = loadImage("motif8olivia.png");
  motif7 = loadImage("motif7olivia.png");

}



void draw(){
  
  //DRAWING RANDOM PETALS
  if(!paused){
    //aspect=random(0,2.0)<originally written
    aspect = random(0, .50);
    image(motif7, random(width), random(height), motif7.width*aspect, motif7.height*aspect);
  }
}


//draw trupets wherever the mouse is pressed
void mousePressed(){
  //image(motif5, mouseX, mouseY, motif5.width/10, motif5.height/10);
    image(motif5, mouseX, mouseY, motif5.width/5, motif5.height/5);
  }



void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(255,231,186);
  }
  
  //press 'o' to draw a random oval once'
  if (key == 'o' || key == 'O') {
    image(motif8, random(width), random(height), motif8.width/10,motif8.height/10 );
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

 
  



