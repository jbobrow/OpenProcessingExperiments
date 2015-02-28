
PImage img;
   
void setup (){ 
size (334,500);
img= loadImage ("rain.jpg");
}
    
void draw (){     
image (img, 0,0);
copy(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY, 100, 100);
}


