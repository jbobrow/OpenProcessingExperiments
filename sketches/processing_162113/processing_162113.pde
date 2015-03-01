
int counter;
int circleX = 100;
int circleY = 100;
int circleHeight = 100;
int circleWidth = 100;

void setup() {  //setup function called initially, only 
size(500, 500);
background(255);  //set background white
counter = 0
}

void draw() {  //draw function loops 
stroke(255)
fill(random(255))
ellipse(circleX, circleY, circleHeight, circleWidth);
circleX += 1;  //speed of travel
circleY += 1;
circleHeight -= 0.1;
circleWidth -= 0.1;
}
