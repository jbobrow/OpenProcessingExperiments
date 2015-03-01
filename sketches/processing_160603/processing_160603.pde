
PImage sunny;
float speed = 1;
float move;

void setup() {  //setup function called initially, only once
size(810, 810);
sunny=loadImage ("http://i65.photobucket.com/albums/h204/dave-ette/happy20sun.gif");

background(300);  //set background white
 
}

void draw() {  //draw function loops 
move=move+speed;
image (sunny, 10, move);
if (move > 475) {
move=0;
}
}
