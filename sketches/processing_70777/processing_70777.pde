

PImage img;

  void setup() {
    
    size (653,531);

 
  img = loadImage("Jellyfish.jpg");
  
  background(img);
}

  
  void draw() {

  
 ellipse(mouseX, mouseY, 40, 40);
 stroke(204, 102, 0);
noFill();

  //fill (100, 180, 90);
  
}
  




