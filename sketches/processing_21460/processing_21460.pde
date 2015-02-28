
int x = 10;
int y = 10;
int paikkaX = 0;
int paikkaY = 0;

void setup(){
size (300,300);
noStroke();
frameRate(15);
}
void draw(){
paikkaX = random(width);    
paikkaY = random(height);  
fill(random(255),40,100,random(255));
x = random(5,20);
y = random(5,20);
ellipse (paikkaX,paikkaY,x,y);
}
