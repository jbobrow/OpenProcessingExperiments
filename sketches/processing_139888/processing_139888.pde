
void setup() {
  size(960, 1000);
}

void draw() {
  //background (150,(int) random (100),85);
 // teeth (mouseX, mouseY, 10, 10, 5, 10);
  
  if (mousePressed) {
    fill((int) random (100));
    
  } else {
    fill(255);
  }
  
  rect (mouseX-100, mouseY-80, 200,80);
  //head
  ellipse(mouseX, mouseY, 200, 160);
  //eyes
  ellipse (mouseX-60, mouseY-40,60,30);
  ellipse (mouseX+60, mouseY-40,60,30);
  //pupils
  fill (255,0,0);
  ellipse (mouseX-60, mouseY-40,10,10);
  ellipse (mouseX+60, mouseY-40,10,10);
  fill (255);
  ellipse (mouseX, mouseY , 60, 60);
 triangle(mouseX-60, mouseY+30, mouseX,mouseY+30, mouseX-30, mouseY+100);
 triangle(mouseX+60, mouseY+30, mouseX,mouseY+30, mouseX+30, mouseY+100);
 //horn
 fill ((int) random (50,200),50, (int) random (50,200));
 triangle(mouseX, mouseY-200, mouseX-20,mouseY-60, mouseX+20, mouseY-60);
 // rect (
}

//void teeth (int tx, int ty, int txt, int tyt, int txf, int tyf) {
//  triangle (tx, ty, txt, tyt, txf, tyf);
//}


