
PImage minigoat;

PImage minigoat2;

PImage minigoat3;
 
void setup() {
  size (500,400);
background (255);
  minigoat = loadImage("minigoat.png");
  minigoat2 = loadImage("minigoat2.png");
  minigoat3 = loadImage("minigoat3.png");
}
 
void draw() {
 
line(100, 50, 100, 350);
line(100, 50, 400, 85);
line(400, 85, 100, 350);
line(100, 350, 300, 350);
line(300, 350, 400, 85);

image(minigoat, 75, 200, 180, 105);
 
image(minigoat2, 155, 125, 185, 110);
  
image(minigoat3, 235, 50, 190, 115);
 
}



