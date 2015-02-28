
class Cell {
  int x,y,w,h;
  color c = 100;
  color c1;
  boolean on = false;
   Cell(int _x, int _y, int _w, int _h, color _c) {
     x = _x;
     y = _y;
     w = _w;
     h = _h;
     c1 = _c;
   }
 void display() {
   rectMode(CENTER);
   strokeWeight(2);
   if(on == false) {
     c = 100;
   }
   else {
     c = c1;
   }
   fill(c);
   rect(x,y,w,h);
 }
 boolean over() {
   return mouseX <= x+w/2 && mouseX >= x-w/2 && mouseY <= y+h/2 && mouseY >= y-h/2;
 }
 boolean pressed() {
   if(over()) {
     on = !on;
    return true;
   }
   return false;
 }
 void death() {
   on = false;
 }
 void birth() {
   on = true;
 }
 boolean alive() {
   if(c == c1) {
     return true;
   }
   return false;
 }
 boolean notAlive() {
   if(c == 100) {
     return true;
   }
   return false;
 }
}

