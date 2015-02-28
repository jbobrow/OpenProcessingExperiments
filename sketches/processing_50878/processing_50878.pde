
//Homework #5
//Tyler Porten (tporten) copyright 2012
//Press the mouse to print a face. Press 'space' to
//clear the face and have the face follow the mouse.


PImage tyler;

void setup(){
 size (400, 400);
 background(255, 255, 255, 20);
 noStroke();
smooth();
frameRate(100);



tyler = loadImage("tumblr_lu7fdt7eWl1qbgnt7o1_250.png");


imageMode(CENTER);
}


void draw(){


fill(255, 255, 255, 30);
rect(0, 0, width, height);

tyler(mouseX, mouseY, 100, 100);

if (mousePressed == true){
  noCursor();
}

}


void mousePressed(){
  
  if (mousePressed == true){
  noCursor();
}
  
noLoop();
 noStroke();
 fill(100);
 
 tyler(mouseX, mouseY, 100, 100);
 redraw();
 tyler(mouseX, mouseY, 100, 100);
}

void keyPressed(){
  if (key == ' '){
    loop();
  }
}

void tyler(float x, float y, float wd, float ht){
  fill(255);
  image(tyler, x, y, wd, ht);
  
}

