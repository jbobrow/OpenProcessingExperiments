
int counter;
int circleX = 200;
int circleY = 150;
int circleHeight = 200;
int circleWidth = 200;
int circleColour = 0;
void setup() { //setup function called initially, only once
size(1000, 1000);
background(255); //set background
counter = 0;
}
void draw(){ 
noStroke();
fill(0,0,circleColour);
ellipse(circleX,circleY,circleHeight,circleWidth);
circleX += 1;
circleY += 1;
circleHeight -= 0.1;
circleWidth -= 0.1;
circleColour += 0.1;
}

