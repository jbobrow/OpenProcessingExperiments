
PImage Sun;
float speed = .5;
float move;

void setup() {  //setup function called initially, only once
size(300, 300);
Sun=loadImage ("http://www.picturesnew.com/media/images/sun.png");
background(235);  //set background white
 
}

void draw() {  //draw function loops 
move=move+speed;
image (Sun, 35, move);
if (move > 50) {
move=0;
}
}
