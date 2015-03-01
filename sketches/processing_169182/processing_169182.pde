
PImage Keule;


void setup() {
  size (500,500);
   Keule = loadImage("mikim painting.jpg");
}

void draw() {
  
  int imagewidth = Keule.width;
  int imageheight = Keule.height;
  
  tint (150);
 image ( Keule, 0,0, imagewidth/2 , imageheight/2);
 tint(150,0,0);
image ( Keule, 200,0, imagewidth/2 , imageheight/2);
}

