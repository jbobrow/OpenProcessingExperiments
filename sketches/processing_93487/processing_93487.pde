
PImage bone; PImage cir; PImage bonz;

float aspect; boolean paused = false;

void setup() {

size(800,800);
bone  = loadImage("alh bone5.png");
cir = loadImage("alh cirrr.png");
bonz = loadImage("alh sw.png");
}

void draw(){

//DRAWING RANDOM PETALS
if(!paused){
  aspect = random(0, 6.0);
  image(bone, random(width), random(height), bone.width*aspect, bone.height*aspect);
}
  image(cir, mouseX, mouseY, cir.width/10, cir.height/10);
}

//draw trupets wherever the mouse is pressed void mousePressed(){


void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(0);
}

//press 'o' to draw a random oval once'
if (key == 'o' || key == 'O') {
  image(bonz, random(width), random(height), bonz.width/4,bonz.height/4);
}


//press the space bar to pause and unpause
if(key == ' '){
  //if it is paused (i.e. paused == true) make paused be false
  //i.e. if it's paused, unpause it.
  if(paused) {paused = false;}
  //otherwise, pause it.
  else {paused = true; }
}


if(key=='1') saveFrame("01.png"); 
if(key=='2') saveFrame("02.png");
if(key=='3') saveFrame("03.png"); 
if(key=='4') saveFrame("04.png");
if(key=='5') saveFrame("05.png"); 
if(key=='6') saveFrame("06.png"); 
if(key=='7') saveFrame("07.png"); 

}


