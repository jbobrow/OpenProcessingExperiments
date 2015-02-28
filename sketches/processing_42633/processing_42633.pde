
PImage img;
PImage img1;
  
void setup (){  
size (350,500);
img= loadImage ("syd.jpg"); 
}
   
void draw (){
    
image (img, -20,0);  
rect (300,0, 120,0);
copy(mouseX, mouseY, 100, 100, 0, 300, 400, 300);
     
}

