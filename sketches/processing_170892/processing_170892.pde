

void setup() {
size (600,600);
background(255);
frameRate (2);
//noLoop();
}

int x;
int y;

void draw() {
x= int (random(10,200));
y=int (random(30,60));
background(70,50,90);
fill(255 ,35, 150);
rect(x,y,60,10);
fill(255,35,15);
rect(x+25,y,10,90);
x= int (random(100,300));
y=int (random(80,180));
fill(150 ,35,45);
rect(x+25,y,10,90);
x= int (random(90,300));
y=int (random(250,380));
fill(255,255,00);
ellipse(x,y,30,90);
rect(x+10,y-45,10,90);
fill(159,58,152);
x= int (random(100,450));
y=int (random(150,380));
rect(x+20,y+20,10,90);
strokeWeight(5);
line(x+20,y+20,x+40,y+80);
rect(x+60,y+20,10,90);
line(x+40,y+80,x+60,y+20);
fill(200,125,62);
x= int (random(100,300));
y=int (random(250,580));
ellipse(x+50,y+50,30,90);

 }
