
Panda [] panda = new Panda [3];
int xPos = 90;

void setup() {
size(400,400);
smooth();

 for (int i = 0; i < panda.length; i++) {
  panda[i] = new Panda(xPos,200,100,115,random(1,2));
  xPos += 110;
 }
}

void draw() {
  if (mouseX < width/3) {
  background(3,88,255);
} else if (mouseX < 2 * width/3) {
  background(3,173,255);
} else {
  background(40,222,205);
}

  for (int j = 0; j < panda.length; j++) {
  panda[j].display(); 
  }
  
  if((mouseX > width/8) && (mouseX < 150)) {
    panda[0].growAndShrinkBody();
  } else if (mousePressed) { 
    panda[1].jiggle();
  } else if ((mouseX > width-100) && (mouseX < width)) {
    panda[2].moveUpAndDown();
}
}




  




