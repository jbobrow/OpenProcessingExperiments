
int s;
int m;
int h;
 
void setup()
{
size(520, 800);
}
void draw()
{
background(0);

noStroke();


//body
fill(50, 0, 35);
ellipse(250, 350, 220, 150);
rect(140, 350, 225, 500);
//arms
fill(150, 0, 100);
ellipse(140, 465, 40, 230);
ellipse(365, 465, 40, 230);
//fingers 
int rows = 1;
int cols = 4;
int circleDiameter = 10;
int distanceX = 15;
int distanceY = 350;

 s = second();
  m = minute();
  h = hour();
 
for (int r = 1; r <= rows; r++) {
  for (int c = 1; c <= cols; c++) {

float sWidth = map(s, 0, 60, 0, 20);
float mWidth = map(m, 0, 60, 0, 1);

 fill(250, 200, 150);
    ellipse(c*distanceX+100, r*distanceY, circleDiameter-2, 50);
    ellipse(c*distanceX+116, r*distanceY-7, circleDiameter, 70);
    ellipse(c*distanceX+132, r*distanceY-14, circleDiameter, 70);
    fill(50, 0, 35);
rect(170, 300, 40, 100);
fill(250, 200, 150);
    ellipse(c*distanceX+115, r*distanceY+22, circleDiameter, 70);
    

fill(250, 200, 150);
    ellipse(c*distanceX+332, r*distanceY, circleDiameter-2, 50);
    ellipse(c*distanceX+316, r*distanceY-7, circleDiameter, 70);
    ellipse(c*distanceX+300, r*distanceY-14, circleDiameter, 70);
    fill(50, 0, 35);
rect(300, 300, 40, 100);
fill(250, 200, 150);
    ellipse(c*distanceX+115, r*distanceY+22, circleDiameter, 70);
    
  }
}
//palm
fill(250, 200, 150);
rect(113, 363, 50, 50);
ellipse(158, 402, 35, 40);
ellipse(141, 413, 55, 29);

//rightpalm
rect(344, 363, 50, 50);
ellipse(348, 402, 35, 40);
ellipse(366, 413, 55, 29);
ellipse(333, 372, 10, 70);

//pan'slabryntheyes
fill(200, 50, 50, h); 
ellipse(140, 385, 40, 15);
ellipse(366, 385, 40, 15);
fill(255, 240, 240, h);
ellipse(140, 385, 30, 15);
ellipse(366, 385, 30, 15);
fill(0, 100, 0, h);
ellipse(140, 385, 10, 10);
ellipse(366, 385, 10, 10);
//crown
fill(160, 150, 0);
ellipse(250, 240, 70, 90);

//head
fill(100, 130, 120);
ellipse(250, 325, 90, 220);
fill(230, 250, 255, 170);
ellipse(237, 330, 60, 200);
fill(210, 230, 245, 170);
ellipse(263, 330, 60, 200);
//eye-nostrils
//right
fill(200, 0, 0);
triangle(232, 328, 232, 318, 245, 323);
fill(255);
triangle(232, 326, 232, 320, 245, 323);
fill(0);
ellipse(235, 323, 2, 2);
//left
fill(200, 0, 0);
triangle(267, 328, 267, 318, 255, 323);
fill(255);
triangle(267, 326, 267, 320, 255, 323);
fill(0);
ellipse(264, 323, 2, 2);
//eyes
fill(50, 50, 50, 200);
ellipse(225, 300, 30, 15);
ellipse(275, 300, 30, 15);
fill(255, 255, 255, m);
ellipse(225, 300, 30, 15);
ellipse(275, 300, 30, 15);
fill(250, 0, 0, m);
ellipse(225, 300, 10, 10);
ellipse(275, 300, 10, 10);
//mouth
fill(230, 255, 200);
ellipse(249, 361, 40, 15);
fill(0);
ellipse(249, 360, 40, 10);
fill(255, 100, 200);
ellipse(248, 363, 20, sWidth);
fill(150, 0, 0);
triangle(224, 360, 246, 352, 248, 356);
triangle(248, 356, 250, 352, 274, 360);
fill(230, 255, 200);
triangle(224, 360, 248, 356, 274, 360);




}
