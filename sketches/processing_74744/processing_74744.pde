
PImage img2;
PImage img3;
PImage img4;
PImage img5;
  
int value = 0;

void setup(){
  size(400, 400, P2D);
  smooth();
  img2 = loadImage("storm.png");
  img3 = loadImage("jedi_1.png");
  img4 = loadImage("Star_Wars_Death_Star.jpg");
  img5 = loadImage("Melfal.png");
 
  noCursor();

}

void draw(){
  background(0);
  
  imageMode(CORNER);
  tint(255, value);
  //morte nera
  image(img4, 0, 0);
  
  //image(variabile, x, y);
      
  //image(img2, 0, 0, mouseX, mouseY);
  imageMode(CENTER);
  
  if(mouseX > 200){
    tint(255, 255);
  } else {
    tint(255, 0);
  } 
    //darth vader
   imageMode(CORNER);
  image(img3, 242, 151);
  
  if(mouseX < 200){
    tint(255, 255);
  } else {
    tint(255, 0);
  } 
    //darth vader
   imageMode(CORNER);
  image(img2, 0, 151);
  
  if(mouseX > 0){
    tint(255, 255);
  }
    //millenniun falcon
  image(img5, mouseX, mouseY);
  
}

void mouseDragged() {
  value = value + 2;
  if (value > 255) {
    value = 0;
  }
}

