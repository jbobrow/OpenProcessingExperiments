
Cell[] myCells = new Cell [160];//161 cells
Cell[][] allCells = new Cell[5][160]; 

Cell myCell;
 
void setup() {
  size(500,500);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(15); // slow down the frame rate
  smooth();
  for(int i = 0; i < myCells.length; i++){
    myCells[i] = new Cell();
    if (i <40){ // cells 0-39 to positionA (400,400)
      myCells[i].setPosition(400,400,214,21,39,5);//(xl, yl, cH, cS, cB, v)
    }
    if ((i >=40) && (i<85)){ //cells40-84 to positionB (130,130)
      myCells[i].setPosition(130,130,206,40,55,8);
    }
    if ((i>=85)&&(i<141)){//cells 85-139 to positionC(130,400)
      myCells[i].setPosition(2*width/3, height/3,46,27,78,3);
    }
  }
  for(int i = 0; i < 5; i++){
    allCells[i] = myCells;
  }
}
 
void draw(){
  background(219,38,32);//background colour
  for(int i = 1; i < 5; i++){
    allCells[i] = allCells[i-1];
  }
  for(int i = 0; i<myCells.length; i++){
    myCells[i].doItAll();
  }
    allCells[0] = myCells;
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
 
 
  Cell() {//original colony
    xlocation = width/3;
    ylocation = 2*height/3;
    dia= 10;
    cHue=221;
    cSat = 23;
    cBri = 58;
    cAlph=random(20, 100);
    lineweight = 0.5;
    variance = 10;
    pxlocation = xlocation - variance;
    pylocation = ylocation - variance;
  }
 
  void display() {
    stroke(cHue, cSat, cBri, cAlph);
    strokeWeight(lineweight);
    fill(cHue, cSat, cBri, cAlph);
    ellipse(xlocation, ylocation, dia, dia);
    strokeWeight(0.5);
    line(xlocation, ylocation, pxlocation, pylocation);
   
  }
  
  
  void decreaseAlpha() {
    cAlph =  cAlph / 2;// divided by 4 (fades)
    cBri = cBri *1.1; 
  }
  
  void increaseAlpha() {
    cAlph =  cAlph* 2; // back to original value of alpha
    cBri = cBri / 1.1;
  }
  
  void doItAll(){
    this.decreaseAlpha();//decrease alpha, decrease opacity, increases brightness
    this.display();    // display self
    this.update();    // update cell
    this.increaseAlpha(); // increase alpha, increase opacity, decreases brightness
    this.display();    // display self again, more opaque
    
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


