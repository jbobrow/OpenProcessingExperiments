
/* @pjs font="Corbel Bold Italic.ttf"; */

//Raven Kwok (aka Guo Ruiwen)
//ravenkwok.com
/*
Inspired by bitcraft (www.openprocessing.org/user/1720) 's "10 PRINT: Image Dithering ( Grayscale )" (www.openprocessing.org/sketch/82456)
 */

Maze maze;
PGraphics letter;
PFont f;
String input = "";
int cols, rows;

void setup() {
  size(600, 600, P2D);
  smooth();
  frameRate(30);
  cols = rows = 60;

  stroke(100);
  strokeWeight(2);

  f = createFont("Corbel Bold Italic", 24);
  letter = createGraphics(cols, rows, JAVA2D);

  maze = new Maze(cols, rows, 10);
  drawLetter();
}

void draw() {
  background(255);
  maze.update();
  maze.display();

  image(letter, 0, 0);
}

void drawLetter() {
  letter.beginDraw();
  letter.background(255);
  letter.fill(100);
  letter.textFont(f);
  letter.textAlign(CENTER, CENTER);
  letter.text(input, 30, 30);
  letter.smooth();
  letter.endDraw();
}

class Cell{
  
  float centerX,centerY,cellSize;
  float r,rT;
  float amt;
  
  Cell(float centerX,float centerY,float cellSize){
    this.centerX = centerX;
    this.centerY = centerY;
    this.cellSize = cellSize;
    amt = 0.1;
    rT = -45;
    r = rT;
  }
  
  void update(){
    float ratio = map(dist(centerX,centerY,width/2,height/2),0,sqrt(2)*width/2,1,10);
    amt = lerp(amt,1,0.002*ratio);
    r = lerp(r,rT,amt);
  }
  
  void display(){
    pushMatrix();
    translate(centerX,centerY);
    rotate(radians(r));
    line(-cellSize/2,0,cellSize/2,0);
    popMatrix();
  }
  
  void reset(color c){
    amt = 0;
    if(brightness(c) > 200){
      if((rT-45)%180 == 0){
        rT += 90;
      }
    }else{
      if((rT-45)%180 != 0){
        rT += 90;
      }
    }
  }
}
class Maze {
  
  int cols, rows;
  float cellSize;
  Cell [][] cells;
  
  Maze(int cols, int rows, float cellSize) {

    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    cells = new Cell[cols][rows];

    for (int i=0;i<rows;i++) {
      for (int j=0;j<cols;j++) {
        cells[j][i] = new Cell(j*cellSize+cellSize/2, i*cellSize+cellSize/2, cellSize*sqrt(2));
      }
    }
  }
  
  void update() {
    for (int i=0;i<rows;i++){
      for (int j=0;j<cols;j++){
        cells[j][i].update();
      }
    }
  }
  
  void display() {
    for (int i=0;i<rows;i++){
      for (int j=0;j<cols;j++){
        cells[j][i].display();
      }
    }
  }
  
  void reset(){
    for (int i=0;i<rows;i++){
      for (int j=0;j<cols;j++){
        int index = j+i*cols;
        cells[j][i].reset(letter.pixels[index]);
      }
    }
  }
}

void keyPressed() {
  if (keyCode != SHIFT && keyCode != LEFT) {
    input += str(key);
    drawLetter();
    letter.loadPixels();
    maze.reset();
  }
  if (keyCode == LEFT && input.length()>0) {
    input = input.substring(0, input.length()-1);
    drawLetter();
    letter.loadPixels();
    maze.reset();
  }
}



