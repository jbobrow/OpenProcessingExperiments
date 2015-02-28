
float x = 0;
float y = 100;
float speed = 2;
float x1 = 50;
float y1 = 120;
float speed1 = 2;
float x2 = 90;
float y2 = 120;
float speed2 = 2;
float x3 = 20;
float y3 = 50;
float speed3 = 2;
float x4 = 120;
float y4 = 50;
float speed4 = 2;
float x5 = 80;
float y5 = 70;
float speed5 = 2;
float x6 = 80;
float y6 = 40;
float speed6 = 2;
float x7 = 100;
float y7 = 100;
float speed7 = 2;
float x8 = 80;
float y8 = 450;
float speed8 = 1;
float x9 = 0;
float y9 = 475;

void setup() {
size(500,500);
}

void draw() {
background(255);
move1();
move2();
move3();
move4();
move5();
move6();
move7();
move8();
move9();
display();
}

void move1() {
x = x + speed;
if (x > width+40) {
x = 40-width;
}
}
void move2() {
x1 = x1 + speed1;
if (x1 > width+40) {
x1 = 40-width;
}
}
void move3() {
x2 = x2 + speed2;
if (x2 > width+40) {
x2 = 40-width;
}
}
void move4() {
x3 = x3 + speed3;
if (x3 > width+40) {
x3 = 40-width;
}
}
void move5() {
x4 = x4 + speed4;
if (x4 > width+40) {
x4 = 40-width;
}
}
void move6() {
x5 = x5 + speed5;
if (x5 > width+40) {
x5 = 40-width;
}
}
void move7() {
x6 = x6 + speed6;
if (x6 > width+40) {
x6 =40-width;
}
}
void move8() {
x7 = x7 + speed7;
if (x7 > width+40) {
x7 = 40-width;
}
}
void move9() {
x8 = x8 + speed8;
if (x8 > width-x8-80) {
speed8 = -speed8;}
if (x8<40) { 
speed8 = -speed8;

}
}

void display() {
//движение тучи
fill(0,200,255);
ellipse(x,y,80,80);
noStroke();
fill(0,200,255);
ellipse(x1,y1,60,70);
fill(0,200,255);
ellipse(x2,y2,70,90);
fill(0,200,255);
ellipse(x3,y3,100,90);
fill(0,200,255);
ellipse(x4,y4,80,80);
fill(0,200,255);
ellipse(x5,y5,60,70);
fill(0,200,255);
ellipse(x6,y6,70,90);
fill(0,200,255);
ellipse(x7,y7,100,90);
fill(100,50,10);
rect(x8,y8,250,50,-40,200);
fill(0,0,255);
rect(x9,y9,height,width,10,10);
}
