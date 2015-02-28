
void setup () {
 size (500, 500); 
  background (11, 17, 118);
 frameRate (5);
}

void rainDrop (float posX, float posY, int rainSize, int repeat, color c) {
 stroke (178, 179, 180);
stroke (c);
posX = random(mouseX);
posY = random(mouseY);
ellipse (posX, posY, rainSize, rainSize);
ellipse (posX, posY, rainSize+repeat, rainSize + repeat);
ellipse(posX, posY, rainSize+repeat, rainSize +2*repeat);
  
}



void draw() {
 
  //rainDrop (80, 80, 10, 25);
  rainDrop (mouseX, mouseY, 20, 50, color (150));
  rainDrop (pmouseX, pmouseY, 40, 100, color(200));
   rainDrop (pmouseX-30, pmouseY-20, 30, 70, color(random(1,255)));
  fill(11, 17, 118);
  
  if(mousePressed == true) {
   rainDrop(mouseX, mouseY, 5, 5, color (250));
  }
  
}
