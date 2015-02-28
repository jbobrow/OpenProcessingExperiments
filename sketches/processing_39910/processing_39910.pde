
PImage diamond;
PImage PinkOCTO;
PImage GreyHOOND1;



void setup() {
  size(800, 800);
  smooth();
  background(#FFFFFF);

  diamond = loadImage("diamond.png");
  PinkOCTO = loadImage("PinkOCTO.png");
  GreyHOOND1 = loadImage("GreyHOOND1.png");
}

void draw() {

  float r = map(mouseY, 0, height, 0, 100);
  float x = mouseX + random(-r, r);
  float y = mouseY + random(-r, r);

 
  if (mousePressed) {
    image(GreyHOOND1, x, y, r, r);
  }
  
  if(keyPressed){
  
 if (key == 'p'){
    image(PinkOCTO,x,y,r,r);
  }
 
 if (key == 'd'){
   image(diamond,x,y,r,r);
 }

  if (keyPressed) {
    if (key == 's') {
      save("myfile.jpg");
    }

    if (key ==' ') {
      background(#FFFFFF);
    }
    }
  }


}


