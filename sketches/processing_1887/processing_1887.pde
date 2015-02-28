
int y = 0;
int speed = 3;
void setup() {
size(400,400);
smooth();
}
void draw() {
background(12,43,237);
y = y + speed;
if ((y > height) || (y < 0)) {
speed = speed * -1;
}

stroke(255);
fill(214,11,157);
ellipse(200,y,92,92);
}

