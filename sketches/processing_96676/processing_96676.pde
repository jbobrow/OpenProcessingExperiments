
SquareGrow square1;
SquareGrow square2;
SquareGrow square3;

void setup() {
size(600, 200);
smooth();

square1 = new SquareGrow("Square A", - 4);
square2 = new SquareGrow("Square B", - 2);
square3 = new SquareGrow("Square C", - 1);
}

void draw() {
background(55);

square1.update();
square1.dispaly();

square2.update();
square2.display();

square3.update();
square3.display();

}

class PieGrow {

float x;
float y;
float speed;
String title:

Square Grow(String titleTemp) {
x = random(200, 500);
y = random(300, 300);
String title;
}

if((dist(x, y, mouseX, mouseY) < x/2) && mousePressed) {
x = x - (mouseX - pmouseX);
y = y - (mouseY - pmouseY);
}
}

void display() {
noStroke();
fill(r, g, b);
text(title, x+1, y+10);
}
}
