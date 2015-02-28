
int drawingMode = 0;

float symmetryProperty1;
float symmetryProperty2;
float symmetryProperty3, symmetryProperty4;
float asymmetryProperty1, asymmetryProperty2, asymmetryProperty3;
float fillProperty1, fillProperty2, fillProperty3, fillProperty4, fillProperty5, fillProperty6;


void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  colorMode (RGB);
  noStroke();
  changeSymmetricComposition();
  changeAsymmetricComposition();
  changeFill ();
}
void draw() {
  background(208, 242, 239);
  fill (fillProperty1, fillProperty2, fillProperty3);
  
  if (drawingMode == 0) {
    drawSymmetricComposition();
  } else if (drawingMode == 1) {
    drawAsymmetricComposition();
  }

}

void keyReleased() {
  if (key == ' ') {
    if (drawingMode == 0) {
      drawingMode = 1;
      changeSymmetricComposition();
      changeFill ();
    } else if (drawingMode == 1) {
      drawingMode = 0;
      changeAsymmetricComposition();
      changeFill ();
    }
  }

  if (key == 'a') {
    if (drawingMode == 0) {
      drawingMode = 1; changeSymmetricComposition();
      changeFill ();
    }
  }
  if (key == 's') {
    if (drawingMode == 1) {
      drawingMode = 0; 
      changeAsymmetricComposition();
      changeFill ();
    }
  }
}

    
    
    
    
    
    
void drawSymmetricComposition() {
  rect(symmetryProperty3, symmetryProperty4, symmetryProperty1 / 18, symmetryProperty1 / 18);
  rect(width - symmetryProperty3, symmetryProperty4, symmetryProperty1 / 18, symmetryProperty1 / 18);
}

void drawAsymmetricComposition() {
  rect(asymmetryProperty1, asymmetryProperty3, asymmetryProperty1 / 2, asymmetryProperty1 / 3);
  fill (fillProperty4, fillProperty5, fillProperty6);
  ellipse(width - asymmetryProperty1 * .8, asymmetryProperty2 * 3/5, asymmetryProperty1 + 3, asymmetryProperty2 + 3);
  
}
  
void changeSymmetricComposition() {
 symmetryProperty1 = random(width / 9, width * 1 / 3); 
 symmetryProperty2 = random(height / 8, height * 2 / 4); 
 symmetryProperty3 = width * 2 / 3;
 symmetryProperty4 = height * 3 / 4;
}

void changeAsymmetricComposition() {
 asymmetryProperty1 = random(width / 4, width / 3);  
 asymmetryProperty2 = random(height / 4, height * 3 / 4);  
 asymmetryProperty3 = random(height / 4, height * 3 / 4);  
}

void changeFill () {
  fillProperty1 = random(0, 255);
  fillProperty2 = random(0, 255);
  fillProperty3 = random(0, 255);
  fillProperty4 = random(0, 255);
  fillProperty5 = random(0, 255);
  fillProperty6 = random(0, 255);
}

