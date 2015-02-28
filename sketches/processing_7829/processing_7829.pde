

PImage img; // a variable to store an image
color c;//a variable to control colour

void setup(){
  size(600,600);//
  img = loadImage("Bird Pic.JPG");
  image(img,0,0,600,600); 
  rectMode(CENTER);// says where the rects go
  noStroke();
  smooth(); //render
}

void draw(){

  PImage slice = img.get(mouseX,mouseY,1,600);// get a one pixel slice
  int ypos = 300;// increase y position
  int squaresize = 150;//decrease size
  int squaresize2 = 600;//increase size
  rect(300,ypos,squaresize,squaresize); //square in the middle of the screen
 rect(300,ypos,squaresize2,squaresize2);//square in the middle of the screen
}
void mousePressed(){
  c = img.get(mouseX,mouseY);//translates the mouse position into colour
}
void mouseDragged(){
  fill(c,100);//translates the variable colour
  ellipse(mouseX,mouseY,500,500);
}




