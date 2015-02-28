
// random rectangle over the background of the image. the color 
//of the rectangles are picked from the colors in the composition.
// mouseX and mouseY are the deciding coordinates for the color.

PImage img;
int numb = 20; // no of rectangles
float []rec = new float [numb];

void setup() {
  size (300, 300);
  img = loadImage ("123.jpg");
  smooth();
  float []rec = new float [numb];
  for (int a =0; a < numb; a++) {
    rec[a] = random(150);
  }
}
void draw() {
}
void mouseClicked() {
  background(img);
  //SEEDING THE ARRAY
  for (int a =0; a < numb; a++) {
    int x = int (random(0, img.width));
    int y = int(random(0, img.height));

    //DEFIINING THE RECTANGLES AND THE COLOR
    float brush = dist(mouseX, mouseY, mouseX, mouseY);
    color myColor = img.get(x, y);
    fill (myColor);
    strokeWeight(3);
    rectMode(CENTER);
    rect (x, y, mouseX, mouseY);
    if ((mouseX > 100) && (mouseY>100)) 
      mouseX =20;
    mouseY=35;
  }
}


