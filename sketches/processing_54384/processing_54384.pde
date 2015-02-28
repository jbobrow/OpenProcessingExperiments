
float RectangleAX = 215;
float RectangleAY = 235;
float RectangleAWidth = 200; 
float RectangleAHeight = 150;
float RectangleBX;
float RectangleBY; // y
float RectangleBWeight = 150; 
float RectangleBHeight = 100; // height
 
 
 
void setup() {
  size(500, 450);
  smooth();
}
 
 
 
 
void draw() {
background(#10FF00);
 
RectangleBX = mouseX-60;
RectangleBY = mouseY-50;
 
if (rectRectIntersect(RectangleAX, RectangleAY, RectangleAX+RectangleAWidth, RectangleAY+RectangleAHeight, RectangleBX, RectangleBY, RectangleBX+RectangleBWeight, RectangleBY+RectangleBHeight) == true) {
fill(#FAFF00);
}

else {
fill(#F200FF);
}
 
rect(RectangleAX, RectangleAY, RectangleAWidth, RectangleAHeight);
rect(RectangleBX, RectangleBY, RectangleBWeight, RectangleBHeight);
 
}

 
boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom) {
return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

                
