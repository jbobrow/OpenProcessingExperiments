
PImage img;
PImage img1;

void setup (){
  
  size (400,600);
  img= loadImage ("06_t.jpg");
   
   
}
 
void draw (){
  
 image (img, 0,0);
 
rect (290,0, 120,0);
copy(mouseX, mouseY, 100, 100, 0, 466, 466, 300);
   
}

