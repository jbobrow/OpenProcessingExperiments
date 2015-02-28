
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Lee hyejin<<------ Write your full name here!
// ID: hye-jin <<--------- Write your ID here!
 
 float x[] = new float[100];
float y[] =  new float[100];
float speedX[] = new float[100];
float speedY[] = new float[100];

void setup () {
size(600,600);
for (int i=0; i<100; i++) {
x[i] = random(180, 220);
y[i] = random(0, 20);
speedX[i] = random(-2, 2);
speedY[i] = random(-2, 2);
}
}
void draw () {
background(0);

for (int i=0; i<100; i++) {

x[i] = x[i] + speedX[i];
y[i] = y[i] + speedY[i];
speedY[i] = speedY[i] + 0.1;
if (x[i]>600) {
x[i] = 600;
speedX[i] = speedX[i] * -0.8;
}
if (x[i]<0) {
x[i] = 0;
speedX[i] = speedX[i] * -0.8;
}
if (y[i]>600) {
y[i] = 600;
speedY[i] = speedY[i] * -0.8;
}

ellipse(x[i],y[i],10,10);
fill(254,255,46);
}
}
