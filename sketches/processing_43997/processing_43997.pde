
PImage img;

void setup() {
  size(300,300);
   img = loadImage ("sweet.jpg");
}

void draw(){
 tint (mouseX, mouseY, 200);
 image(img,0,0);
}
    
