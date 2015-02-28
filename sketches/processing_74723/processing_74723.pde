
int xPos = 25;
int yPos = 575;
int w = 100;
int transA = 0; 
int transB = 0;
int transC = 0;
int transD = 0;
int transE = 0;
int transF = 0; 

void setup() {
  size(600, 600);
  background(#D1AFAF, 100);
  rectMode(CENTER);
  frameRate(100);
}

void draw() {

  rectangle();
  arm();
}

void arm() {
  transA = 200;
  transB = 50;
  transC = 100;
  transD = 100;
  transE = 50;
  transF = 2; 
  translate(transA, transB);//X and Y axis of Joint starting point.

  if (key == 'd') {
    translate(transA-=80, transB-=50);
  }
  if (key == 'a') {
    translate(transA-=120, transB-=50);
  }

  for (int ii=0;ii<1;ii++) {//Number of Joint sets
    translate(transC, transD); // X and Y axis of joint starting point

    pushMatrix();
    for (int i=0;i<15;i++) { //Number of joints

      rect(1, -10, 50, 20);

      //ellipse(0, 0, 9, 9);
      translate(transE, transF);//Distance and offset between joints 
      rotate(radians(map(mouseY, 100, height-200, 50, 10)));//Lower the -number higher the join set goes. Speed/Flexibility.
    }

    popMatrix();
  }
}
void rectangle() {
  background(#D1AFAF, 30);
  fill(255, 255, 255);
  noStroke();
  rect(xPos, yPos, 50, 50);
  if (mouseX > xPos && mouseX < xPos+w && mouseY < yPos && mouseY < yPos+height && mousePressed) {
    xPos=mouseX;
    yPos=mouseY;
  }
  else {
    if (yPos<575) { 
      yPos+=5;
    }
    else {
      if (keyPressed) {
        key = 'r';
        xPos = 25;
        yPos=575;
      }
    }
  }
}
void increase() {
  if (keyPressed == true) {

    transA -= 10;
    transB -= 10;
    transC -= 10;
    transD -= 10;
    transE -= 10;
    transF -= 10;
  }
}



