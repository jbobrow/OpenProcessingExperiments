
float circleBreite = 10;
float circleHoehe = 10;

int xPos = 250;
int yPos = 250;


void setup () {
 size (500,500);
 smooth ();
 colorMode (RGB,500,500,500,100);
 background (0,0,100);

}

void draw() {
 background (0,0,100);
 ellipse (xPos,yPos,circleBreite,circleHoehe);
// xPos = xPos + 1;
 //yPos = yPos + 1;

}


void mousePressed() {
 circleBreite = circleBreite + 10;
 circleHoehe = circleHoehe + 30;

}

void keyPressed() {
circleBreite = 10;
circleHoehe = 10;


}

