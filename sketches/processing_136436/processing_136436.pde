
void setup() {
  size (500, 500);
  background (255);
}

void draw() {  
noStroke ();




int c1 = round(map(mouseX, 0, height, 255, 0));
int c2 = round(map(mouseY, 0, height, 255, 0));
int y1 = round(map(mouseY, 0, height, 100, 400));
int y2 = round(map(mouseY, 0, height, 300, 0));
fill(y1,y2,0,10);
rect (200, y1, 100, 100);
fill(y2,y1,0,10);
rect (200, y2, 100, 100);

fill(c2,c1,0,10);
for (int h = 100; h < height; h+=100){
ellipse (y1-100, h, 100, 100);
ellipse (y2+200, h, 100, 100);

ellipse (y1-100, 475, 50, 50);
ellipse (y2+200, 475, 50, 50);


stroke (y1,y2,0);
line (200, y1, y1-100,h);
line (300, y1, y2+200,h);

}
}


