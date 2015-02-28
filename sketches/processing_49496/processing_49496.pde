

float myFloat = 50;

Circle myCircle = new Circle();
Circle myCircle2 = new Circle();
Circle myCircle3 = new Circle();



void setup(){
 size (400, 400);
 smooth(); 
 
 myCircle2.x = 250;
 myCircle3.x = 300;
 
}

void draw(){
  background (250);
  myCircle.drawCircle();
  myCircle2.drawCircle();
  myCircle3.drawCircle();
  
  
}

class Circle {
 
 float x; 
 float y;
 float circleSize;
 
 Circle(){
   x = 200;
   y = 100;
   circleSize = 50;
   
 }

 void drawCircle(){
   
   fill (60, 0, 60);
   ellipse (x, y, circleSize, circleSize);
      
 }

}
