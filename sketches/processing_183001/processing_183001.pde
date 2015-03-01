
void setup() {
  size(800, 400);
  frameRate(22);
}

void draw() {
  andlit(200, 200);
  andlit(500, 200);
}
  
void andlit(int x, int y) {
  
fill(x+55, y-20, 150);
ellipse(x, y, 200, 250);
fill(x+55, 255, 255);
ellipse(x, y, 170, 220);
fill(255, 255, 255);
ellipse(x-40, y-20, 30, 20);
ellipse(x+ 40, y-20, 30, 20);
fill(78, 139, 235);
ellipse(x-40, y-20, 15, 15);
ellipse(x+40, y-20, 15, 15);
fill(0, 0, 0);
ellipse(x-40, y-20, 8, 8);
ellipse(x+40, y-20, 8, 8);
fill(255, 255, 255);
ellipse(x-37, y-25, 4, 4);
ellipse(x+43, y-25, 4, 4);
fill(245, 5, 5);
ellipse(x, y+10, 40, 40);
fill(255, 255, 255);
ellipse(x+5, y, 10, 10);
fill(245, 5, 5);
rect(x-50, y+40, 100, 30, 3000);
fill(random(255), random(255), random(255));
noStroke();
rect(x-200, y-200, 5, 400);
rect(x-170, y-200, 9, 400);
rect(x-100, y-200, 15, 400);
rect(x+200, y-200, 17, 400);
rect(x+100, y-200, 5, 400);
rect(x+70, y-200, 12, 400);
rect(x+170, y-200, 8, 400);
rect(x, y-200, 5, 400);

stroke(0);


}




