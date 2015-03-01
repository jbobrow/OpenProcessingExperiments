
PImage doge;
float speed = 4.0;
float move;

void setup() { 
size(600,600);
doge=loadImage("http://th05.deviantart.net/fs71/200H/i/2014/164/3/c/such_doge__png__by_vendus-d7ma3k5.png");
}
void draw() { 
move=move+speed;
background(random(60,50),random(100,255),random(0,25));
image(doge,60,move);
if (move > 600) {
move=0;
}
}
