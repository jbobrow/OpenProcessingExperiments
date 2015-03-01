
//variables work sheet

//initializing variables
int circleW = 50;
int circleH = 50;
int greencircleW = 75;
int greencircleH = 75;
int centerX = 300;
int centerY = 100;

void setup() {
size(601,201);
}

void draw() {
//initial setup of the canvas
fill(255);
rect(0,0,200,200);
rect(200,0,200,200);
rect(400,0,200,200);

//red circles
ellipseMode(CENTER);
fill(255,0,0);
ellipse(50,50,circleW,circleH);
ellipse(150,150,circleW,circleH);
ellipse(50,150,circleW,circleH);
ellipse(150,50,circleW,circleH);

//mercedes lines
stroke(0)
line(centerX,centerY,300,0);
line(centerX,centerY,200,200);
line(centerX,centerY,400,200);

//square dot
fill(0,0,255);
rect(410,10,180,180);
fill(0,255,0);
ellipse(500,100,greencircleW,greencircleH);

//variable change
circleW = circleW + 2;
circleH = circleH + 2;
greencircleW = greencircleW +1;
greencircleH = greencircleH +1;
centerX = centerX -1;
centerY = centerY -1;
}
