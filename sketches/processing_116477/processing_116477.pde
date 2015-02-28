
Cell[]myCells = new Cell [160];//161 cells

Cell myCell;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60); // slow down the frame rate
  smooth();
  for (int i = 0; i < myCells.length; i++) {
    myCells[i] = new Cell();
    if (i <40) { // cells 0-39 to positionA (400,400)
      myCells[i].setPosition(400, 400, 7, 51, 72, 9);//(xl, yl, cH, cS, cB, v)
    }
    if ((i >=40) && (i<85)) { //cells40-84 to positionB (130,130)
      myCells[i].setPosition(130, 130, 395, 37, 52, 8);
    }
    if ((i>=85)&&(i<140)) {//cells 85-139 to positionC(130,400)
      myCells[i].setPosition(400, 130, 16, 52, 80, 6);
    }
  }
}

void draw() {
  background(222, 25, 36);//background colour
  smooth();
  for (int i = 0; i<myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }

}
class Cell {

  float xlocation;
  float ylocation;
  float variance;
  float cHue, cSat, cBri, cAlph;
  float lineweight;
  float pxlocation;
  float pylocation;
  float dia;
  int num = 60;
  float xl[] = new float[num];
  float yl[] = new float[num];




  Cell() {//original colony
    xlocation = width/2;
    ylocation = height/2;
    dia= 10;
    cHue=31;
    cSat = 18;
    cBri = 94;
    cAlph=random(20, 100);
    lineweight = 0.5;
    variance = 10;
    pxlocation = xlocation - variance;
    pylocation = ylocation - variance;
  
  }

  void display() {
    stroke(cHue, cSat, cBri);
    strokeWeight(lineweight);
    fill(cHue, cSat, cBri, cAlph);
    ellipse(xlocation, ylocation, dia, dia);
    strokeWeight(0.5);
    line(xlocation, ylocation, pxlocation, pylocation);
      int which = frameCount % num;
    xl[which] = xlocation;
    yl[which] = ylocation;
      for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    
    fill(cHue, cSat, cBri, cAlph-(i*2));
    ellipse(xl[index], yl[index], i*0.1, i*0.1);
  }
  }

  void update() {//changing values here will mean that the values are updated each frame
    xlocation += random(-variance, variance);
    ylocation += random(-variance, variance);
    lineweight= random(0.5, 3);
    dia+= random(-0.01* variance, 0.01* variance);
    cBri+=random(-5, 5);
    if (cBri<=5) {
      cBri=100;
    }
  
  }

  void setPosition(float xl, float yl, float cH, float cS, float cB, float v) {
    /* this allows me to create many colonies with minimum code
     by giving value to the fields outside of the Cell class
     */

    xlocation = xl;
    ylocation = yl;
    cHue = cH;
    cSat = cS;
    cBri = cB;
    variance = v;
    pxlocation = xl - v;
    pylocation = yl - v;
  }
}
