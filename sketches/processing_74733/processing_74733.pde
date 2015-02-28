
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(600, 600);
  
  img = loadImage("weddingfashion.jpg");
  img2 = loadImage("haze.jpg");
  img3 = loadImage("de51gn.jpg");
  img4 = loadImage("aen.jpg");
}

void draw() {
  noTint();
  image(img, 0, 0);
  image(img2, 0, 300);
  image(img3, 300, 0, mouseX, mouseY);
  tint(mouseX, mouseY, 0);
  image(img4, 300, 300);
  
  if(mousePressed && mouseX < 300 && mouseY < 300){
  tint(100);  
  image(img, 0, 0);
}
  
  if(mousePressed && mouseX < 300 && mouseY > 300){
    noTint();
    image(img2, 0, 0);
    image(img2, 300, 0);
    image(img2, 300, 300);
   }
    
  
  
}


