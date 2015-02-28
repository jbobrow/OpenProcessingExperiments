
PImage img;

void setup(){
  size(1000,700);
  background(255);
  img=loadImage("cowbow1.png");
}

void draw(){
  
  if (keyPressed){
    background(255);
  }
  
  //background(255);
  noCursor();
  imageMode(CENTER);
  image(img,mouseX,mouseY);
  
  
}

void mousePressed() {
  background(255);
}


