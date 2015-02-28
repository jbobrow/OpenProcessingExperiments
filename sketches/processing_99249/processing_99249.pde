
PImage arch;
  
  void setup(){ 
  size(400, 400);
  arch = loadImage("Manuel.jpg");
}

void draw() {
  background(204);
  int mx = constrain(mouseX, 0, 99);
  int my = constrain(mouseY, 0, 99);
  
  arch.loadPixels();
  arch.pixels[my*width + mx] = color(0);
  arch.updatePixels();
  image(arch, 50, 0);
}


