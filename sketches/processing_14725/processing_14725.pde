
PImage img;

float angle = 0.0;

int x= 10;
int y= 20;

void setup() {
size (700,500);
img = loadImage ("jaajaaa.JPG");

noStroke();
smooth();
}

void draw () {
image (img, 0, 0);  
  
translate(mouseX, mouseY);
rotate(angle);
angle += 0.1;
  
fill (220, 0, 0);

ellipse (x, y, 10, 10);
ellipse (x, y+30, 10, 10);
ellipse (x, y+60, 10, 10);
ellipse (x, y+90, 10, 10);

ellipse (x+30, y, 10, 10);
fill (220, 0, 0);
ellipse (x+60, y, 10, 10);
ellipse (x+90, y, 10, 10);
ellipse (x+120, y+120, 10, 10);
ellipse (x+30, y+30, 10, 10);
ellipse (x+60, y+60, 10, 10);

stroke(1);
line(mouseX+1 ,mouseY+2 ,350 ,300);
line(mouseX+5 ,mouseY+9 ,450 ,450);
line(mouseX+10 ,mouseY+14 ,500 ,500);
line(mouseX+20 ,mouseY+23 ,120 ,120);
line(mouseX+30 ,mouseY+34 ,80 ,80);

}

