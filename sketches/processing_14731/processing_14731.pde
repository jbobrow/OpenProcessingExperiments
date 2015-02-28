

PImage img;
float angle = 0.0;

int x= 10;
int y= 50;

void setup() {
size (400,320);
img = loadImage ("molecula.jpg");


noStroke();
smooth();
}

void draw () {
image (img, 0, 0);  
  
translate(mouseX, mouseY);
rotate(angle);
angle -= 0.9;
  
fill (133, 245,243);
noStroke ();
ellipse (x, y, 5, 10);
ellipse (x, y+30, 10, 20);
fill(243,238,33);
ellipse (x, y+60, 15, 20);
ellipse (x, y+90, 20, 35);

ellipse (x+10, y+40, 10, 10);
fill (145, 220, 234);
ellipse (x+10, y, 10, 10);
ellipse (x+30, y, 10, 10);
ellipse (x+30, y+30, 10, 10);
fill(45,248,22);
ellipse (x+50, y+120, 10, 10);


ellipse (x+90, y+60, 10, 10);

stroke(10);
line(mouseX ,mouseY+1 ,150 ,100);
stroke(50);
line(mouseX+2 ,mouseY+6 ,50 ,50);
line(mouseX+4 ,mouseY+12 ,70 ,70);
line(mouseY+6 ,mouseX+18 ,20 ,20);
line(mouseX+8 ,mouseY+24 ,80 ,80);

}

