
PImage foto;

void setup(){
  size (800, 650);
    background (0);
  
  foto = loadImage ("starbolson.jpg");
  
}

void draw(){

  
  image (foto, 0,0, 800, 650);
  
 }


