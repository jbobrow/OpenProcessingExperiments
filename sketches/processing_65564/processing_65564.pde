

void setup() {
  size(480, 480);
}

void draw() {

  float sizex = 50;
  float sizey = 50;
  //double valuex = 1;

  //while(valuex = 1){
  //  float sizex = random(0,50);
  //  float sizey = random(0,50);
  //  ellipse(240,240,sizex,sizey);
  // }
  if (mousePressed) {
    fill(random(0, 255),random(0, 255),random(0, 255));
    sizex = random(0, 50);
    sizey = random(0, 50);
    ellipse(mouseX+sizex*2, mouseY+sizey*2, sizex/2, sizey/2);
    ellipse(mouseX+sizex*2, mouseY-sizey*2, sizex/2, sizey/2);
    ellipse(mouseX-sizex*2, mouseY+sizey*2, sizex/2, sizey/2);
    ellipse(mouseX-sizex*2, mouseY-sizey*2, sizex/2, sizey/2);
  } 
  else {
    fill(random(0, 255));
    sizex = random(30, 100);
    sizey = random(30, 100);
  }
  ellipse(mouseX, mouseY, sizex, sizey);
}


