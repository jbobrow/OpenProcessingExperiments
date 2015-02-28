
void setup() {
  size(500,500);
}

void draw () {



background(255, 120, 0);

smooth();


//background
fill(252, 252, 38);
ellipse(450, 250, 175, 175);
fill(194, 250, 247);
quad(-1, 250, 501, 250, 501, 501, -1, 501);

//used to express position of body
int x = mouseX;
int y = mouseY;

//used to express position of head
int a = pmouseX;
int b = pmouseY-165;

strokeWeight(2);

//feet
fill(255, 188, 0);
triangle(x+10, y+105, x+70, y+130, x+20, y+130);
triangle(x-10, y+105, x-70, y+130, x-20, y+130);

//body
fill(75);
ellipse(x, y, 150, 250);
fill(255);
ellipse(x, y, 100, 166);

//wings
fill(75);
if(mousePressed==false) {
ellipse(x-55, y+10, 45, 200);
ellipse(x+55, y+10, 45, 200);
} else {
ellipse(x-145, y-90, 200, 45);
ellipse(x+145, y-90, 200, 45);
}

//head
fill(75);
ellipse(a, b, 100, 100);

//eyes
fill(255);
ellipse(a-20, b-10, 25, 20);
ellipse(a+20, b-10, 25, 20);
fill(0);
ellipse(a-20, b-10, 10, 10);
ellipse(a+20, b-10, 10, 10);

//beak
fill(255, 188, 0);
quad(a, b, a-20, b+18, a, b+35, a+20, b+18);

if(mousePressed==false) {
quad(a, b, a-20, b+18, a, b+25, a+20, b+18);
} else {
fill(255, 99, 99);
quad(a, b+15, a-20, b+18, a, b+25, a+20, b+18);
}

}

