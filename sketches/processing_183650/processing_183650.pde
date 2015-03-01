
void setup() {
  size(1080, 720);
  smooth();
  background(250);
  rectMode(CENTER);
}

int sC = 0; //Shape Colour fill
int rev = 0;
float r = 0;
float w = random(20, 100);
float h = random(20, 100);

void draw() {
  float n = random(1, 100);

  fill(sC);  
  translate(mouseX, mouseY);  
  rotate(r);
  rect(0, 0, w, h);
  r=r+0.1;
  
  //Coloring
  if (sC !=255 && rev ==0) {
    rev= 0;
    sC = sC + 1;
  } 
  if (sC ==255) {
    rev = 1;
  }
  if (sC !=0 && rev ==1) {
    sC =sC - 1;
  }
  if (sC ==0 && rev ==1) {
    rev = 0;
  }
  //End Coloring
}

