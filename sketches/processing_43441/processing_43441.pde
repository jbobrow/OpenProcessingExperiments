
/*code modified from 
Processing: A Programming Handbook for Visual Designers and Artists 
by Casey Reas and Ben Fry p.340-341
*/

int num = 999;
float[] x = new float[num];
float[] y = new float[num];
PImage img;
void setup() {
size(300,400);
img = loadImage("ax.jpg");
for (int i = 0; i < num; i++) {
x[i] = random(width);
y[i] = random(height);
}
stroke(255);
}
void draw() {
background(0);
for (int i = 0; i < num; i++) {
color c = img.get(int(x[i]), int(y[i]));
float b = brightness(c) / 255.0;
float speed = pow(b, 2) + 0.05;
x[i] += speed;
if (x[i] > width) {
x[i] = 0;
y[i] = random(height);
}
stroke(50+mouseX,50+mouseY,0);
strokeWeight(3);
point(x[i], y[i]);
}
}

