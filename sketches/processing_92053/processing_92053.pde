
int brushShape = 1;

void setup () {
  size(350, 600);
}

void draw() {
  //background(255);
}


void mouseMoved () {
  //background(255, 0, 0);
  if (brushShape ==1) {
    noStroke();
    fill(235,20,50, 50); 
    rect(mouseX, mouseY, 50, 50);
  } 
  else if (brushShape ==2) {
    noStroke();
    fill(216,129,259,50);
    ellipse(mouseX, mouseY, 50, 50);
  }
}

void keyPressed() {
  // if the 1 ket is pressed, bruhS. = 1; if 2 then brushS. = 2
  if (key =='1') {
    brushShape = 1 ;
  }
  if (key=='2') {
    brushShape = 2;
  }
}
