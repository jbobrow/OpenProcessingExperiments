
PImage bg;
PImage pfisch;
PImage tfisch;
PImage blasen;
int posX1, posX2;
//%%%%%bla
void setup() {
  size(500,350);
  bg = loadImage("aquarium.jpg");
  pfisch = loadImage("picassofisch.png");
  tfisch = loadImage("tintenfisch.png");
  blasen = loadImage("blasen.png");  
  posX1 = 0;
  posX2 = 0;
}

void draw(){
  image(bg,0,0,width,height);
  if(mouseX<width/2){
    posX1 = mouseX;
  }
  else
    posX2 = mouseX;
  image(tfisch, posX1, mouseY, 100,150);
  image(pfisch, width-posX1, mouseY, 100,150);  
  if(mousePressed){
    image(blasen, width/2, 100, 100, 100);
  }    
}

