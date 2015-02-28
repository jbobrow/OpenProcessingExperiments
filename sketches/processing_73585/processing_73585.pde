
PImage alphaImg;

void setup () {
  size(800, 600);
  noCursor();
  background(255);
  alphaImg = loadImage ("Dailey1.png");
}


void draw() {



  if (mousePressed==true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(1);
  }


  {
    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        ellipse(mouseX, mouseY, pmouseX, pmouseY);
        fill( random(255), random(255), random(255), random(255));
      }

      if (keyPressed) {
        if (key=='v' || key =='V') {
          rect(mouseX, mouseY, pmouseX, pmouseY);
          fill(random(255), random(255), random(255), random(255));
        }
      }



      if (keyPressed) {
        {
          if (key=='c' || key =='C') {
            triangle(mouseX, mouseY, pmouseX, pmouseY, mouseX+100, mouseY+100);
            fill(random(255), random(255), random(255), random(255));
          }
        }


        if (keyPressed) {
          {
            if (key=='x' || key =='X') {
              int ix = mouseX - alphaImg.width/2;
              int iy = mouseY - alphaImg.height/2;
              image(alphaImg, ix, iy);
            }
          }
        }
      }
    }
  }
}


