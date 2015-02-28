
int numBars = 100;

Bar[] bars = new Bar[numBars];
void setup() {
size(500, 500);
smooth();
noStroke();
for (int i = 0; i < bars.length; i++) {
float x =  i*5;
float rate = 0.5 + i*0.05;
bars[i] = new Bar(x, 250, 5, rate);
}
}
void draw() {
fill (random(0,150),random(0,255));
rect(0, 0, width, height);
fill (random(0,255),random(0,255),random(0,255));
for (int i = 0; i < bars.length; i++) {
bars[i].move(); 
bars[i].display(); 
}
}
class Bar {
float x, y; 
float breadth; 
float speed; 
int direction = -1; 

Bar(float xpos, float ypos, float br, float sp) {
x = xpos;
y = ypos;
breadth = br;
speed = sp;
}
void move() {
y += (speed * direction);
if ((y > (height - breadth/2)) || (y < breadth/2)) {
direction *= -1;
}
}
void display() {
rect(x, y, breadth, breadth+100);
}
}
