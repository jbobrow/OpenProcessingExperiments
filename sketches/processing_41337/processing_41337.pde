
PImage img;
PImage img1;

void setup (){
 
  size (400,340);
  img= loadImage ("TheGreatWaveofKanagawa.jpg");
  
  
}

void draw (){
 
 image (img, 0,0);

rect (290,230, 120,120);
copy(mouseX, mouseY, 20, 20, 300, 240, 100, 100);
  
}

