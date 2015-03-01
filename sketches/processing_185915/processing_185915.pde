
int blockHeight;
int blockWidth;
int backgroundState = 0; // 0 means white and 1 means blue and 2 is green and ..

color aOne = color(255, 0, 0);
color aTwo = color(255, 0, 127);
color aThree = color(255, 0, 255);
color aFour = color(127, 0, 255);
color bOne = color(255, 127, 0);
color bFour = color(0, 0, 255);
color cOne = color(255, 255, 0);
color cFour = color(0, 127, 255);
color dOne = color(127, 255, 0);
color dTwo = color(0, 255, 0);
color dThree = color(0, 255, 127);
color dFour = color(0, 255, 255);

void setup() {
  size(900, 800);
  background(255, 255, 255);
  blockWidth= width/4;
  blockHeight= height/4;
}

void draw() {
  background(255);
  line(blockWidth * 1, 0, blockWidth * 1, height);
  line(blockWidth * 2, 0, blockWidth * 2, height);
  line(blockWidth * 3, 0, blockWidth * 3, height);

  line(0, blockHeight * 1, width, blockHeight * 1);
  line(0, blockHeight * 2, width, blockHeight * 2);
  line(0, blockHeight * 3, width, blockHeight * 3);

  ellipseMode(CENTER);
  rectMode(CORNERS);
  noFill();
  ellipse(115, 100, 50, 50); //A1
  ellipse(115, 300, 50, 50); //A2
  ellipse(115, 500, 50, 50); //A3
  ellipse(115, 700, 50, 50); //A4

  ellipse(335, 100, 50, 50); //B1
  ellipse(335, 300, 50, 50); //B2
  ellipse(335, 500, 50, 50); //B3
  ellipse(335, 700, 50, 50); //B4

  ellipse(555, 100, 50, 50); //C1
  ellipse(555, 300, 50, 50); //C2
  ellipse(555, 500, 50, 50); //C3
  ellipse(555, 700, 50, 50); //C4

  ellipse(775, 100, 50, 50); //D1
  ellipse(775, 300, 50, 50); //D2
  ellipse(775, 500, 50, 50); //D3
  ellipse(775, 700, 50, 50); //D4

  if (mouseX<blockWidth && mouseY<blockHeight) {
    fill(aOne) ;
    ellipse(115, 100, 50, 50); 
  } else if (mouseX <blockWidth *1 && mouseY < blockHeight *2 && mouseY>blockHeight * 1 ) {
    fill(aTwo) ;
    ellipse(115, 300, 50, 50);
  } else if (mouseX <blockWidth*1  && mouseY < blockHeight*3 && mouseY>blockHeight*1) {
    fill(aThree);
    ellipse(115, 500, 50, 50);
  } else if (mouseX <blockWidth*1  && mouseY < blockHeight*4 && mouseY>blockHeight*1) {
    fill(aFour);
    ellipse(115, 700, 50, 50);
  } else if (mouseX < blockWidth *2 && mouseX>blockWidth * 1 && mouseY <blockHeight *1) {
    fill(bOne); 
    ellipse(335, 100, 50, 50);
  } else if (mouseX >blockWidth *1 && mouseX < blockWidth * 2 && mouseY < blockHeight *2 && mouseY>blockHeight * 1) {
    fill(random(255), random(255), random(255));
    rect(450, 400, 225, 200);
  } else if (mouseX >blockWidth *1 && mouseX < blockWidth * 2 && mouseY < blockHeight *3 && mouseY>blockHeight * 1) {
    fill(random(255), random(255), random(255));
    rect(450, 400, 225, 600);
  } else if (mouseX >blockWidth *1 && mouseX < blockWidth * 2 && mouseY < blockHeight *4 && mouseY>blockHeight * 1) {
    fill(bFour) ;
    ellipse(335, 700, 50, 50);
  } else if (mouseX >blockWidth  && mouseX < blockWidth * 3  && mouseY<blockHeight ) {
    fill(cOne) ;
      ellipse(555, 100, 50, 50); 
  } else if (mouseX >blockWidth*2  && mouseX < blockWidth * 3  && mouseY>blockHeight && mouseY< blockHeight *2 ) {
    fill(random(255), random(255), random(255));
    rect(450, 400, 675, 200);
  } else if (mouseX >blockWidth  && mouseX < blockWidth *3  && mouseY>blockHeight && mouseY< blockHeight *3) {
    fill(random(255), random(255), random(255)); 
    rect(450, 400, 675, 600);
  } else if (mouseX >blockWidth  && mouseX < blockWidth *3  && mouseY< blockHeight *4) {
    fill(cFour);
    ellipse(555, 700, 50, 50);
  } else if (mouseX > blockWidth * 3  && mouseY<blockHeight ) {
    fill(dOne) ;
    ellipse(775, 100, 50, 50);
  } else if (mouseX > blockWidth * 3  && mouseY>blockHeight && mouseY< blockHeight*2 ) {
    fill(dTwo) ;
    ellipse(775, 300, 50, 50);
  } else if (mouseX > blockWidth * 3  && mouseY<blockHeight*3 && mouseY> blockHeight) {
    fill(dThree) ;
    ellipse(775, 500, 50, 50);
  } else if (mouseX > blockWidth * 3  && mouseY<blockHeight*4) {
    fill(dFour) ;
    ellipse(775, 700, 50, 50);
  }
}


void keyPressed() {
  if ( backgroundState == 0 ) {
    aTwo = color( 0, 0, 255);
    backgroundState = 1;
  } else if ( backgroundState == 1 ) {
    aTwo = color( 0, 255, 0);
    backgroundState = 2;
  } else if ( backgroundState == 2 ) {
    aTwo = color( 255, 0, 0);
    backgroundState = 0;
  }
}
