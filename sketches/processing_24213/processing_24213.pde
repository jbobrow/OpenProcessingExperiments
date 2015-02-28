
Zoog zoog1;
Zoog zoog2;
Zoog zoog3;
float gravity = 0.1;

void setup() {
size(200,200);
smooth();

zoog1 = new Zoog(50,0,40,color(225,178,228),3);
zoog2 = new Zoog(120,0,80,color(252,157,13),1);
zoog3 = new Zoog(180,0,60,color(124,124,124),-1);
}

void draw() {
background(255);
zoog1.display();
zoog1.move();
zoog2.display();
zoog2.move();
zoog3.display();
zoog3.move();
}

class Zoog {
float x;
float y;
float speed;
float w;
color c;

Zoog(float tempX,float tempY,float tempW,color tempC,float tempSpeed) {
x = tempX;
y = tempY;
w = tempW;
c = tempC;
speed = tempSpeed;
}

void display() {
//body
fill(c);
stroke(0); 
ellipse(x,y+30,28,40); 

//head
ellipse(x,y,w,w); 

//hands
ellipse(x-7,y+40,8,8);
ellipse(x+8,y+40,8,8);

//nose 
ellipse(x,y+20,8,4); 

//eyes
ellipse(x-10,y+10,8,16); 
ellipse(x+10,y+10,8,16);  
stroke(0);
ellipse(x-11,y+7,4,8); 
ellipse(x+9,y+7,4,8); 

//feet
stroke(0);
ellipse(x-13,y+52,25,15); 
ellipse(x+14,y+52,25,15);

//ears
stroke(0);
ellipse(x-19,y-35,16,32); 
ellipse(x+19,y-35,16,32); 
stroke(0);
ellipse(x-18,y-25,8,16); 
ellipse(x+18,y-25,8,16); 

}

void move() {
y = y + speed;
speed = speed + gravity;
if (y > height) {
speed = speed * -1;
}
}
}

