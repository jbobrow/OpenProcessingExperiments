
//shining and fading stars in the night sky
float a;
float x;
float y;

void setup() {
background(0);
size(400, 400);
frameRate(5);
noStroke();
smooth();
}

void draw() {
fill(0, 40);
rect(0, 0, width, height);

fill(255);
r = random(3, 8);
ellipseMode(CENTER);
x = random(r, width-r);
y = random(r, height-r);
dx = map(noise(3.00+a), 0, 1, 0, 3);
dy = map(noise(4.00+a), 0, 1, 0, 3);
ellipse(x + dx, y + dy, r, r);

a = a + 0.01;
}
