
/* Douglas Tran Feb 9 Creative Computing Rory Solomon */
/* @pjs preload= "bg1.jpg"; */

void setup() {
  size(500, 500);
  frameRate(21);
}

void draw() {
int xPosition;
int yPosition;
int rect1;
int rect2;
int rect3;
int rect1x;
int rect2x;
int rect3x;
int rect4;
int rect4x;


xPosition = round( random(0, 400) );
yPosition = round( random(0, 250) );
rect1 = round( random(150) );
rect2 = round( random(100) );
rect3 = round( random(200) );
rect4 = round( random(200) );
rect1x = round( random(200) );
rect2x = round( random(100) );
rect3x = round( random(200) );
rect4x = round( random(150) );


fill(0, 255, 255, 100);
rect(xPosition, yPosition, rect1x, rect1);

fill(255, 255, 0, 100);
rect(xPosition, rect1+yPosition, rect2x, rect2);

fill(255, 0, 0, 100);
rect(xPosition, rect1+rect2+yPosition, rect3x, rect3);

fill(255, 255, 255, 100);
rect(xPosition, rect1+rect2+rect3+yPosition, rect4x, rect4);
}






