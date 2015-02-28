
void setup() {
  size (1024,768);
}

void draw() {
  
PImage img;
img = loadImage("plaid.png");
image(img,0,0);
tint(mouseX/4,mouseY/3,mouseY/4,125);
//rect(0,0,1024,768);

//image(img, 0, 0);
//tint(0, 153, 204, 126);  // Tint blue and set transparency
//image(img, 50, 0);
}


