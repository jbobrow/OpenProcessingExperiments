
PImage flower;
PImage dropplet;
PImage petal;
int x=0;
int y=0;

float aspect; boolean paused = false;

void setup() {

size(800,800);
flower  = loadImage("motif13.png");
dropplet =loadImage("Motif10.png");
petal = loadImage ("Motif14.png");
}

void draw(){


    {fill(255);
 
line(0,0,mouseX,mouseY);}


//DRAWING RANDOM PETALS
if(!paused){
  aspect = random(0, 2.0);
  image(flower, random(width), random(height), flower.width*aspect, flower.height*aspect);
fill(0,5);
rect(0,0,800,800);
image (dropplet,x,y,50,50);
x=x+8;
y=y+6;
}
}


//draw dropplet wherever the mouse is pressed 



void mousePressed(){

  image(dropplet, mouseX, mouseY, dropplet.width/10, dropplet.height/10);
}
void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(0);
}

//press 'o' to draw a random oval once'
if (key == 's' || key == 's') {
  image(petal, random(width), random(height), petal.width/4,petal.height/4);
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

