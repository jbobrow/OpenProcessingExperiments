
PImage disappointed;
PImage pleased;

boolean isJenniferPleased;

void setup(){
  size(500, 500);
  disappointed = loadImage("disappointed.png");
  pleased = loadImage("pleased.png");
  
  isJenniferPleased = false;
}

void draw(){
  background(30, 100, 188);
  
  if(isJenniferPleased == false) {
    image(disappointed, 0, 0);
  }
  
  if (isJenniferPleased == true) {
    image(pleased, 0, 0);
  }
}

void mousePressed(){
  isJenniferPleased = !isJenniferPleased;
}


