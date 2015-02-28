
//1023 inclass practice
//TePang Chiang

void setup() {
size(500, 100);
loop();
}
void draw() {
background(255);
stroke(0, 30);
strokeWeight(1.5);
line(20, 10, 480, 10);
line(20, 20, 480, 20);
line(20, 30, 480, 30);
line(20, 40, 480, 40);
line(20, 50, 480, 50);
line(20, 60, 480, 60);
line(20, 70, 480, 70);
line(20, 80, 480, 80);
line(20, 90, 480, 90);
pushMatrix();
translate(250,50);
int s = second();
rotate(PI/60*s);
strokeWeight(2.5);
int step = 10;
float nlevel = 0.5;
float lastx = -999;
float lasty = -999;
float ynoise = random(10);
float y;
int border = -250;
for (int x=border; x<=width-border;
x+=step) {
y = -50 + noise(ynoise)*80*(s%3.5);
if (lastx > -999) {
line(x, y, lastx, lasty);
}
lastx = x;
lasty = y;
ynoise += nlevel;
stroke(abs(x/3+(lastx*2)/3), abs(y+(lasty*2)), abs(x/5+y+lastx+lasty)*2/3);
}
popMatrix();
}

void keyPressed() {
  saveFrame("screen-####.jpg");
}



