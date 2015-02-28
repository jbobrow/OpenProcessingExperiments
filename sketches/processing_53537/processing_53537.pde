
float RX1 = 125; // x
float RY1 = 145; // y
float RW1 = 150; // width
float RH1 = 100; // height

float RX2; // x
float RY2; // y
float RW2 = 120; // width
float RH2 = 100; // height

void setup() {
  size(400, 400); 
  smooth();
}

void draw() {
background(0,255,0); 

RX2 = mouseX-60;
RY2 = mouseY-50;

if (rectRectIntersect(RX1, RY1, RX1+RW1, RY1+RH1, RX2, RY2, RX2+RW2, RY2+RH2) == true) {
fill(255,0,0);
} else {
fill(0,0,255);
}

rect(RX1, RY1, RW1, RH1);
rect(RX2, RY2, RW2, RH2);

}
/* After alot of thinking, this part finally makes sense to me. It calls upon the intersecting commands, 
attaches to the "if" statement at the top (float left = RX1, float right = RX1+RW1...ect.). 
CAN NAME THEM ANYTHING YOU WANT!!

return basically tells the retangles at what point they truely intersect! 
("left > otherRight" means that Rect1 leftside is intersecting with Rect2 rightside) 
OPEN SKETCH TO VISUALLY SEE WHAT I'M TALKING ABOUT!

The above is meant to make sense to me, and essentially remind me what is giong on inside this code.
*/

boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom) {
return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}




