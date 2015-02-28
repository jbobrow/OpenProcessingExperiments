
PImage img;
PImage img1;
 
void setup (){
   
  size (400,600);
 img= loadImage ("dresslight.jpg");
    
    
}
  
void draw (){
   
 image (img, -60,0);
  
rect (290,0, 120,0);
copy(mouseX, mouseY, 100, 100, 0, 300, 466, 300);
    
}

