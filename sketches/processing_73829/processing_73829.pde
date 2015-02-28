
PImage CatImg;
void setup(){
  size(500,500);
  noStroke();
  CatImg = loadImage ("CatImg.jpg");
}

void draw() {
  
  if (mousePressed==true) {
    rect(mouseX,mouseY, 50,50);
    fill( color(90,150,20));
  }

  {
    if (keyPressed) {
      if (key=='1' || key == '!') {
        ellipse(mouseX, mouseY, pmouseX, pmouseY);
        fill( random(255), random(255), random(255), random(255));
      }
    }
  }
  if (keyPressed) {
    if (key=='z' || key == 'Z') {
      int ix = mouseX - CatImg.width/2;
      int iy = mouseY - CatImg.height/2;
      image(CatImg, ix, iy);
    }
  }
}

