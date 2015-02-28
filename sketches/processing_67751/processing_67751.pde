
int x=10;
PImage p;

void setup() {
  size(500,500);
p = loadImage("cat.png");

}

void draw() {
image(p, mouseX, mouseY, 100, 100);
}

//rect(x,x,20,20);
//ellipse(x,x,20,30);



