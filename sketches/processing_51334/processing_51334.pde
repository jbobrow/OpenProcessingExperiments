
int i = 0;
int n=0;
void setup(){
  size(600, 800);
  background(255, 230, 230);
  smooth();
}

void drawFigureOne(){
  noFill();
  strokeWeight(8);
  strokeCap(SQUARE);
  line (25, 0, 25, 800);
  line (225, 0, 225, 775);
  line (375, 0, 375, 600);
  line (570, 0, 570, 250);
  line (550, 250, 550, 775);
  line (450, 600, 450, 50);
  line (590, 500, 590, 800);
}
void drawFigureTwo(){
  noFill();
  strokeWeight(8);
  strokeCap(SQUARE);
  line (25, 5, 375, 5);
  line (375, 50, 570, 50); 
  line (0, 150, 375, 150);
  line (375, 250, 600, 250);
  line (25, 450, 375, 450);
  line (25, 500, 375, 500);
  line (225, 600, 550, 600);
  line (0, 775, 600, 775);
  line (25, 5, 600, 5);  
  line (550, 500, 600, 500);
}
void drawErase() {
  strokeWeight(8);
  fill(255, 230, 230);
  rect(25, 5, 200, 145);
  rect(25, 150, 200, 300);
  rect(225, 150, 150, 300);
  rect(378, 50, 70, 200);
  rect(570, 50, 195, 200);
  rect(25, 450, 200, 50);
  rect(225, 600, 325, 175);
  rect(25, 775, 565, 25);
  rect(380, 254, 67, 343);
  rect(0, 0, 22, 145);
  rect(590, 500, 10, 275);
}

void mouseClicked(){
  i++;

}

void drawFigureThree(){
  strokeWeight(8);
  fill(255, 0, 0, 200);
  rect(25, 5, 200, 145);
}
void drawFigureFour(){
  strokeWeight(8);
  fill(0, 0, 200, 250);
  rect(25, 150, 200, 300);
}

void drawFigureFive(){
  strokeWeight(8); 
  fill(0, 0, 0, 255);
  rect(225, 150, 150, 300);
}

void drawFigureSix(){
  strokeWeight(8);
  fill(255, 255, 0, 200);
  rect(378, 50, 70, 200);
}
void drawFigureSeven(){
  strokeWeight(8);
  fill(0, 0, 150, 200);
  rect(570, 50, 195, 200);
}

void drawFigureEight(){
  strokeWeight(8);
  fill(250, 50, 0, 200);
  rect(25, 450, 200, 50);
}

void drawFigureNine(){
  strokeWeight(8);
  fill(255, 0, 0, 200);
  rect(225, 600, 325, 175);
}
void drawFigureTen(){
  strokeWeight(8);
  fill(255, 255, 0, 245);
  rect(25, 775, 565, 25);
}
void drawFigureElvn(){ 
  fill(255);
 // noStroke();
  rect(380, 254, 67, 343);
}

void drawFigureTwlv(){
  fill(255, 255, 0, 225);
  rect(0, 0, 22, 145);
}

void drawFigureThtn(){
  
  fill (0);
 // noStroke();
  rect(590, 500, 10, 275);
}

void draw(){
  drawFigureOne();
  drawFigureTwo();
  
  if (i>0) drawFigureThree();
  
  if (i>1) drawFigureFour();
  
  if (i>2) drawFigureFive();
  
  if (i>3) drawFigureSix();
  
  if (i>4) drawFigureSeven();
  
  if(i>5) drawFigureEight();
  
  if (i>6) drawFigureNine();
  
  if (i>7) drawFigureTen();
  
  if (i>8) drawFigureElvn();

  if (i>9) drawFigureTwlv();

  if (i>10) drawFigureThtn(); 
  
  if (keyPressed == true) n++;
  if ( n>0) drawErase();

}




