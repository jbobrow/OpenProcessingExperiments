
int circleX = 200;
int circleY = 150;
int circleHeight = 200;
int circleWidth = 200;
void setup() { //setup function called initially, only once
size(1000, 1000);
background(255); //set background
counter = 0;
}

void draw(){ 
noStroke();
fill(0,0,255);
ellipse(circleX,circleY,circleHeight,circleWidth);
circleX += 1;
circleY += 1;
circleHeight -= 0.4;
circleWidth -= 0.4;
}

