
//Andrew Benson
//HW -- Pattern or Quilt using For-Loops

float[] fillVal = new float [3];

int circSize;
int rectSize;

//float fillR;
//float fillG;
//float fillB;

void setup() {
  size(500, 500);
  background((random (0, 255)), (random (0, 255)), (random (0, 255)));

  circSize = 75;
  rectSize = 75;

  //R value
  fillVal[0] = (random (0, 255));
  //G value
  fillVal[1] = (random (0, 255));
  //B value
  fillVal[2] = (random (0, 255));


  print("R = " + fillVal[0] + ", ");
  print("G = " + fillVal[1] + ", ");
  print("B = " + fillVal[2] + ", ");

  patternTime(1);
}


void draw() {
} 

void keyPressed() {
  if (key == 'w') {
    circSize = circSize + 5;
  }
  if (key == 's') {
    circSize = circSize - 5;
  }
  if (key == 'e') {
    rectSize = rectSize + 5;
  }
  if (key == 'd') {
    rectSize = rectSize - 5;
  }
  if (key == 'q') {
    circSize = 75;
    rectSize = 75;
  }
  if (key == 'r') {
    patternTime(1);
  }
}

void patternTime (int numRect) {

  for (int i = 0; i <11; i++) {
    //top row rects
    randomColor(1);
    rect(i*50, 0, rectSize, rectSize);

    //left edge circ
    randomColor(1);
    ellipse(0, i*50, circSize, circSize);

    //bott row rects
    randomColor(1);
    rect(i*50, height-50, rectSize, rectSize);

    //right edge circ
    ellipse(width, i*50, circSize, circSize);

    // mid circ size - horizontal
    randomColor(1);
    ellipse(i*50, height/2, circSize, circSize);

    // top circ line
    randomColor(1);
    ellipse(i*50, circSize, circSize, circSize);

    // \ line
    randomColor(1);
    rect(i*50, i*50, rectSize, rectSize);

    // bott circ line
    randomColor(1);
    ellipse(i*50, height-circSize, circSize, circSize);

    // / line
    randomColor(1);
    rect(i*50, (height - ((i+1)*(50))), rectSize, rectSize);

    // mid circ line - vertical
    randomColor(1);
    ellipse(width/2, i*50, circSize, circSize);

    //top mid rect
    randomColor(1);
    rect(i*50, 150, rectSize, rectSize);

    //bott mid rect
    randomColor(1);
    rect(i*50, 225, rectSize, rectSize);

    randomColor(1);
    ellipse(i*50, i*75, circSize, circSize);

    randomColor(1);
    ellipse(i*50, (height - ((i+1)*(75))), circSize, circSize);

    randomColor(1);
    rect(i*75, ((height+height)/3), rectSize, rectSize);

    randomColor(1);
    ellipse(((width+width)/3), i*75, circSize, circSize);
  }
}

void randomColor (int randCol) {
  fill((random (0, 255)), (random (0, 255)), (random (0, 255)));
}



