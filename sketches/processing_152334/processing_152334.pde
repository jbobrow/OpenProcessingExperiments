
int num;
float[] x;
float[] y;
float[] dx;
float[] dy;
float rad;

void setup() {
size(600, 600);
background(0);

// choose number of spinning tops
num = 5;

// allocate size of arrays
x = new float[num];
y = new float[num];
dx = new float[num];
dy = new float[num];

// setup initial positions for each item in the arrays
for (int i=0; i<num; i++) {
x[i] = width/(i+1);
y[i] = height * i/(random(num));
}

for (int j=0; j<num; j++) {
dx[j] = random(-1,1);
dy[j] = random(-1,1);
}
}

void draw() {
//blendMode(BLEND);
//fill(0, 5);
//rect(0, 0, width, height);
rad = radians(frameCount);

// calculate new position
for (int i=0; i<num; i++) {
x[i] += dx[i];
y[i] += dy[i];
}

float max = 1;
float min = 0.5;

/* When the shape hits the edge of the window,
* it reverses its direction and changes velocity
*/

for (int j=0; j<num; j++) {
if (x[j] > width-100 || x[j] < 100) {
dx[j] = dx[j] > 0 ? -random(min, max) : random(min, max);
}
if (y[j] > height-100 || y[j] < 100) {
dy[j] = dy[j] > 0 ? -random(min, max) : random(min, max);
}

float bx = 0;
float by = 0;

if (j<num-1) {
bx = x[j] + 100 * sin(rad);
by = y[j] + 100 * cos(rad);
}

fill(180);

float radius = 100 * sin(rad*0.1);
float handX = bx + radius * sin(rad*3);
float handY = by + radius * cos(rad*3);

stroke(255,0,0, 50);
line(bx, by, handX, handY);
ellipse(handX, handY, 2, 2);

if (mousePressed == true) {
stroke(random(255),random(255),0, 50);
line(bx, by, handX, handY);
ellipse(handX, handY, 2, 2);
}
}

if (keyPressed == true && key == 's') {
saveFrame("Spinning Tops.jpg");
}
}
