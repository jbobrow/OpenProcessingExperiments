
void setup() {
size(600,600);
strokeWeight(0.3);
}


void draw() {
background(249,236,220);


fill(211,76,48);  
triangle(47,130,70,130,59,160);
tri1(63, 261,235,183,1);

noFill();
triangle(99,159,120,159,107,128);
tri1(111, 261,231,133,134);

fill(208,108,27);
triangle(158,158,143,125,177,125);
tri2(158, 158, 224, 143, 175, 255);
rectMode(CORNERS);

fill(25,45,80);
rect(135,186,184,188);
rect(135,193,184,196);
rect(136,202,184,206);

fill(73,74,165);
triangle(237,124,219,158,252,158);

tri2(236, 158, 0, 0, 0, 0);

tri3(325, 186, 230, 163, 29);
fill(198,44,17);
triangle(325,186,310,156,342,157);
fill(95,152,168);
triangle(325,156,313,124,336,124);

tri3(405, 186, 15, 29, 145);
noFill();
triangle(389,184,422,184,405,157);
fill(237,198,51);
triangle(397,156,413,156,403,125);

noFill();
triangle(497,158,460,260,542,259);
fill(208,81,88);
ellipse(498,138,40,40);


tri4(60,445,4,22,105,233,159,73,88,146,170,219,95,72,202,98,23,164,161,204);
noFill();



quad1(139,372,206,62,45,129,128,191);

tri5(139,445,255,100,100, 0, 244,210,82, 255);
fill(221,128,45);
ellipse(234,375,33,33);
fill(221,101,81);

triangle(210,392,260,392,234,442);
fill(255,255,236,120);
rect(208,380,260,385);

float x = 150;
fill(222,143,37);
bezier(297+x,445,303+x,365,404+x,365,412+x,445);
line(297+x,445,412+x,445);
fill(235,187,3);
bezier(490,326,492,303,522,303,524,326);
line(485,326, 529,326);
triangle(490,326,504,385,495,326);
triangle(524,326,504,385,520,326);
strokeWeight(2);
stroke(167,37,10);
line(470,340,545,340);
line(480,365,530,365);
stroke(0);
strokeWeight(0.5);
line(307,445,402,445);
fill(184,182,121);
bezier(307,445,298,365,409,365,402,445);

fill(255,0,0);
ellipse(351,321,30,30);
fill(215,120,44);
ellipse(351,361,50,50);
translate(351, 361);
rotate(PI/3.7);
fill(75,136,157);
rect(-2, -50, 2, 50);
rotate(PI/2.3);
fill(75,136,157);
rect(-2, -50, 2, 50);
fill(255);
rect(-2, -2, 2, 2);


println(mouseX);

noFill();
//ellipse(234,380,40,40);





}


void tri1(float x1, float y1, float ColorR, float ColorG, float ColorB){
fill(ColorR, ColorG, ColorB);
triangle(x1-17,y1-102,x1+14,y1-102,x1,y1);
}

void tri2(float x1, float y1, float ColorR, float ColorG, float ColorB, float Alpha){
fill(ColorR, ColorG, ColorB, Alpha);
triangle(x1,y1,x1-24,y1+105,x1+26,y1+105);
}

void tri3(float x1, float y1, float ColorR, float ColorG, float ColorB){
fill(ColorR, ColorG, ColorB);

triangle(x1-30,y1+74,x1+32,y1+74,x1,y1);
}


void tri4(float x1, float y1, float ColorR1, float ColorG1, float ColorB1, float ColorR2, float ColorG2, float ColorB2, float ColorR3, float ColorG3, float ColorB3, float ColorR4, float ColorG4, float ColorB4, float ColorR5, float ColorG5, float ColorB5, float ColorR6, float ColorG6, float ColorB6){
fill(ColorR1, ColorG1, ColorB1);
triangle(x1,y1,x1-23,y1-73,x1,y1-73);
fill(ColorR2, ColorG2, ColorB2);
triangle(x1,y1-73,x1+23,y1-73,x1,y1);
fill(ColorR3, ColorG3, ColorB3);
triangle(x1,y1-73,x1-16,y1-105,x1,y1-105);
fill(ColorR4, ColorG4, ColorB4);
triangle(x1,y1-73,x1+16,y1-105,x1,y1-105);
fill(ColorR5, ColorG5, ColorB5);
triangle(x1-15,y1-137,x1,y1-137,x1,y1-105);
fill(ColorR6, ColorG6, ColorB6);
triangle(x1+15,y1-137,x1,y1-137,x1,y1-105);
}

void tri5(float x1, float y1, float ColorR1, float ColorG1, float ColorB1, float Alpha1, float ColorR2, float ColorG2, float ColorB2, float Alpha2){
fill(ColorR1, ColorG1, ColorB1, Alpha1);
triangle(x1,y1,x1-23,y1-73,x1,y1-73);
fill(ColorR2, ColorG2, ColorB2, Alpha2);
triangle(x1,y1-73,x1+23,y1-73,x1,y1);
}

void quad1(float x1, float y1, float ColorR1, float ColorG1, float ColorB1, float ColorR2, float ColorG2, float ColorB2){
noFill();
quad(x1,y1-63,x1-16,y1-33,x1,y1,x1+16,y1-33);
fill(ColorR1, ColorG1, ColorB1);
triangle(x1,y1-63,x1,y1-33,x1-16,y1-33);
fill(ColorR2, ColorG2, ColorB2);
triangle(x1,y1-33,x1+16,y1-33,x1,y1);
}






