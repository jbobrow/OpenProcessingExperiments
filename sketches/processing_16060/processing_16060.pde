
PImage foto;
void setup(){
  size (800,800);
background (0,0,0);
 // foto = loadImage ("yo.tif");
}
void draw (){
  // background (0,0,0);
   foto = loadImage ("yo.tif");
  // fill (255);
  image (foto,mouseX, mouseY, 300, 200);
}
  

