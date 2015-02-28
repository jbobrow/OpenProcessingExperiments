
PImage img;
 
void setup (){
size (392,296);
img= loadImage ("portrait.jpg");
}
 
void draw (){
tint (mouseX,mouseY,150);
image (img, 0,0);  
}

