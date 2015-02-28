
int distance = 150; // must be of these proportions
 int vDist = 100;
 int sep = 25;
 Digit hourDigitA, hourDigitB, minuteDigitA, minuteDigitB, secondDigitA, secondDigitB;
 String s,s2, m, m2, h, h2;
 String timeS, timeM, timeH, h3;
 
 color cyan = color(0, 221, 255);
 color black = color(0);
 boolean[] toggle = new boolean[8];
 
void setup(){
 size(1280, 720); 
 background(0);
 
  // if (frame != null) {
  //  frame.setResizable(true);
  //}
}

void draw() {
  background(black);
  sep = 20; //modified size values
  distance = 120;
  vDist = 80;
  
 fill(cyan);
 timeS = String.valueOf(second());
 timeM = String.valueOf(minute());
 timeH = String.valueOf(hour());
 
 
 s = timeS.substring(0,1);
 if (timeS.length() == 2){
 s2 = timeS.substring(1, 2);
 } else {
   s2 = s;
  s = "0"; 
 }
 m = timeM.substring(0,1);
 if (timeM.length() == 2){
 m2 = timeM.substring(1, 2);
 }else {
   m2 = m;
  m = "0"; 
 }
 h = timeH.substring(0,1);
  if (timeH.length() == 2){
 h2 = timeH.substring(1, 2);
  }else {
  h2 = h;
  h = "0"; 
 }
 
 
 hourDigitA = new Digit(50,200, int(h));
 hourDigitB = new Digit(250,200, int(h2));
 minuteDigitA = new Digit(450,200, int(m));
 minuteDigitB = new Digit(650,200, int(m2));
 secondDigitA = new Digit(850, 200, int(s));
 secondDigitB = new Digit(1050, 200, int(s2));
}
 
 
class Digit{
Digit(int startX, int startY, int number) {
  
  if (number == 0) {
    toggle[1] = true;
    toggle[2] = true;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = false;
    toggle[7] = true;
  }
    if (number == 1) {
    toggle[1] = false;
    toggle[2] = false;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = false;
    toggle[6] = false;
    toggle[7] = false;
  }
    if (number == 2) {
    toggle[1] = false;
    toggle[2] = true;
    toggle[3] = true;
    toggle[4] = false;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = true;
  }
    if (number == 3) {
    toggle[1] = false;
    toggle[2] = false;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = true;
  }
    if (number == 4) {
    toggle[1] = true;
    toggle[2] = false;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = false;
    toggle[6] = true;
    toggle[7] = false;
  }
    if (number == 5) {
    toggle[1] = true;
    toggle[2] = false;
    toggle[3] = false;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = true;
  }
    if (number == 6) {
    toggle[1] = true;
    toggle[2] = true;
    toggle[3] = false;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = true;
  }
    if (number == 7) {
    toggle[1] = false;
    toggle[2] = false;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = false;
    toggle[7] = false;
  }
    if (number == 8) {
    toggle[1] = true;
    toggle[2] = true;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = true;
  }
    if (number == 9) {
    toggle[1] = true;
    toggle[2] = false;
    toggle[3] = true;
    toggle[4] = true;
    toggle[5] = true;
    toggle[6] = true;
    toggle[7] = false;
  }
  
 if (toggle[1]){
 //int startY = startX;
 
 beginShape(); //top left
 vertex(startX, startY);
 vertex(startX+sep, startY-sep);
 vertex(startX+sep*2, startY);
 vertex(startX+sep*2, startY+vDist);
 vertex(startX+sep, startY+vDist+sep);
 vertex(startX, startY+vDist);
// vertex(100,200);
 endShape(CLOSE);
 }
  if (toggle[2]){
  beginShape(); //bottom left
 vertex(startX, startY+distance);
 vertex(startX+sep, startY-sep+distance);
 vertex(startX+sep*2, startY+distance);
 vertex(startX+sep*2, startY+vDist+distance);
 vertex(startX+sep, startY+vDist+sep+distance);
 vertex(startX, startY+vDist+distance);
 endShape(CLOSE);
  }
  if (toggle[3]){
 beginShape(); //top right
 vertex(startX+distance, startY);
 vertex(startX+sep+distance, startY-sep);
 vertex(startX+2*sep+distance, startY);
 vertex(startX+2*sep+distance, startY+vDist);
 vertex(startX+sep+distance, startY+vDist+sep);
 vertex(startX+distance, startY+vDist);
 endShape(CLOSE);
  }
   if (toggle[4]){
 beginShape(); //bottom right
 vertex(startX+distance, startY+distance);
 vertex(startX+sep+distance, startY-sep+distance);
 vertex(startX+2*sep+distance, startY+distance);
 vertex(startX+2*sep+distance, startY+vDist+distance);
 vertex(startX+sep+distance, startY+vDist+sep+distance);
 vertex(startX+distance, startY+vDist+distance);
 endShape(CLOSE);
   }
    if (toggle[5]){
 beginShape(); //horizontal top
 vertex(startX+sep,startY-sep);
 vertex(startX+2*sep,startY);
 vertex(startX+distance, startY);
 vertex(startX+sep+distance,startY-sep);
 vertex(startX+distance, startY-2*sep);
 vertex(startX+2*sep,startY-2*sep);
 endShape(CLOSE);
    }
  if (toggle[6]){
  beginShape(); //horizontal middle
 vertex(startX+sep,startY-sep+distance);
 vertex(startX+2*sep,startY+distance);
 vertex(startX+distance, startY+distance);
 vertex(startX+sep+distance,startY-sep+distance);
 vertex(startX+distance, startY-2*sep+distance);
 vertex(startX+2*sep,startY-2*sep+distance);
 endShape(CLOSE);
  }
  if (toggle[7]){
  beginShape(); //horizontal bottom
 vertex(startX+sep,startY-sep+distance*2);
 vertex(startX+2*sep,startY+distance*2);
 vertex(startX+distance, startY+distance*2);
 vertex(startX+sep+distance,startY-sep+distance*2);
 vertex(startX+distance, startY-2*sep+distance*2);
 vertex(startX+2*sep,startY-2*sep+distance*2);
 endShape(CLOSE);
  }
 
}
}
