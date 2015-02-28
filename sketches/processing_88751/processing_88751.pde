
Dot[] d;
int count = 100;

void setup(){
 size (1200,800);
 background(0);
 d = new Dot[count];
 for (int i = 0; i < count; i++){
   d[i] = new Dot();
 }
}

void draw(){
  for (int i = 0; i < count; i++){
    d[i].runSeries();
 }
}


void mousePressed(){
 saveFrame("squiggle-####.png");
}

void keyPressed(){
// saveFrame("squiggle-####.png");
 background(0);
}
class Dot {

 float x;
 float y;
 float angle;
 int dart;
 int v;
 int v1;
 float divisor;
 color c;

 Dot() {

 x = random(width);
 y = random(height);
 divisor = random(10);
 angle = 0.0;
 dart = 1;
 v = 1;
 v1 = 1;
 float r = 55 + random(200);
 float g = 55 + random(200);
 float b = 55 + random(200);
 c = color(r,g,b);
 }


 void setColor(){
   fill(c);
   stroke(c);
 }

void drawMark(){
 // ellipse (x,y,3,3);
  point(x,y);
}

void increment(){
   y = y + 1 + ((sin(angle) * 2.0) * v1);
 if (dart>0){
   x = x  + ((cos(angle) * 2.0) * v);
 }else {
   x = x  + ((tan(angle) * 2.0) * v);
 }

 angle += PI/divisor;

 divisor = divisor + .1;
 if (divisor > 100.0){
   divisor = 10.0;
 }
}

void directionCheck(){
 if (random(500) < 10 ){
   v = v * (-1);
 }
 if (random(600) < 10){
   v1 = v1 * (-1);
 }
 if (random(200) < 10){
   dart = dart * (-1);
 }

}

void edgeCheck(){
  if (x > width) {
   x = 0;
 }
 if (x < 0 ) {
   x = width;
 }
 if (y > height) {
   y = 0;
 }
 if (y < 0) {
   y = height;
 }
}

void runSeries(){
 setColor();
 drawMark();  
 increment();
 edgeCheck();
 directionCheck(); 
}

}


