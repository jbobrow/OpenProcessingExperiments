
class Buttons {
  
  int localX, localY, localW, localH;
 
 Buttons(int x, int y, int w, int h) {
   localX = x;
   localY = y;
   localW = w;
   localH = h;
 }
 
 void pos() {
   rect(localX, localY, localW, localH);
   line(localX, localY-(localH/4), localX, localY+(localH/4));
   line(localX-(localW/4), localY, localX+(localW/4), localY);
 }
 
 void neg() {
   rect(localX, localY, localW, localH);
   line(localX-(localW/4), localY, localX+(localW/4), localY);
 }
 
 void lineShape() {
   rect(localX, localY, localW, localH);
   strokeWeight(2);
   line(localX-(localW/4), localY, localX+(localW/4), localY);
 }
 
 void squareShape() {
   rect(localX, localY, localW, localH);
   rect(localX, localY, localW-20, localH-20);
 }
 
 void circleShape() {
   rect(localX, localY, localW, localH);
   ellipse(localX, localY, localW-20, localH-20);
 }
 
 void triangleShape() {
   rect(localX, localY, localW, localH);
    beginShape(TRIANGLES);
    vertex(localX, localY-10);
    vertex(localX+10, localY+10);
    vertex(localX-10, localY+10);
    endShape();
 }
 
 //I tried to optimize this, but the way I have it set up... pvp
 //it just won't work otherwise @A@ or maybe I'm not being creative enough...
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
     if (swinc > 100) {
       swinc = 100;
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
   } 
 }
 
 void circleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     circleStroke = true;
     squareStroke = false;
     triangleStroke = false;
     lineStroke = false;
   } 
 }
 
 void triangleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     triangleStroke = true;
     circleStroke = false;
     squareStroke = false;
     lineStroke = false;
   } 
 }
 
 void lineCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     lineStroke = true;
     squareStroke = false;
     circleStroke = false;
     triangleStroke = false;
   } 
 }
 
}

