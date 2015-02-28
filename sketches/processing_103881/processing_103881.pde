
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;

void setup() {
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");
  img8 = loadImage("8.jpg");
  img9 = loadImage("9.jpg");

  size(750, 600);
}
void draw() {
  if (mouseX >0 && mouseX < 250 && mouseY > 400 && mouseY <600){ 
  image(img1, 0, 0);
  }
   if (mouseX >250 && mouseX < 500 && mouseY > 400 && mouseY <600){ 
  image(img2, 0, 0);
  }
   if (mouseX >500 && mouseX < 750 && mouseY > 400 && mouseY <600){ 
  image(img3, 0, 0);
  }
   if (mouseX >0 && mouseX < 250 && mouseY > 200 && mouseY <400){ 
  image(img4, 0, 0);
  }
   if (mouseX >250 && mouseX < 500 && mouseY > 200 && mouseY <400){ 
  image(img5, 0, 0);
  }
   if (mouseX >500 && mouseX < 750 && mouseY > 200 && mouseY <400){ 
  image(img6, 0, 0);
  }
   if (mouseX >0 && mouseX < 250 && mouseY > 0 && mouseY <200){ 
  image(img7, 0, 0);
  }
  if (mouseX >250 && mouseX < 500 && mouseY > 0 && mouseY <200){ 
  image(img8, 0, 0);
  }
   if (mouseX >500 && mouseX < 750 && mouseY > 0 && mouseY <200){ 
  image(img9, 0, 0);
  }
}



