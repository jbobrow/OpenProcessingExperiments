
PImage spaceship; PImage fire; PImage water; PImage land;

float aspect; boolean paused = false;

void setup() {

  size(800,800);
  background (0);
  spaceship  = loadImage("9 smaller size.png");  
  fire = loadImage("6 smaller size.png");
  water= loadImage("7 editted.png");
  land= loadImage("2.png");
  frameRate(10);
}

void draw(){

//DRAWING RANDOM SPACESHIPS
if(paused==false){
  aspect = random(0,2);
  image(spaceship, random(width), random(height), spaceship.width*aspect, spaceship.height*aspect);
    //draw fire wherever the mouse is pressed 
//void mousePressed(){
//image(fire, mouseX, mouseY, fire.width/23, fire.height/23);
}

  line(0,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
}



void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(0);
}


//press 'w' to draw a random oval once'
if (key == 'w' || key == 'w') {
  image(water, random(width), random(height), water.width,water.height);
}

//press 'l' to draw a random oval once'
if (key == 'l' || key == 'l') {
  image(land, random(width), random(height), land.width,land.height);
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


