
int x = 150;
int y= 300;
int radius = 12;
PImage maquarieplace;
PFont font;

void setup() {
size(400, 600);
smooth();
background(220, 150, 78);
maquarieplace= loadImage ("maquarieplace.jpg");
font = loadFont("AndaleMono-36.vlw");
textFont(font);
}

//
void draw() {
image(maquarieplace, 0, 0);

stroke(78, 135, 99, 150);
strokeWeight(3);
line(x, y-100, x, y-230);
line(x-2, y-100, x-2, y-230);
line(x+2, y-100, x+2, y-230);
line(x+4, y-100, x+4, y-230);
line(x-4, y-100, x-4, y-230);

//body

fill(187, 73, 180);
rectMode(CENTER);
rect(x, y, 10, 300);
rect(x, y, 100, 10);
ellipse(x, y-150, 50*1.5, 50);

//face

fill(0);
float d= dist(mouseX, mouseY, x, y);
ellipse(x-15, y-150, 8*3, 8*3.5);
if(keyPressed) {
ellipse(x+10, y-150, 10, 10);
}
fill(255, 0, 0);
line(x-5, y-140, x+5, y-140);

//skirt


strokeWeight(5);
stroke(150, 0, 0, 60);
strokeJoin(ROUND);
fill(220, 172, 181);
float mx = mouseX/2 + 60;
triangle(x, y-5, mouseX,y+200, x-100, y+200);
fill(200, 172, 220);
rect(x, y+200, 200, 20);
float my = mouseY-60;
rect(x-20, my, 40, 17);
rect(x+29, my, 3, 10);
fill(187, 83, 180);
textSize(22);
text("Blowing in the wind....", 90,580);


}

