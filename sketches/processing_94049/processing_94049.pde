
PImage glit; PImage pink; PImage sushi;

float aspect; boolean paused = false;

void setup() {
background(223, 11, 123);
size(800,800); 
glit = loadImage("FREDDIEPOWELL2.png"); 
pink = loadImage("FreddiePowell.png"); 
sushi = loadImage("fred.jpg");

}

void draw(){
line(200,200,mouseX,mouseY);
//DRAWING RANDOM PETALS 
if(!paused){

aspect = random(0, 2.0);
image(glit, random(width), random(height), glit.width*aspect, glit.height*aspect);
}

}

//draw trupets wherever the mouse is pressed 
void mousePressed(){

image(pink, mouseX, mouseY, pink.width/10, pink.height/10);
}

void keyPressed(){
  if(key == 'c' || key == 'c') {
    background(0);
  }
  
  if (key == 'w' || key =='W'){
    
    image(sushi, random(width), random(height), sushi.width/4,sushi.height/4);
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







