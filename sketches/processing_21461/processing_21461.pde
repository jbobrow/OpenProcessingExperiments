
int x = 25;
int y = 10;
int paikkaX = 0;
int paikkaY = 0;

void setup(){
size (300,300);
noStroke();
frameRate(25);
}
void draw(){
paikkaX = random(width); 
paikkaY = random(height); 
fill(random(255), random(255),30, random(255));
x = random(5,30);
y = random(5,30);
ellipse (paikkaX, paikkaY, x, y);
}          
