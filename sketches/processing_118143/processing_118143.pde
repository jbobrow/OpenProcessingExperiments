
//Song of life
//Li Yi-Xiu
//Just like the image of electrocardiogram. So I call it's the song of life.

void setup() {
size(500, 150);
//noLoop();
}
void draw() {
background(0,0,0);
strokeWeight(2);
stroke(250,250,250);
line(20, 75, 480, 75);
line(20, 50, 480, 50);
line(20, 25, 480, 25);
line(20, 100, 480, 100);
line(20, 125, 480, 125);
stroke(random(250),random(250),250);
frameRate(2);

int step = 1;
float nlevel = 0.1;
float lastx = -999;
float lasty = -999;
float ynoise = random(300);
float ynoise2 = random(130);
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

