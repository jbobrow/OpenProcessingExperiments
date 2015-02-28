
float start = 0.785;
float stop= 5.497;
float incr = .1;
int xPos = -50; // <=========

void setup(){
  size(800, 100);
  noStroke();
  fill (245,255,15);
}
void draw(){
  background(0);
arc (xPos,50,80,80, start, stop);  // <=========
start = start - incr;
stop = stop + incr;
if (start <= 0 || start >=0.786){
  incr = incr * -1;
}
xPos = xPos + 10;  // <=========
if (xPos >= 850){ // <=========
  xPos = -50;
}
println("+start= " + start + " stop= " +stop);
}
