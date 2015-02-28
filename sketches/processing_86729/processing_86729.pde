
int []a = {0, 25, 50};
color c1= color(255, 0, 60);
color c2= color(255, 0, 100);
color c3= color(255, 0, 140);

void setup() {

size(300, 300);
stroke(100, 50);
}


void draw() {
background(0, random(250, 255), random(250, 255));
fill(c1, 100);
ellipse(a[0], 150, 100, 100);
a[0]++;

fill(c2, 100);
ellipse(a[1], 150, 100, 100);
a[1]+=2;

fill(c3, 100);
ellipse(a[2], 150, 100, 100);
a[2]+=3;
}
