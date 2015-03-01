
/*
    Create Pattern with Images
    Use keys 1 - 4  to change pattern
    Use keys UP and DOWN to change image
    Click canvas to change size of the patterns (mouseX)
*/
/* @pjs preload=Pic_1.jpg";*/
/* @pjs preload=Pic_2.jpg";*/
/* @pjs preload=Pic_3.jpg";*/
/* @pjs preload=Pic_4.jpg";*/

PImage[] myImg;
int cellSize = 40; 
int c; 
int steps = 4; 
int pattern = 1; 
int numImg = 0;

void setup() {
  size(640, 480);
  background(255);     
  noStroke(); 
  rectMode(CENTER);   

  myImg = new PImage[4];
  myImg[0] = loadImage("Pic_1.jpg");
  myImg[1] = loadImage("Pic_2.jpg");
  myImg[2] = loadImage("Pic_3.jpg");
  myImg[3] = loadImage("Pic_4.jpg");
}

void draw() {  
  background(255); 

  if (mousePressed) {
    cellSize = (int) map(mouseX, 0, width, 20, width/2);
  } 

  switch(pattern) {
  case 1: 
    drawRect1();
    break; 
  case 2:
    drawRect2();
    break;
  case 3:
    drawTriangle();
    break;
  case 4:
    drawEllipse();
    break;
  }
}

void drawRect1() {
  for ( int y = 0; y < height; y += cellSize) {
    for ( int x = 0; x < width; x += cellSize) {

      for (int i = 0; i < steps; i++) {
        int x1 = (int) i*cellSize/steps; 
        c = myImg[numImg].get(x + x1, y);
        fill(c);
        rect(x+cellSize/2, y+cellSize/2, cellSize-x1, cellSize-x1);
      }
    }  //cols
  }  //rows
}

void drawRect2() {
  float angle, cSize; 

  for ( int y = 0; y < height; y += cellSize) {
    for ( int x = 0; x < width; x += cellSize) {
      angle = 0;    
      cSize = cellSize;   
      for (int i = 0; i < steps; i++) {       
        int x1 = (int) i*cellSize/steps; 
        c = myImg[numImg].get(x + x1, y);
        fill(c);
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2); 
        rotate(angle); 
        rect(0, 0, cSize, cSize); 
        popMatrix();
        angle += PI/4;
        cSize = cSize * 0.7;        
      }
    }  //cols
  }  //rows
}

void drawTriangle() {
  float angle; 
  for ( int y = 0; y < height; y += cellSize) {
    for ( int x = 0; x < width; x += cellSize) {
      angle = PI; 
      for (int i = 0; i < steps; i++) {
        int x1 = (int) i*cellSize/steps; 
        c = myImg[numImg].get(x + x1, y);
        fill(c);
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);         
        triangle(-cellSize/2, -cellSize/2, cellSize/2-x1, -cellSize/2, -cellSize/2, cellSize/2-x1);       
        rotate(angle);
        triangle(-cellSize/2, -cellSize/2, cellSize/2-x1, -cellSize/2, -cellSize/2, cellSize/2-x1);
        popMatrix();          
        //triangle(x, y, x+cellSize-x1, y, x, y+cellSize-x1);
      }
    }  //cols
  }  //rows
}

void drawEllipse() {
  float eSize = cellSize * 1.4; 

  for ( int y = 0; y < height; y += cellSize) {
    for ( int x = 0; x < width; x += cellSize) {

      for (int i = 0; i < steps; i++) {
        int x1 = (int) i*cellSize/steps; 
        c = myImg[numImg].get(x + x1, y);
        fill(c);
        ellipse(x+cellSize/2, y+cellSize/2, eSize-x1, eSize-x1);
      }
    }  //cols
  }  //rows
}

void keyReleased() { 
  if (key == '1') {
    pattern = 1;
  }
  if (key == '2') {
    pattern = 2;
  }
  if (key == '3') {
    pattern = 3;
  }
  if (key == '4') {
    pattern = 4;
  }
  
  if (key == CODED) {
    if (keyCode == UP) { 
       numImg++; 
      if (numImg > 3) {
        numImg = 0;
      }        
    }
    if (keyCode == DOWN) { 
      numImg--; 
      if (numImg < 1) {
        numImg = 3;
      }      
    }
  }
}



