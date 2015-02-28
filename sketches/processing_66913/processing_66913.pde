


void setup() {
  size(1000, 1000);
  smooth();
  //   PImage j;
  //   PImage c;
  ////   Pimage a;
  //   PImage t;
  //framerate(20);
}

void draw () {
  //PImage j;
  //j = loadImage("cat-code.jpg");
  //image(j,0,0);

  //PImage c;
  //c = loadImage("cat-fix-computer.jpg");
  //image(c,0,0);
  //PImage j;
  ///j = loadImage("cat-code.jpg");
  //image(j,0,0);

  //place("cat-fix-computer.jpg", mouseX, mouseY );

  //place("cat-fix-computer.jpg", 100, 100);
  //place("cat-fix-computer.jpg", 0, 200);
 place("cat-fix-computer.jpg", 200, 0);
  //
//  place("cat-fix-computer.jpg", mouseX, mouseY);
//
//  place("cat-code.jpg", 20, 0);
  place("cat-code.jpg", mouseX, mouseY);
//  //
//  //place("cat-popup.jpg", 0, 0);
place("cat-popup.jpg", mouseX, mouseY);
//  //
  //place("cat3.jpg", 40, 40);
  place("cat3.jpg", mouseX, mouseY);
}

void place(String file, int x, int y) {
  PImage c;
  c = loadImage(file);
  image(c, x, y);
}  
void mouseReleased(){
  place("cat-code.jpg", mouseX ,mouseY);
}   



