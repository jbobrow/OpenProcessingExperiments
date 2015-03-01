
void setup() {
background(255);
size(350, 300);
}

void draw() {
fill(102, 236, 255);
noStroke();
rect(50, 50, 55, 60);
fill(153, 255, 102);
noStroke();
rect(100, 90, 55, 60);
int x=20;
int y=20;
int a=20;
int b=70;
fill(102, 236, 255);
noStroke();
triangle(30+y, 75-x, 58+y, 20-x, 86+y, 75-x);
fill(153, 255, 102);
noStroke();
triangle(30+b, 75+a, 58+b, 20+a, 86+b, 75+a);
rect(50,50,15,30);
}
