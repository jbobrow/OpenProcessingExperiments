
PImage im;

void setup() {
size(400,400);
}

void draw() {
im = loadImage("pato2.jpg");

image(im,0,0,width, height);
//image(im,width/2,0,0, height);
//image(im,0,0,mouseX,mouseY);

if(mousePressed)
fill(get(mouseX, mouseY));
rect(mouseX, mouseY,100,100);
PFont font;
font = loadFont("DialogInput-48.vlw");
textFont(font);
text(35,width/3,300);
text("pato");

}

