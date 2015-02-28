
void setup() {
size(300,300);
smooth();
background(0);
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);
for (int y = 0; y <= height; y += 3) {
ynoise += 0.01;
xnoise = xstart;
for (int x = 0; x <= width; x += 3) {
xnoise += 0.01;

int alph = int(noise(xnoise, ynoise) * 255);
int alph1 = int(noise(xnoise, ynoise) * 255*xnoise);
int alph2 = int(noise(xnoise, ynoise) * 255*ynoise);
int alph3 = int(noise(xnoise, ynoise) * 100*xnoise);

stroke(alph1,alph2,alph3,alph);
line(x,y, 150,150);
}
}
}

