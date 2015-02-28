

float x = 0;
float y = 0;
float y1 = 0;
float y2 = 0 ;

float myRandom;
void setup() {
size(500, 500);

background(0);
noStroke();
smooth(); 
}

void draw() {
 background(0);
 
 //snowman
 fill(102);
rect(278, 115, 85, 20);

fill(102);
rect(290, 75, 60, 40);

fill(250);
ellipse(320, 180, 90, 90);

fill(250);
ellipse(320, 280, 90, 110);

fill(0);
ellipse(320, 300, 10, 10);

fill(0);
ellipse(320, 280, 10, 10);

fill(0);
ellipse(320, 260, 10, 10);

fill(0);
ellipse(305, 175, 10, 10);

fill(0);
ellipse(335, 175, 10, 10);

fill(250, 150, 0);
triangle(315, 190, 325, 190, 320, 216);
 
 
 //snow
 
 
 //myRandom = random(100);
  fill(255, random(200,255));
  ellipse(random(width), random(height), myRandom, myRandom);

  
 // snowballs 
 
  fill(255);
 ellipse(x, y, 10, 10); 
 ellipse(x+20, y+15, 10, 10); 
 ellipse(x+38, y, 10, 10); 
 ellipse(x, y+50, 10, 10); 
 ellipse(x+60, y+10, 10, 10); 
 ellipse(x+75, y+30, 10, 10); 
 
  ellipse(75, y1, 20, 20); 
 ellipse(90, y1+15, 10, 10); 
 ellipse(115, y1, 30, 30); 
 ellipse(123, y1+50, 10, 10); 
 ellipse(135, y1+10, 10, 10); 
 ellipse(225, y1+30, 10, 10); 
 
ellipse(175, y2, 20, 20); 
 ellipse(200, y2+15, 10, 10); 
 ellipse(233, y2, 30, 30); 
 ellipse(240, y1+75, 10, 10); 
 ellipse(244, y1+16, 10, 10); 
 ellipse(261, y2+22, 10, 10); 

ellipse(255, y, 5, 5); 
 ellipse(270, y+15, 25, 25); 
 ellipse(279, y, 10, 10); 
 ellipse(283, y1+75, 10, 10); 
 ellipse(290, y1+16, 10, 10); 
 ellipse(300, y2+22, 10, 10); 
 
ellipse(310, y, 5, 5); 
 ellipse(350, y+15, 25, 25); 
 ellipse(370, y, 10, 10); 
 ellipse(323, y1+75, 10, 10); 
 ellipse(341, y1+16, 10, 10); 
 ellipse(366, y2+22, 10, 10); 

 ellipse(420, y, 5, 5); 
 ellipse(400, y2+15, 25, 25); 
 ellipse(375, y, 10, 10); 
 ellipse(387, y+75, 10, 10); 
 ellipse(371, y+16, 10, 10); 
 ellipse(395, y1+22, 10, 10); 
 
 y = y+1.3;
 y1 = y1 + 2 ;
 y2 = y2 + .8;
if (y > height) {
  y = 0;
}

if (y1 > height) {
  y1 = 0;
}




}


