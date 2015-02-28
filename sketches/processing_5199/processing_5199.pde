
/*Mr. Toast
V 0.0B
Interact
DESMA 28


Controls: Click the mouse to summon a slice of bread to the cursor.
Hold it down to drag it around.
Mr. Toast's eyes follow the bread, with dreams of toast yet to be.

Thanks to Reas for the "clickDrag" code.

*/


//Variables
float x, y;
float offx, offy;
float din = 60;
boolean over = false;
boolean clicked = false;
int cursorFill, m, tR, tG, tB;




void setup(){
  size (320, 480);
  frameRate (35);
  x = width/2.3;
  y = height/2;
}




void draw(){
  noCursor();
  background(157, 240, 244);
  fill(15, 160, 25);
  stroke(0);
  rect(-1, 380, 320, 100);
  
//Bushes
  arc(10, 380, 40, 40, PI-PI/64, TWO_PI);
  arc(50, 380, 50, 40, PI-PI/64, TWO_PI);
  arc(270, 380, 50, 40, PI-PI/64, TWO_PI);
  arc(310, 380, 40, 40, PI-PI/64, TWO_PI);
  arc(240, 380, 40, 40, PI-PI/64, TWO_PI);
  cursorFill = 55;

//coursor color
  if (mousePressed){
    cursorFill = 255;
   }
      
//toast  
  tR = 255;
  tG = 204;
  tB = 170;
  fill(tR, tG, tB);
  stroke(128, 51, 0);
  strokeWeight(3);
  strokeJoin (ROUND);
  rect(x, y, din, din);
  if (clicked && over) {
    x = mouseX - offx;
    y = mouseY - offy;
  }

//body
  fill(140);
  stroke(67, 40, 64);
  strokeWeight(4);
  rectMode(CORNER);
  rect(125, 264, 84, 84);
  fill(67, 40, 64);


//handle
  arc(120, 275, 10, 15, 0, 180);


//eyes
  fill(255);
  stroke(255, 0, 0);
  strokeWeight(.5);
  rect(140, 280, 26, 26);
  rect(180, 280, 26, 26);


//pupils lpx = left pupil x; etc
  float lpx = constrain (x, 140, 158);
  float rpx = constrain (x, 180, 198);
  float lrpy = constrain (y, 280, 298);
  fill(0);
  noStroke();
  rect(lpx, lrpy, 8, 8);
  rect(rpx, lrpy, 8, 8);
  
  
//mouth
  fill(255, 253, 15);
  m = 145;
  rect(m, 331, 5, 15);  
  rect(m+10, 331, 5, 15);
  rect(m+20, 331, 5, 15);
  rect(m+30, 331, 5, 15);
  rect(m+40, 331, 5, 15);
  rect(m+50, 331, 5, 15);
  
  if ((keyPressed == true) && (key == '1')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
  }
  if ((keyPressed == true) && (key == '2')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
    rect(m+10, 331, 5, 15);
}
  
  if ((keyPressed == true) && (key == '3')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
    rect(m+10, 331, 5, 15);
    rect(m+20, 331, 5, 15);
}
  if ((keyPressed == true) && (key == '4')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
    rect(m+10, 331, 5, 15);
    rect(m+20, 331, 5, 15);
    rect(m+30, 331, 5, 15);
}

  if ((keyPressed == true) && (key == '5')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
    rect(m+10, 331, 5, 15);
    rect(m+20, 331, 5, 15);
    rect(m+30, 331, 5, 15);
    rect(m+40, 331, 5, 15);
}

  if ((keyPressed == true) && (key == '6')) {
    fill (255, 0, 0);
    rect(m, 331, 5, 15);
    rect(m+10, 331, 5, 15);
    rect(m+20, 331, 5, 15);
    rect(m+30, 331, 5, 15);
    rect(m+40, 331, 5, 15);
    rect(m+50, 331, 5, 15);
}
  
    
  
  
//legs
  fill(67, 40, 64);
  triangle(125, 348, 130, 400, 135, 348);
  triangle(200, 348, 205, 400, 210, 348);


//feet
  arc(127, 405, 20, 20, PI-PI/64, TWO_PI);
  arc(205, 405, 20, 20, PI-PI/64, TWO_PI);

//cursor
  fill(cursorFill);
  triangle(mouseX, mouseY, mouseX+20, mouseY, mouseX, mouseY+20);
}

void mousePressed() {
  if (mouseX > x && mouseX < x+din && mouseY > y && mouseY < y+din) {
    over = true;
    offx = mouseX - x;
    offy = mouseY - y;
  } else {
    over = false;
  }
  clicked = true;
}
void mouseReleased () {
  clicked = false;
}


