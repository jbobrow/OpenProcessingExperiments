
Cell[]myCells = new Cell [170];//161 cells

Cell myCell;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60); //  the frame rate
  smooth();
  for (int i = 0; i < myCells.length; i++) {
    myCells[i] = new Cell();
    if ((i <40)||(i=0)) { // cells 0-39 to positionA 
      myCells[i].setPosition(5*width/6, 5*height/6, 11, 80, 75, 7);//(xl, yl, cH, cS, cB, v)
    }
    if ((i >=40) && (i<80)) { //cells40-79 to positionB 
      myCells[i].setPosition(width/6, height/3, 20, 75, 66, 6);
    }
    if ((i>=80)&&(i<105)) {//cells 80-104 to positionC
      myCells[i].setPosition(2*width/3, height/3, 37, 58, 71, 4);
    }
    if ((i>=105)&&(i<125)) {//cells 80-124 to positionD
      myCells[i].setPosition(width/3, 2*height/3, 37,58,71, 5);
    }
  }// if none of the above cells 125+ go to positionE
}

void draw() {
  background(3, 80, 17);//background colour
  
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
    dia= 30;
    cHue=29;
    cSat = 80;
    cBri = 75;
    cAlph=random(20, 100);
    lineweight = 0.5;
    variance = 6;
    pxlocation = xlocation - variance;
    pylocation = ylocation - variance;
  
  }
  

  void display() {
    fill(cHue, cSat, cBri, cAlph);
    ellipse(xlocation, ylocation, dia, dia);
    strokeWeight(0.5);
    int which = frameCount % num;
    xl[which] = xlocation;
    yl[which] = ylocation;
      for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
     noStroke();
    fill(cHue, cSat, cBri-1, 10);
    ellipse(xl[index], yl[index], i*0.5, i*0.5);
  }
  }

  void update() {//changing values here will mean that the values are updated each frame
    xlocation += random(-variance, variance);
    ylocation += random(-variance, variance);
    dia+= random(-0.02* variance, 0.02* variance);
    cBri+=random(-1, 1);
    if (cBri<=15) {
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



