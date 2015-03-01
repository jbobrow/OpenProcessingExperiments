
PImage myCat;
 
void setup(){
size(700,500);
myCat = loadImage("photo_1.JPG");
image(myCat, 0, 0);
}
 
void draw(){
 background(0);
 imageMode(CENTER);
 image(myCat, mouseX + 84,mouseY + 325);
}



