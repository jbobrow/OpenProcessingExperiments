
int xpos = 50; 
int ypos = 30;
int Bsize = 30;

void setup() {
  size (600, 600);
  background(#C9E5DC);

  noStroke();
  fill(255);
  ellipse (300, 330, 500, 500);

  //Button
  fill(#FDFFA7);
  ellipse(xpos, ypos, Bsize, Bsize);
  fill(#F3F723);
  ellipse(xpos+Bsize, ypos, Bsize, Bsize);
  fill(#DBE302);
  ellipse(xpos+Bsize*2, ypos, Bsize, Bsize);
  fill(#A7B746);
  ellipse(xpos+Bsize*3, ypos, Bsize, Bsize);
  fill(#4C8361);
  ellipse(xpos+Bsize*4, ypos, Bsize, Bsize);
  fill(#556D76);
  ellipse(xpos+Bsize*5, ypos, Bsize, Bsize);
  fill(#3D4D67);
  ellipse(xpos+Bsize*6, ypos, Bsize, Bsize);
  fill(#423264);
  ellipse(xpos+Bsize*7, ypos, Bsize, Bsize);
  fill(#643262);
  ellipse(xpos+Bsize*8, ypos, Bsize, Bsize);
}


void draw() {

  if (mousePressed) {
    if (550 > pmouseX && 550 > mouseX && pmouseX > 110 && mouseX > 110 &&
      590 > pmouseY && 590 > mouseY && pmouseY> 100 && mouseY> 100) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }



    if ( mouseX >xpos && mouseX < xpos+Bsize && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#FDFFA7);
      strokeWeight(5);
    }


    if ( mouseX >xpos+Bsize && mouseX < xpos+Bsize*2 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#F3F723);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*2 && mouseX < xpos+Bsize*3 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#DBE302);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*3 && mouseX < xpos+Bsize*4 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#A7B746);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*4 && mouseX < xpos+Bsize*5 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#4C8361);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*5 && mouseX < xpos+Bsize*6 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#556D76);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*6 && mouseX < xpos+Bsize*7 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#3D4D67);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*7 && mouseX < xpos+Bsize*8 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#423264);
      strokeWeight(5);
    }

    if ( mouseX >xpos+Bsize*8 && mouseX < xpos+Bsize*9 && mouseY > ypos && mouseY < ypos+Bsize) {
      stroke(#430058);
      strokeWeight(5);
    }
  }
}
