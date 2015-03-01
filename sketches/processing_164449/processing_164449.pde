
float a = 0;
float b = 0;
float c = 0;
void setup() {
size(500, 500);
stroke(255,20);
}
void draw() {
background(key*.5,0,key/2);
if (keyPressed == true) {
if ((key >= 32) && (key <= 126)) {
a = map(key, 32, 126, 0, 250);
b = map(key, 32, 126, 0, 500);
c = map(key, 32, 126, 0, 10);
}
}
fill(a/2,a/1.3,a*.99,50);
beginShape(TRIANGLE_FAN);
vertex(50, 50);
//vertex(pow(2,c),c/10);
vertex(b/2, pow(2,c));
vertex(450,50);
vertex(0,0);
vertex(500,0);
vertex(b/2, pow(2,c));
//vertex(pow(2,c),c/10);
vertex(b/5,b);
vertex(pow(2,c), b/2);
vertex(450,450);
vertex(c/10,pow(2,c));
vertex(50,450);
vertex(pow(2,c), b/2);
vertex(500,0);
vertex(50, 50);
//vertex(pow(2,c),c/10);
vertex(b/2, pow(2,c));
vertex(b/2, pow(2,c));
vertex(0,500);
//vertex(c/10,pow(2,c));
vertex(50,450);
vertex(pow(2,c), b/2);
vertex(500,0);
vertex(b/2, pow(2,c));
//vertex(pow(2,c),c/10);
endShape(CLOSE);
}


