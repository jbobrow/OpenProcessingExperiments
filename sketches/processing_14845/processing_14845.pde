
PImage img;

float angle = 0.0;

int x= 1;
int y= 2;

void setup() {
size (1300,867);
img = loadImage ("perro.jpg");

noStroke();
smooth();
}

void draw () {
image (img, 37, 0);  
  
rotate(angle);
translate(mouseX, mouseY);
angle += 0.1;
  
fill (22, 76, 0);




line(mouseX+1 ,mouseY+7 ,100 ,0);
line(mouseX+5 ,mouseY+7 ,56 ,0);
line(mouseX+10 ,mouseY+133 ,50 ,50);
line(mouseX+20 ,mouseY+243 ,87 ,0);
line(mouseX+30 ,mouseY+34 ,44 ,0);



line(mouseX+10 ,mouseY+133 ,50 ,50);
line(mouseX+20 ,mouseY+243 ,87 ,0);
line(mouseX+30 ,mouseY+34 ,44 ,0);




line(mouseX+10 ,mouseY+133 ,50 ,50);
line(mouseX+20 ,mouseY+243 ,87 ,0);
line(mouseX+30 ,mouseY+34 ,44 ,0);




line(mouseX+10 ,mouseY+133 ,50 ,50);
line(mouseX+20 ,mouseY+243 ,87 ,0);
line(mouseX+30 ,mouseY+34 ,44 ,0);


stroke(999);

ellipse (x+30, y, 10, 10);
fill (777, 0, 0);
ellipse (x+60, y, 10, 10);
ellipse (x+50, y, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);
ellipse (x, y, 10, 10);
ellipse (x, y+7, 10, 10);

}

