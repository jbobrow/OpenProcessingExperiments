
float x = 60;
float y = 140;
float speed = 2;
float x1 = 75;
float y1 = 165;
float speed1 = 2;
float x2 = 110;
float y2 = 160;
float speed2 = 2;
float x3 = 55;
float y3 = 95;
float speed3 = 2;
float x4 = 140;
float y4 = 90;
float speed4 = 2;
float x5 = 100;
float y5 = 110;
float speed5 = 2;
float x6 = 100;
float y6 = 80;
float speed6 = 2;
float x7 = 120;
float y7 = 140;
float speed7 = 2;
//dom
float x8 = 400;
float y8 = 400;
//zemlya
float x9 = 0;
float y9 = 475;
//okna
float x10 = 410;
float y10 = 410;

float x11 = 450;
float y11 = 410;

float x13 = 410;
float y13 = 450;

float x14 = 450;
float y14 = 450;

//solnce
float x12 = 40;
float y12 = 40;
float speed12 = 1;

//mashina
float x15 = 40;
float y15 = 430;
float x16 = 45;
float y16 = 460;
float x17 = 115;
float y17 = 460;
float x18 = 55;
float y18 = 410;
float speed15 = 1.5;
float speed16 = 1.5;
float speed17 = 1.5;
float speed18 = 1.5;

void setup() {
size(500,500);
}

void draw() {
background(198,226,255);
move1();
move2();
move3();
move4();
move5();
move6();
move7();
move8();
move12();
//mashina
move13();
move14();
move15();
move16();
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



void move12() {
x12 = x12 + speed12;
if (x12 > 450) {
speed12 = -speed12;}
if (x12<40) { 
speed12 = -speed12;


}
}
void move13() {
x15 = x15 + speed15;
if (x15 > width+40) {
x15 = 40-width;


}
}
void move14() {
x16 = x16 + speed16;
if (x16 > width+40) {
x16 = 40-width;


}
}
void move15() {
x17 = x17 + speed17;
if (x17 > width+40) {
x17 = 40-width;


}
}
void move16() {
x18 = x18 + speed18;
if (x18 > width+40) {
x18 = 40-width;


}
}


void display() {
//движение тучи
fill(255,255,0);
ellipse(x12,y12,60,60);

fill(108,123,139);
ellipse(x,y,60,60);
noStroke();
fill(108,123,139);
ellipse(x1,y1,40,50);
fill(108,123,139);
ellipse(x2,y2,50,70);
fill(108,123,139);
ellipse(x3,y3,80,70);
fill(108,123,139);
ellipse(x4,y4,60,60);
fill(108,123,139);
ellipse(x5,y5,50,70);
fill(108,123,139);
ellipse(x6,y6,50,70);
fill(108,123,139);
ellipse(x7,y7,80,70);
fill(34,139,34);
rect(x9,y9,height,width,0,0);
//dom
fill(168,168,168);
rect(x8,y8,80,75,0,0);
fill(255,140,0);
rect(x10,y10,20,20,0,0);
rect(x11,y11,20,20,0,0);
rect(x13,y13,20,20,0,0);
rect(x14,y14,20,20,0,0);
fill(139,90,43);
triangle(390, 400, 490, 400, 440, 350);

//mashina
fill(255,48,48);
rect(x15,y15,80,30,80,0);
rect(x18,y18,50,30,10,10);
fill(0,0,0);
ellipse(x16,y16,30,30);
ellipse(x17,y17,30,30);

}
