
//Vera Molnar, 25 Squares, 1991 
/*
Eduardo H Obieta
 */

int numRect = 5;
int sep, marco = 20;
int col;
void setup() {
  size(600, 600);
  frameRate(1);
  sep = 10;
  noStroke();
}

void draw() {
  background(225);
  translate(marco, marco);
  for (int i=0; i<numRect; i++) {
    for (int j=0; j<numRect; j++) {
      col = (int) random(2);
      println(col);
      switch(col) {
      case 0:
        fill(122, 54, 54, 220);
        break;
      case 1:
        fill(160, 37, 37, 220);
        break;
      }
      float move = random(7); 
      float inX = move+(width-2*marco)/numRect*i;
      float inY = move+(height-2*marco)/numRect*j;
      rect(inX, inY, width/numRect-10, height/numRect-10);
    }
  }
}

