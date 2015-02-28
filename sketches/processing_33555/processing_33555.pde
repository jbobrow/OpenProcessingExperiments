
PImage bird;
float xPos;
float yPos;
 
 //----------------------------------//
 
void setup() {
size(465,391);
smooth();
bird = loadImage("bird.gif");

}

//--------------------------------------//

void draw() {
image(bird,0,0);
 
if (mousePressed == true) {
fill(#f04858);
ellipse(260, 213, 50, 20);
ellipse(310, 215, 50, 20);
}

else {
  fill(255);
ellipse(265, 218, 50, 50);
ellipse(310, 220, 50, 50);


fill(0);
float shift1= atan2(mouseY-50, mouseX-80);
float x1 = 260 + 20*cos(shift1);
float y1 = 218 + 20*sin(shift1);
ellipse(x1, y1, 8,15);
 
 
float shift2= atan2(mouseY-300, mouseX-200);
float x2 = 305 + 18*cos(shift2);
float y2 = 220 + 18*sin(shift2);
ellipse(x2, y2, 8,15);

}
   
}

