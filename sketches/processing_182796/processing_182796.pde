
//Dillan Teague
// Exercise 4; Poke, Rub Tickle


void setup (){
  size (600,400);
  smooth();
  background (255);
  frameRate(7);
  
}

void draw(){
  
  noStroke();
  fill(200,0,75); //where mouse is at moment
  ellipse (mouseX, mouseY, 20,20);
  fill(0,200,200); //where mouse was
  ellipse (pmouseX, pmouseY, 20,20);
  stroke (200,0,75); //connects in between
  line(mouseX, mouseY, pmouseX, pmouseY);
  
  if( mousePressed == true) { //new color scheme when mouse held down
  noStroke();
  fill (0,255,0);
  ellipse (mouseX, mouseY, 20, 20);
  fill (255,0,255);
  ellipse (pmouseX, pmouseY, 20,20);
  stroke (0,255,0);
  line (mouseX, mouseY, pmouseX, pmouseY); 
  } 
}

void mousePressed(){ // changes background color without wiping drawing functions, when mouse pressed first time
  background (0);
}

void mouseClicked(){ //starts over to blank white background
  background(255);
}


