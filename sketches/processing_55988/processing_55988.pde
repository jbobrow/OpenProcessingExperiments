
//Belinda Yuqi Ding
//drawing of a robot using variables version 2

//variables
int xL = 100; // x-coordinate of centre of left eye
int yL = 80; // y-coordinate of centre of left eye
int xR = 280; // x-coordinate of centre of right eye
int yR = 150; // y-coordinate of centre of right eye

int dL = 70; // diameter of left eye
int dR = 100; // diameter of right eye
int rL = dL / 2; // radius of left eye
int rR = dR / 2; // radius of right eye

int eyeW = 25; // width of eye white
int eyeHL = 200; //distance between left eye and head
int eyeHR = eyeHL - (yR - yL); //distance between right eye and head

int x = (xR - xL) / 2 + xL; // x-coordinate of head
int y = xL + eyeHL; // y-coordinate of head
int headW = 150; // half the width of the head
int headH = 40; // half the height of the head

int neckH = 40; // height of the neck
int bodyH = 50; // height of the body
int bodyW = 250; // width of the body
int wheelD = 50; // diameter of the wheel

//main settings
size (400, 500);
background (200);
smooth();
strokeWeight (3);

//eye left
fill(255);
ellipse (xL, yL, dL, dL);
fill(0);
ellipse (xL, yL, dL-eyeW, dL-eyeW);

//eye right
fill(255);
ellipse(xR, yR, dR, dR);
fill(0);
ellipse(xR, yR, dR-eyeW, dR-eyeW);

//from left eye to head
line(xL-5, yL+rL, xL+15, yL+rL+eyeHL); //line on the left
line(xL+5, yL+rL, xL+20, yL+rL+eyeHL); //line on the right

//from right eye to head
line(xR-5, yR+rR, xR-20, yR+rR+eyeHR); //line on the left
line(xR+5, yR+rR, xR-15, yR+rR+eyeHR); //line on the right

//head
fill(150);
ellipse(x, y, headW*2, headH*2);
fill(255);
ellipse(x-headW, y+10, 50, 20); //cheek left
ellipse(x+headW, y+10, 50, 20); //cheek right

//neck
triangle(x, y+headH, x+30, y+headH+neckH, x-30, y+headH+neckH);

//wheels
fill(180);

int count = 0;
int distance = bodyW / 2;
int finish = x + (bodyW / 2) - wheelD;

while (count < finish){
  ellipse(x-distance, y+headH+neckH+bodyH, wheelD, wheelD);
  distance -= wheelD;
  count += wheelD;
}

//body
fill(150);
rect(x-(bodyW/2), y+headH+neckH, bodyW, bodyH);

//ground
int groundX = 15;
int groundY = y + headH + neckH + bodyH + (wheelD / 2) + 5;

line(groundX, groundY, 281, groundY);
line(groundX+103, groundY+7, 381, groundY+7);
line(groundX+65, groundY+14, 259, groundY+14);
line(groundX+87, groundY+21, 234, groundY+21);
line(groundX+100, groundY+28, 212, groundY+28);
line(groundX+146, groundY+35, 193, groundY+35);

