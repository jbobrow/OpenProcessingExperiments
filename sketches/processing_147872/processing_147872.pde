
int bgSizeX = 400;
int bgSizeY = 400;
int circleColor = 175;
int circleSizeX = bgSizeX*20/100;
int circleSizeY = bgSizeY*20/100;


void setup() {
size(bgSizeX,bgSizeY);
}

void draw() {
background(255);
fill(circleColor);
noStroke();
ellipse(bgSizeX*20/100,bgSizeX*20/100,circleSizeX,circleSizeY);
fill(circleColor);
noStroke();
ellipse(bgSizeX*20/100,bgSizeX*80/100,circleSizeX,circleSizeY);
fill(circleColor);
noStroke();
ellipse(bgSizeX*80/100,bgSizeX*20/100,circleSizeX,circleSizeY);
fill(circleColor);
noStroke();
ellipse(bgSizeX*80/100,bgSizeX*80/100,circleSizeX,circleSizeY);
}
