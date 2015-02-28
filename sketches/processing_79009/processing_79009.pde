
class Buttons {
  
  int localX, localY, localW, localH;
 
 Buttons(int x, int y, int w, int h) {
   localX = x;
   localY = y;
   localW = w;
   localH = h;
 }
 
 void pos() {
   noStroke();
   fill(0, 0, 0, 0);
   rect(localX, localY, localW, localH);
 }

//ahaha, optimization, what's that? 8D

  void redCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
    rinc++;
     if (rinc > 255) {
       rinc = 255;
     }
   } 
 }
 
 void redCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     rinc--;
     if (rinc < 0) {
       rinc = 0;
     }
   } 
 }
 
 //green
 void greenCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ginc++;
     if (ginc > 255) {
       ginc = 255;
     }
   } 
 }
 
 void greenCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ginc--;
     if (ginc < 0) {
       ginc = 0;
     }
   } 
 }
 
 //blue
 void blueCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     binc++;
     if (binc > 255) {
       binc = 255;
     }
   } 
 }
 
 void blueCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     binc--;
     if (binc < 0) {
       binc = 0;
     }
   } 
 }
 
 //alpha
 void alphaCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ainc++;
     if (binc > 255) {
       ainc = 255;
     }
   } 
 }
 
 void alphaCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ainc--;
     if (binc < 0) {
       ainc = 0;
     }
   } 
 }
 
 void strokeCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     swinc++;
     if (swinc > 50) {
       swinc = 50;
     }
   } 
 }
 
 void strokeCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     swinc--;
     if (swinc < 1) {
       swinc = 1;
     }
   } 
 }
 
 void squareCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     squareStroke = true;
     circleStroke = false;
     triangleStroke = false;
     lineStroke = false;
     eraser = false;
   } 
 }
 
 void circleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     circleStroke = true;
     squareStroke = false;
     triangleStroke = false;
     lineStroke = false;
     eraser = false;
   } 
 }
 
 void triangleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     triangleStroke = true;
     circleStroke = false;
     squareStroke = false;
     lineStroke = false;
     eraser = false;
   } 
 }
 
 void lineCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     lineStroke = true;
     squareStroke = false;
     circleStroke = false;
     triangleStroke = false;
     eraser = false;
   } 
 }
 
 void eraseCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     eraser = true;
     lineStroke = false;
     squareStroke = false;
     circleStroke = false;
     triangleStroke = false;
   }
 }
 
 void bgClearCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     background(255);
   }
 }
 
}

