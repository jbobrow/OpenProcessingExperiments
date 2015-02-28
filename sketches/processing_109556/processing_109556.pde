
void setup() {
  size(640, 360);
background(#000000); 
noStroke();
 

fill(#171CA0);
triangle(360, 40, 425, 90, 465, 50);

triangle(180, 55, 225, 100, 265, 47);


PImage scales;
scales = loadImage("scales.png");

image(scales, 185, 23);

fill(#FFFFFF);
triangle(225, 300, 186, 250, 225, 250);
triangle(425, 300, 425, 250, 465, 250);

fill(#FFDE1F);
ellipse(252, 144, 72, 72);
ellipse(398, 144, 72, 72);

fill(#000000);
ellipse(252, 144, 10, 70);
ellipse(398, 144, 10, 70);

fill(#171CA0);
arc(252, 142, 72, 72, PI, TWO_PI);
arc(398, 142, 72, 72, PI, TWO_PI);

fill(#000000);
ellipse(350, 200, 10, 30);
ellipse(300, 200, 10, 30);

fill(#171CA0);
triangle(0, 0, 0, 360, 230, 365);
triangle(400, 400, 647, 359, 639, 0);

}

void draw() {
  println(mouseX + ", " + mouseY) ; 
}




