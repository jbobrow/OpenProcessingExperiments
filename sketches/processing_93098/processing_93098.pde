
float diam = 20;

void setup(){
  //Generates a random shade of black background
 background(random(0,255));
 size(500, 500);
}

void draw(){
  //Creates a square that moves along X axis, colour is set to the position on X axis
  //Creates a circle that moves along Y axis, colour is set to random
  //background(255);
  fill(0, mouseX, 150);
  rectMode(CENTER);
  rect(mouseX, 250, 50, 50);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(250, mouseY, 50, 50);
}

void mousePressed(){
  //Creates a small random coloured circle anywhere on the screen
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(random(0,width),random(0,height),diam,diam); 
}

void keyPressed(){
  //Creates a new background of random colour
  background(random(0,255),random(0,255),random(0,255));
}


