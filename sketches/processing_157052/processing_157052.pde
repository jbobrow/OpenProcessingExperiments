
float[]posX = new float[50];
float[]posY = new float[50];

String[] season = {
  "s", 
  "su", 
  "f", 
  "w"
};

void setup() {
  size(1000, 1000);
  for (int i=0; i<posX.length; i++) {
    posX[i] =0;
    posY[i] =0;
  }
}

void draw() {
  background(0);
  smooth();

  fill(255);
  textSize(3);
  for (int i=0; i<season.length; i++) {
    text(season[i], i*width/4+35, height/2);
  }
  posX[posX.length-1] = mouseX;
  posY[posY.length-1] = mouseY;
  noStroke();
  for (int i=0; i<posX.length-1; i++) {
    posX[i] = posX[i+1];
    posY[i] = posY[i+1];
  }
  for (int i=0; i<posX.length-1; i++) {
    if (mouseX>0 && mouseX<width/4) {
      float r = map(i, 0, posX.length, 4, 114); 
      float g = map(i, 0, posX.length, 100, 252);
      float b = map(i, 0, posX.length, 4, 90);
      fill(r, g, b, random(80, 200));
      ellipse(posX[i], posY[i], 20, 80);
      stroke(0.2);
      line(posX[i]-1, posY[i]-40, posX[i]-1, posY[i]+40);
    } else if (mouseX> width/4 && mouseX<width/2) {
      float r = map(i, 0, posX.length, 100, 255);
      float g = map(i, 0, posX.length, 0, 5);
      float b = map(i, 0, posX.length, 118, 123);
      fill(r, g, b, random(80, 200));
      ellipse(posX[i], posY[i], 5, 5);
      ellipse(posX[i]-10, posY[i], 10, 10);
      ellipse(posX[i], posY[i]-10, 10, 10);
      ellipse(posX[i]+10, posY[i], 10, 10);
      ellipse(posX[i], posY[i]+10, 10, 10);
    } else if (mouseX>width/2 && mouseX<width - width/4) {
      float r = map(i, 0, posX.length, 183, 255);
      float g = map(i, 0, posX.length, 87, 188);
      float b = map(i, 0, posX.length, 0, 3);
      stroke(r, g, b, random(80, 200));
      strokeWeight(2);
      line(posX[i], posY[i], posX[i], posY[i]+10);
      line(posX[i], posY[i], posX[i]+10, posY[i]-5);
      line(posX[i], posY[i], posX[i]-10, posY[i]-5);
      ellipse(posX[i], posY[i]-10, 10, 10);
    } else if (mouseX> width-width/4 && mouseX< width) {
      stroke(255, random(80, 200));
      strokeWeight(4);
      line(posX[i], posY[i], posX[i], posY[i]+20);
      line(posX[i]-10, posY[i]+10, posX[i], posY[i]);
      line(posX[i]-5, posY[i]-5, posX[i]+5, posY[i]+5);
      line(posX[i]+5, posY[i]-5, posX[i]-5, posY[i]+5);
    }
  }
} 



