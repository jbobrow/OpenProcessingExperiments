
int x= 200;

void setup() {
size(200, 200);
noStroke();
}

void draw() {
//background(255);
rectMode (CENTER);
rect(width/2, height/2, x, x);
fill(x, 0, x/2, x);
}

void keyPressed() {
x-=20;
}
