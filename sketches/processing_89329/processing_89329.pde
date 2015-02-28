
color[] life = {#D9B343, #038C7F, #027373, #F28C3A, #BF3F34};
color[] palette = life;

int wide = 600;
int high = 200;

int d = 20;

float x1 = random(wide);
float y1 = random(high);
float easing1 = .03;

float x2 = random(wide);
float y2 = random(high);
float easing2 = .07;

float x3 = random(wide);
float y3 = random(high);
float easing3 = 1;

void setup(){
 size(wide, high);
 smooth();
 stokeWeight(1.5);
 cursor(HAND);
}

void draw(){
 background(palette[0]);
 stroke(palette[1]);
 noFill();
 ellipse(x1, y1, d+10, d+10);
 x1 += (mouseX - x1)*easing1;
 y1 += (mouseY - y1)*easing1;
 
stroke(palette[2]);
noFill();
ellipse(x2, y2, d+10, d+10);
x2 += (mouseX - x2)*easing2;
y2 += (mouseY – y2)*easing2;

stroke(palette[3]);
noFill();
ellipse(x3, y3, d+10, d+10);
x3 += (mouseX – x3)*easing3;
y3 += (mouseY – y3)*easing3;

noStroke();
fill(palette[4]);
ellipse(mouseX, mouseY, d, d);
}
