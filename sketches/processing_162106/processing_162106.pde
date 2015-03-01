
int circleX = 200;
int circleY = 150;
int circleHeight = 200;
int circleWidth = 200;

int circleXX = 200;
int circleYY = 150;
int circleHeightH = 200;
int circleWidthW = 200;

void setup() { //setup function called initially, only once
size(696, 696);
background(255); //set background
counter = 0;
}

void draw(){ 
noStroke();
fill(32,24,253);
ellipse(circleX,circleY,circleHeight,circleWidth);
circleX += 1;
circleY += 1;
circleHeight -= 0.4;
circleWidth -= 0.4;

noStroke();
fill(50);
ellipse(circleX,circleY,circleHeight,circleWidth);
circleXX -= 1;
circleYY += 1;
circleHeightH -= 0.4;
circleWidthW -= 0.4;

}
