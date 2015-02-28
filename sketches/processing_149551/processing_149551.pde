
PImage img;
int value = 0;

void setup() {
  size(283,500);
  background(0);
  img = loadImage("Afro_budda.jpg");
}

void draw(){
  noStroke();
  image (img, 0, 0);
  tint(value);
  
  if (mousePressed == true ){
    tint(random(100,250),random(100,250),random(40));    
  }
} 
  void mouseReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 30;
  }
}
  
  


