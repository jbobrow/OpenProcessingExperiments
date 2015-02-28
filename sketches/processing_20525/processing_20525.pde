
void setup(){
size(309,410);
PImage b;
b = loadImage("image_lumiere.png");
background(b);
}
void draw(){
  if(mousePressed == true) {
    PImage s;
    s = loadImage("sp.png");
    image(s,mouseX,mouseY);
  }}

