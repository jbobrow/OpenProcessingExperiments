
/* @pjs font="Raleway-Light.ttf"; */

PImage beach ; 
PFont myFont ;

float x;

void setup() {
beach = loadImage("beach.jpg");
myFont = createFont("Raleway-Light.ttf", 20);

size(1000, 300);
noStroke();
}

void draw() {
image(beach, -250, 0);

fill(255);
ellipse(792, 205, 10, 10);
ellipse(782, 195, 10, 10);
ellipse(720, 160, 150, 80);
ellipse(650, 150, 140, 80); 
ellipse(725, 135, 160, 70);

fill(0);
textFont(myFont, 18);
text("If you left it up to me,", 610, 137);
text("every day would be a", 595, 157);
text("holiday from real", 620, 177);

fill(#FF7D03);
ellipse(x, 50, 70, 70);
fill(#FFE70D);
ellipse(x, 50, 60, 60);

fill(0);
rect(x-35, 40, 70, 5);
rect(x-32, 45, 30, 15, 0, 0, 20, 20);
rect(x+2, 45, 30, 15, 0, 0, 20, 20);

x = x+3;

if (x>1000){
  x=0 ;
}
}


