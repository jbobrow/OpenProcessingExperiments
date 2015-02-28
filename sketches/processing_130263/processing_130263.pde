
PImage img1;
PImage img2;
PImage img3;

void setup()
  {
 
  size(500, 300);
  background(#ffffff);
  
  img1 = loadImage("eins.JPG");
  img2 = loadImage("zwei.JPG");
  img3 = loadImage("drei.JPG");
  }
  
  void draw() {
  
  image(img1, 0,0);
   if
  (mouseX > 160 && mouseX < 380 && mousePressed == true)
  image(img3,0,0);
  else
  
  if
  (mouseX > 160 && mouseX < 380  == true)
  image(img2, 0,0); 
  
  else 
  image(img1,0,0);
  
 
  
  }
  
  
 


