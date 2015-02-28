
//manipulating the image
PImage myCat;

void setup(){
size(700,500);
myCat = loadImage("cat.jpeg");
image(myCat, 0, 0); 
}

void draw(){
 background(0);
 imageMode(CENTER);
 image(myCat, mouseX,mouseY); 
}
