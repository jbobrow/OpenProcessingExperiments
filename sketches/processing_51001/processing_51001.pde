

int constant = 600/10;
color kulerBlue = color(118, 161, 154);
color kulerRed = color(217, 89, 61);
int counter = 0;
int angleVar = 0;


void setup() {
  size(600, 600);
  background(color(39, 33, 35));
  smooth();
}



void draw() {
  
  noStroke();
  if (counter < 1) {
    for (int x = 0; x < width; x += constant) {
      for (int y = 0; y < height; y += constant) {
        float lerpValX = map(x, 0, width, 0, 1);
        color xColor = lerpColor(kulerBlue, kulerRed, lerpValX);
        float lerpValY = map(y, 0, height, 0, 1);
        color yColor = lerpColor(kulerBlue, kulerRed, lerpValY);
        color finalColor = lerpColor(xColor, yColor, .5);
        fill(finalColor);
        drawBunny(x, y, angleVar);
        angleVar++;
      }
    }
    counter++;
  }
  
}

void drawBunny(int i, int j, int rotAngle) {
  //println(rotAngle);
  
  pushMatrix();
  translate(i+30, j+30);
  rotate(sin(map(rotAngle, 0, 10, 0, TWO_PI)));
  beginShape();
//  vertex(18, 30);
//  curveVertex(10, 14);
//  curveVertex(10, 14);      
//  curveVertex(17, 5);
//  curveVertex(25, 12);
//  curveVertex(25, 12);
//  vertex(27, 25);
//  vertex(33, 25);
//  curveVertex(35, 12);
//  curveVertex(35, 12);
//  curveVertex(45, 5);
//  curveVertex(50, 14);
//  curveVertex(47, 14);
//  vertex(42, 30);
//  curveVertex(60, 40);
//  curveVertex(60, 40);
//  curveVertex(30, 55);
//  curveVertex(14, 42);
//  curveVertex(18, 30);
//  curveVertex(18, 30);

  vertex(18-30, 30-30);
  curveVertex(10-30, 14-30);
  curveVertex(10-30, 14-30);      
  curveVertex(17-30, 5-30);
  curveVertex(25-30, 12-30);
  curveVertex(25-30, 12-30);
  vertex(27-30, 25-30);
  vertex(33-30, 25-30);
  curveVertex(35-30, 12-30);
  curveVertex(35-30, 12-30);
  curveVertex(45-30, 5-30);
  curveVertex(50-30, 14-30);
  curveVertex(47-30, 14-30);
  vertex(42-30, 30-30);
  curveVertex(60-30, 40-30);
  curveVertex(60-30, 40-30);
  curveVertex(30-30, 55-30);
  curveVertex(14-30, 42-30);
  curveVertex(18-30, 30-30);
  curveVertex(18-30, 30-30);
  
//  vertex(x+18, y+30);
//  curveVertex(x+10, y+14);
//  curveVertex(x+10, y+14);      
//  curveVertex(x+17, y+5);
//  curveVertex(x+25, y+12);
//  curveVertex(x+25, y+12);
//  vertex(x+27, y+25);
//  vertex(x+33, y+25);
//  curveVertex(x+35, y+12);
//  curveVertex(x+35, y+12);
//  curveVertex(x+45, y+5);
//  curveVertex(x+50, y+14);
//  curveVertex(x+47, y+14);
//  vertex(x+42, y+30);
//  curveVertex(x+60, y+40);
//  curveVertex(x+60, y+40);
//  curveVertex(x+30, y+55);
//  curveVertex(x+14, y+42);
//  curveVertex(x+18, y+30);
//  curveVertex(x+18, y+30);
  endShape(CLOSE);
  
  //NOSE
  fill(0);
  beginShape();
  curveVertex(30-30, 49-30);
  curveVertex(30-30, 49-30);
  curveVertex(26-30, 43-30);
  curveVertex(26-30, 43-30);
  curveVertex(33-30, 43-30);
  curveVertex(33-30, 43-30);
  endShape(CLOSE);
  
  //EYES
  fill(255);
  int size1 = round(random(5, 15));
  ellipse(26-30, 37-30, size1, size1);
  int size2 = round(random(5, 15));
  ellipse(33-30, 37-30, size2, size2);
  
  //PUPILS
  fill(0);
  ellipse(26-30, 37-30, 2, 2);
  ellipse(33-30, 37-30, 2, 2);
  
  
  popMatrix();
}

