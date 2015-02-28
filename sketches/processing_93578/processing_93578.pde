
int circleFill = 175;
int rectFill = 255;

int circleO = 25;
int circleA = 35;
int circleC = 85;
int circleB = 280;
int circleD = 60;
int circleE = 40;

int rectA = 10;
int rectB = 100;
int rectC = 120;
int rectD = 230;
int rectE = 240;
int rectF = 80;
int rectG = 20;

int lineA = 170;
int lineB = 10;
int lineC = 60;
int lineD = 120;
int lineE = 110;
int lineF = 220;






void setup () {
  size (350,200);
}
 void draw() {
  background (255);
rect (rectA, rectA, rectB, rectB);
fill (circleFill);
ellipse (circleA, circleA, circleO, circleO);
ellipse (circleC, circleA, circleO, circleO);
ellipse (circleA, circleC, circleO, circleO);
ellipse (circleC, circleC, circleO, circleO);

fill(rectFill);
rect(rectC, rectA, rectB, rectB);
line (lineA, lineB, lineA, lineC);
line (lineA, lineC, lineD, lineE);
line (lineA, lineC, lineF, lineE);


fill(rectFill);
rect(rectD, rectA, rectB, rectB);
fill (circleFill);
rect( rectE, rectG, rectF, rectF);
fill(rectFill);
ellipse (circleB, circleD, circleE, circleE);
 
   rectD = rectD +1;
   circleA = circleA +1;
   rectA =rectA +1;
   rectE = rectE +2;
   lineA =lineA -1;
   lineB = lineB-2;
   lineC = lineC+3;
   circleE = circleE +1;

 }


