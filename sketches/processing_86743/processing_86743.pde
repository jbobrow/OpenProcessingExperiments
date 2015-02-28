
int [] a = {0, 25, 50};
int [] b = new int[a.length];
arrayCopy(a, b);

a = append(a, 75);

color c1= color(255, 0, 60);
color c2= color(255, 0, 100);
color c3= color(255, 0, 140);

void setup() {

size(400, 400);
stroke(100, 50);
}

void draw() {
background(0, random(250, 255), random(250, 255));
fill(c1, 100);
ellipse(b[0], 150, 100, 100);
b[0]++;

fill(c2, 100);
ellipse(b[1], 150, 100, 100);
b[1]+=2;

fill(c3, 100);
ellipse(b[2], 150, 100, 100);
b[2]+=3;

fill(c3, 100);
ellipse(a[3], 150, 100, 100);
a[3]+=4;
}
