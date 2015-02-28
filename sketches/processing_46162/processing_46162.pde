
PImage myimage1;
PImage myimage2;

void setup() {  
  size(500, 500);
  myimage1= loadImage ("Unknown.jpeg");
  myimage2= loadImage ("Unknown-1.jpeg");
}

void draw() {
  tint (220, 20, 205, 10);
  image(myimage1, 25, 25, 450, 450);
  tint (195, 150, 125, 30);
  image(myimage2, mouseX, mouseY, 40, 40);
  
}








