
PImage img;


void setup() {
  size(1000, 1000);
  background(255, 0, 230);
  img = loadImage("selfie peeing.png");
 


}

void draw() {
  
    if (mousePressed == true) {
      
    image(img, mouseX-100, mouseY-100, 280, 188);
    
  }
  else { image(img, mouseY, 400, 288, 180);}

 }


 


