
void setup(){
size (400, 400);
background (70);
colorMode(HSB);
smooth();
noStroke();
}

void draw(){
float j = random (400);
float y = random (400);
float r = random(100);
float n = random (100, 200);
float o = random (200, 300);
float p = random (300, 400);

TopRow(r, y);
SecondRow(n, j);
ThirdRow(o, y);
FourthRow(p, j);
Purple(y, j);
}

void TopRow(float x, float y){
float m = random (50, 200);
fill(30, m, 255);
ellipse(x, y, 25, 25);
}

void SecondRow(float x, float y){
float m = random (50, 200);
fill(20, m, 255);
ellipse(x, y, 25, 25);
}

void ThirdRow(float x, float y){
float m = random (50, 200);
fill(10, m, 255);
ellipse(x, y, 25, 25);
}

void FourthRow(float x, float y){
  float m = random (50, 200);
fill(0, m, 255);
ellipse(x, y, 25, 25);
}

void Purple(float x, float y){
float g = random (170, 250);
float a = random (100, 200);
float k = random (1, 30);
fill(g, 200, 230, a);
ellipse(x, y, k, k);
}

