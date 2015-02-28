
PImage img;
    
void setup (){
size (1248,1248);
img= loadImage ("rug.jpg");
}
     
void draw (){    
image (img, 0,0);
copy(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY, 500, 500);
}




