
//compare with two lines.
//by Xinhan Yen,Email:archi730@hotmail.com
void setup() {
size(500, 200);

}
void draw() {
background(255);
strokeWeight(5);
stroke(0, 30);
line(20, 100, 480, 100);
line(20, 150, 480, 150);
line(20, 50, 480, 50);


stroke(20*random(20), 50*random(20), 70*random(20));
float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 150;
float y = 150;
int border = 20;
for (int x=border; x<=width-border;
x+=xstep) {
ystep = random(20)-10;
y += ystep/5;
line(x, y, lastx, lasty);
lastx = x;
lasty = y;
}


stroke(20*noise(ynoise), 50*noise(ynoise), 70*noise(ynoise));
int step = 10;
float nlevel = 0.1;
float lastx = -999;
float lasty = -999;
float ynoise = random(10);
float y;
int border = 20;
for (int x=border; x<=width-border;
x+=step) {
y = 10 + noise(ynoise)*80;
if (lastx > -999) {
line(x, y, lastx, lasty);
}
lastx = x;
lasty = y;
ynoise += nlevel;
}
}



