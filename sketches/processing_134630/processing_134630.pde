
PImage cercle1;

void setup() {

  size(600, 700);

  cercle1 = loadImage ("noir.jpg");
}


void draw() {

  float a = map(mouseX, 0, width, 100, 1000);
  background(a, a, a);
  ellipse (400, a, 300, mouseY/2);  



  float cercle1X = map(mouseX, 100, width/2, 5, -1000);
  image(cercle1, cercle1X, 250);



  fill(0);


  float b = map(mouseX, 200, width, 3, 1000);
  ellipse (300, b, 150, mouseY);
  ellipse (mouseX, b+30, 100, 5);
  ellipse (400, b*2, 120, mouseY);
}



