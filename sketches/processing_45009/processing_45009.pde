
float speed= 2.5;
int diameter= 60;
float x;
float y;
PImage tatoo;

void setup() {
size(400,250);
smooth();
fill(136, 227, 101);

x= width/2;
y= height/2;
}

void draw() {
tatoo = loadImage ("tatoo-celtas-06.jpg");
image (tatoo, 0, 0);
x+= random (-speed, speed);
y+= random (-speed, speed);
translate(mouseX, mouseY);
ellipse(x, y, diameter, diameter);

} 

