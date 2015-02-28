
float fro = -0.001;//air 
float grav = 0.1;//gravity
float c = - 0.95;//crash
int sx = 700;//size
int sy = 400;
float rad = 10;//radius
int deltacolo = 1;//colour change
int colo = 0;//initial colour
color bg = color(0);//background colour
int n = 50; //how many locus 
Ball b = new Ball(0, 500, 10, 10, 0, 0, colo);
Ball[] trace = new Ball [n];

void setup() {
 
smooth();
size(700,400);
for (int i = 0; i < n; i ++){
trace[i] = b;
}

colorMode(HSB);

noStroke();
}

class Ball {
float x, y, vx, vy, ax, ay;
int colo;
Ball(float xx, float yy, float vvx, float vvy, float aax, float aay, int c) {//定义球
x = xx;//location
y = yy;
vx = vvx;//speed 
vy = vvy;
ax = aax;//acceierated speed
ay = aay;
colo = c;//colour
}

void upd() {
colo += deltacolo;//change
if (x < rad) {//wall
vx *= c;
x = rad;
}
if (x > sx - rad) {
vx *= c;
x = sx - rad;
}
if (y < rad) {
vy *= c;
y = rad;
}
if (y > sy - rad) {
vy *= c;
y = sy - rad;
}
ax = fro * vx;//
ay = fro * vy;
vx += ax;//
vy += ay + grav;
x += vx;//
y += vy;
}

void drawb(float rad) {//draw bal
fill(color(colo%360, 255, 255));
ellipse(x, y, 2 * rad, 2 * rad);
}
}

void draw() {
background(bg);
b.upd();
b.drawb(rad);
for (int i = n - 1; i > 0; i -= 1){
trace[i] = trace [i - 1];
trace[i].drawb(rad * (n - i) / n);
}
trace[0] = b;
if (mousePressed == true) {
b = new Ball ( mouseX, mouseY, 0, 0, 0, 0, b.colo);
}
}
void mouseReleased() {
b = new Ball ( mouseX, mouseY, mouseX - pmouseX, mouseY - pmouseY, 0, 0, b.colo);
}                                               
