
//Global Variables
//int x = 0;
//int y = 0;
int cd = 20; //circle diameter: allows scaleable pattern

//Once at Startup
void setup() {
  smooth();
  //size(cd * 10, cd * 10);
  size(450, 450);
  background(236, 234, 100);
  noStroke();
}

//Continually per refresh
void draw() {
  //  ptrn(0, 0); //tests before looping
  //  ptrn(0, 20); //working before loop

  for  (int col = 0; col < width + (cd * 3); col += (cd * 2.5)) {
    for (int row = 0; row < height + (cd * 2); row += cd) {
      ptrn(col, row);
    }
  }
}

//Patternizer
void ptrn(int x, int y) {
  fill(0, 61, 40);
  rect(x, y, (cd * 2.5), cd / 2);
  ellipse(x, y + (cd / 4), cd, cd);
  fill(236, 234, 100);
  ellipse(x + (cd * 1.25), y - (cd / 4), cd, cd);
  fill(197, 49, 106);
  ellipse(x + cd, y - (cd / 4), cd / 4, cd / 4);
  ellipse(x + (cd * 1.25), y - (cd / 2), cd / 4, cd / 4);  
  ellipse(x + (cd * 1.5), y - (cd / 4), cd / 4, cd / 4);
  ellipse(x + (cd * 1.25), y, cd / 4, cd / 4);
  fill(246, 151, 136);
  rect(x - (cd * .625), y + (cd / 5) + (cd / 40), cd + (cd / 4), cd / 10);
  ellipse(x, y + (cd / 4), (cd / 4), (cd / 4));
}

void mouseClicked() {
  if (cd == 20) {
    background(236, 234, 100);
    cd = 60;
  } 
  else {
    background(236, 234, 100);
    cd = 20;
  }
}


