
PImage okra;
PImage rock;
PImage wing;

void setup(){
size(500,550);
okra = loadImage("okra mini.jpg");
rock = loadImage("rock mini.jpg");
wing = loadImage("wing mini.jpg");
}

void draw(){
image(okra, 0, 0);
tint(255,255,255,20);
image(rock, 0,0);
tint(255,255,255,10);
image(wing,0,0);
}

