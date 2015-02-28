
//global variables

boolean button = false;
boolean button2 = false;

int x = 250;
int y = 300;
int w = 100;
int h = 75;

int a = 50;
int b = 300;
int c = 100;
int d = 75;

void setup () {
size (400,400);
background (255);

}

void draw() {

if (button) {
rect (100,100,200,150);
fill (255);
ellipse (150,150,50,50);
ellipse (250,150,50,50);
ellipse (200,200,100,20);
stroke (0);
}

if (button2) {
ellipse (200,150,200,200);
fill (255);
ellipse (150,150,50,50);
ellipse (250,150,50,50);
ellipse (200,200,100,20);
stroke (0);
}

fill (175);
rect (x, y, w, h);

fill (175);
rect (a, b, c, d);
}

void mousePressed () {

if ((mouseX > x) && (mouseX < x+w) && (mouseY < y+h )) {

button =!button;
button2 =false;
background (255);

}
if ((mouseX > a) && (mouseX < a+c) && (mouseY < b+d )) {
 
button2 =!button2;
button =false; 
background (255);

}

}

