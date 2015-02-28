
int x = 10;
int y = 10;
int paikkaX = 0;
int paikkaY = 0;

void setup (){
size (300,300);
noStroke();
frameRate(15);
}
void draw (){
paikkaX = random(300);
paikkaY = random(300);
fill(random(255),random(255),random(255),random(255));
x = random (5,50)
y =random (10,100)
ellipse (paikkaX, paikkaY, x,y);
}

