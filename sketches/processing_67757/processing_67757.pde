
float xOff=0;
float yOff=0;

void setup() {
size(300,300);
//frameRate(2);
}

void draw() {
//background(0,0,255);
fill(0, 20);
rect(0,0,width,height);
float x= random(50, width);
float y = random(height);

float nX = noise(xOff) * width;
float nY = noise(yOff) * height;

xOff += 0.01;
yOff = yOff + 0.04;
fill(x);
ellipse (nX, nY, 10, 10);
fill(255,0,0);
ellipse(x,y,10,10);

}

