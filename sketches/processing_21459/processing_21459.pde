
int x = 30;
int y = 10;
int paikkaX = 0;
int paikkaY = 0;
 
void setup(){
size (400,400);
noStroke();
frameRate(15);
}
void draw(){
paikkaX = random(400);
paikkaY = random(400);
fill(0, 200, random(200), random(255));
x = random(20,55)
y = random(15,65)
ellipse (paikkaX, paikkaY, x, y);
}
