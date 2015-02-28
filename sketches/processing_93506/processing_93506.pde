
PImage motif5;

float aspect; boolean paused = false;

void setup() {

size(800,800);
motif5  = loadImage("motif5.png");
background(165, 227, 226);

}

void draw(){

//DRAWING RANDOM PETALS
if(!paused){
  aspect = random(0, 2.0);
  image(motif5, random(width), random(height), motif5.width*aspect, motif5.height*aspect);
//}  image(trumpet, mouseX, mouseY, trumpet.width/10, trumpet.height/10); - this features mouse function
}  image(motif5, motif5.width/10, motif5.height/10);

{
image(motif5, mouseX, mouseY, motif5.width/10, motif5.height/10);
} 
}
//draw trupets wherever the mouse is pressed void mousePressed(){
//belongs in void draw::::::
// image(trumpet, mouseX, mouseY, trumpet.width/10, trumpet.height/10);


void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(165, 227, 226);
}

//press 'o' to draw a random oval once'
if (key == 'o' || key == 'O') {
  image(motif5, random(width), random(height), motif5.width/4,motif5   .height/4);
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

