
Eye e1, e2, e3;

void setup() {
size(1024, 1024);
e1 = new Eye( 250, 16, 120);
e2 = new Eye( 164, 185, 80); 
e3 = new Eye( 420, 230, 220);
}

void draw() {
background(random(0, 70), random(0, 70), random(0, 70));
e1.update(mouseX, mouseY);
e2.update(mouseX, mouseY);
e3.update(mouseX, mouseY);

e1.display();
e2.display();
e3.display();
}

class Eye {
int x, y;
int size;
float angle = 0.0;

Eye(int tx, int ty, int ts) {
x = tx;
y = ty;
size = ts;
}

void update(int mx, int my) {
angle = atan2(my-y, mx-x);
}

void display() {
pushMatrix();
translate(random(x), random(y));
rect(mouseY, mouseX, random(size), random(size));
rotate(random(angle));
smooth();
fill(random(0, 40), 0, random(0, 40));
rect(size/4, mouseY/2.5, mouseX/2.5, mouseY/2);
noStroke();
rect(mouseX, x, y, random(mouseY));
popMatrix();
}
}


