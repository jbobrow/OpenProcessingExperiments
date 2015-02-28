
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/133653*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
boolean disperse = false;
boolean stopped = false;

int toprighttriangleY;
int toplefttriangleY;
int righttoptriangleX;
int leftbottomtriangleY;
int bottomrectangleY;
int rightbottomtriangleX;
int leftrectangleX;
int leftmidtriangleX;
int lefttoptriangleX;
int rightrectangleX;
int rightbottomlineX;
int toprightlineY;
int bottomleftlineY;
int leftbottomlineX;
int righttoplineX;
int topleftlineY;
int lefttoplineX;
int bottomrightlineY;
int alpha;

int hueChangeLight=241;
int lightBright=4;
int hueChangeDark=186;
int darkBright=225;



void setup(){
size(600, 800);
background(255);
frameRate(27);
toprighttriangleY = 100;
toplefttriangleY = 260;
righttoptriangleX = 344;
leftbottomtriangleY = 480;
bottomrectangleY = 520;
rightbottomtriangleX = 332;
leftrectangleX = 171;
leftmidtriangleX = 175;
lefttoptriangleX = 135;
rightrectangleX = 300;
rightbottomlineX = 380;
toprightlineY = 128;
bottomleftlineY = 375;
leftbottomlineX = 380;
righttoplineX = 280;
topleftlineY = 117;
lefttoplineX = 195;
bottomrightlineY = 420;
alpha = 255;
}

void draw(){
background(255);



int y = 0;
while( y < height) {
  stroke(248);
  line(0, y, width, y);
  y = y + 6;
}

int x = 0;
while(x < width) {
  stroke (248);
  line (x, 0, x, height);
  x = x + 6;
}




//background diamond
noStroke();
//fill(212, 39, 39, alpha);
fill(255, alpha);
beginShape();
vertex(300, 102);
vertex(136, 380);
vertex(300, 697);
vertex(474, 380);
endShape(CLOSE);
/*
//background shape
fill(242, 243, 240, alpha);
noStroke();
beginShape();
strokeWeight(2);
vertex(195, 280);
vertex(206, 260);
vertex(227, 260);
vertex(227, 225);
vertex(237, 208);
vertex(237, 260);
vertex(344, 260);
vertex(344, 380);
vertex(475, 380); 
vertex(442, 440);
vertex(469, 390);
vertex(300, 390);
vertex(300, 420);
vertex(452, 420);
vertex(442, 440);
vertex(332, 440);
vertex(332, 640);
vertex(332, 520);
vertex(310, 520);
vertex(310, 680);
vertex(300, 698);
vertex(300, 480);
vertex(195, 480);
vertex(195, 460);
vertex(175, 460);
vertex(167, 445);
vertex(195, 445);
endShape(CLOSE);
*/

//top right triangle
noStroke();
//fill(241, 209, 4, 230);
fill (hueChangeLight,200,lightBright, 230);
beginShape();
vertex(300, toprighttriangleY);
vertex(400, toprighttriangleY+160);
vertex(237, toprighttriangleY+160);
vertex(237, toprighttriangleY+108);
endShape(CLOSE);

//top left triangle
noStroke();
//fill(241, 209, 4, 230);
fill (hueChangeLight,200,lightBright, 230);
triangle(206, toplefttriangleY, 227, toplefttriangleY-35, 227, toplefttriangleY);

//right top triangle
noStroke();
//fill(234, 224, 153, 150);
fill (hueChangeLight,200,lightBright, 120);
triangle(righttoptriangleX, 170, righttoptriangleX, 380, righttoptriangleX+131, 380);

//bottom rectangle
noStroke();
//fill(234, 224, 153, 125);
fill (hueChangeLight,200,lightBright, 125);
beginShape();
vertex(310, bottomrectangleY);
vertex(355, bottomrectangleY);
vertex(355, bottomrectangleY+75);
vertex(310, bottomrectangleY+160);
endShape(CLOSE);

//right bottom triangle
noStroke();
//fill(186, 212, 225, 150);
fill(hueChangeDark, 212, darkBright, 150);
triangle(rightbottomtriangleX, 440, rightbottomtriangleX, 639, rightbottomtriangleX+110, 440);


//left bottom triangle
noStroke();
//fill(241, 209, 4);
fill (hueChangeLight,200,lightBright, 230);
triangle(186, leftbottomtriangleY, 300, leftbottomtriangleY, 300, leftbottomtriangleY+220);

//left middle triangle
noStroke();
//fill(234, 224, 153, 175);
fill (hueChangeLight,200,lightBright, 125);
beginShape();
vertex(leftmidtriangleX, 460);
vertex(leftmidtriangleX+20, 460);
vertex(leftmidtriangleX+20, 499);
endShape(CLOSE);

//left top triangle
noStroke();
//fill(234, 224, 153, 175);
fill (hueChangeLight,200,lightBright, 125);
beginShape();
vertex(lefttoptriangleX, 380);
vertex(lefttoptriangleX+60, 280);
vertex(lefttoptriangleX+60, 445);
vertex(lefttoptriangleX+32, 445);
endShape(CLOSE);

//left rectangle
noStroke();
//fill(186, 212, 225, 200);
fill(hueChangeDark, 212, darkBright, 150);
beginShape();
vertex(leftrectangleX, 320);
vertex(leftrectangleX+189, 320);
vertex(leftrectangleX+189, 360);
vertex(leftrectangleX-24, 360);
endShape(CLOSE);

//right rectangle
noStroke();
//fill(241, 209, 4);
fill (hueChangeLight,200,lightBright, 230);
beginShape();
vertex(rightrectangleX, 390);
vertex(rightrectangleX+169, 390);
vertex(rightrectangleX+152, 420);
vertex(rightrectangleX, 420);
endShape(CLOSE);

//black lines
//right top line
noStroke();
fill(50);
beginShape();
vertex(righttoplineX, 460);
vertex(righttoplineX+151, 460);
vertex(righttoplineX+149, 462);
vertex(righttoplineX, 462);
endShape(CLOSE);

//right bottom line
noStroke();
fill(50);
beginShape();
vertex(rightbottomlineX, 480);
vertex(rightbottomlineX+40, 480);
vertex(rightbottomlineX+39, 482);
vertex(rightbottomlineX, 482);
endShape(CLOSE);

//top right line
noStroke();
fill(50);
beginShape();
vertex(317, toprightlineY);
vertex(323, toprightlineY+9);
vertex(323, toprightlineY+282);
vertex(317, toprightlineY+282);
endShape(CLOSE);

//top left line
noStroke();
fill(50);
beginShape();
vertex(310, topleftlineY);
vertex(312, topleftlineY+3);
vertex(312, topleftlineY+88);
vertex(310, topleftlineY+88);
endShape(CLOSE);

//left top line
noStroke();
fill(50);
beginShape();
vertex(lefttoplineX, 280);
vertex(lefttoplineX+85, 280);
vertex(lefttoplineX+85, 282);
vertex(lefttoplineX-2, 282);
endShape(CLOSE);

//left bottom line
noStroke();
fill(50);
beginShape();
vertex(leftbottomlineX-197, 300);
vertex(leftbottomlineX, 300);
vertex(leftbottomlineX, 302);
vertex(leftbottomlineX-198, 302);
endShape(CLOSE);

//bottom left line
noStroke();
fill(50);
beginShape();
vertex(220, bottomleftlineY);
vertex(223, bottomleftlineY);
vertex(223, bottomleftlineY+177);
vertex(220, bottomleftlineY+170);
endShape(CLOSE);

//bottom right line
noStroke();
fill(50);
beginShape();
vertex(235, bottomrightlineY);
vertex(245, bottomrightlineY);
vertex(245, bottomrightlineY+174);
vertex(235, bottomrightlineY+153);
endShape(CLOSE);


if (disperse && bottomrectangleY < 800) {
  alpha = alpha-1;
  toprighttriangleY = toprighttriangleY-4;
  toplefttriangleY = toplefttriangleY-1;
  righttoptriangleX = righttoptriangleX+3.5;
  bottomrectangleY++;
  rightbottomtriangleX = rightbottomtriangleX+2.5;
  leftbottomtriangleY = leftbottomtriangleY+4;
  leftmidtriangleX = leftmidtriangleX-2;
  lefttoptriangleX--;
  leftrectangleX = leftrectangleX-4;
  rightrectangleX = rightrectangleX+1.5;
  righttoplineX = righttoplineX+3;
  rightbottomlineX = rightbottomlineX+1;
  toprightlineY = toprightlineY-2.5;
  topleftlineY = topleftlineY-2;
  lefttoplineX = lefttoplineX-3;
  leftbottomlineX = leftbottomlineX-1.5;
  bottomleftlineY = bottomleftlineY+2;
  bottomrightlineY = bottomrightlineY+3; 
}


 else { 
  alpha = alpha+1;
  toprighttriangleY = toprighttriangleY+4;
  toplefttriangleY = toplefttriangleY+1;
  righttoptriangleX = righttoptriangleX-3.5;
  bottomrectangleY--;
  rightbottomtriangleX = rightbottomtriangleX-2.5;
  leftbottomtriangleY = leftbottomtriangleY-4;
  leftmidtriangleX = leftmidtriangleX+2;
  lefttoptriangleX++;
  leftrectangleX = leftrectangleX+4;
  rightrectangleX = rightrectangleX-1.5;
  righttoplineX = righttoplineX-3;
  rightbottomlineX = rightbottomlineX-1;
  toprightlineY = toprightlineY+2.5;
  topleftlineY = topleftlineY+2;
  lefttoplineX = lefttoplineX+3;
  leftbottomlineX = leftbottomlineX+1.5;
  bottomleftlineY = bottomleftlineY-2;
  bottomrightlineY = bottomrightlineY-3; 
}


if (mouseX > 250 && mouseX < 350 && mouseY > 300 && mouseY < 500)  {
 disperse = true;

}

else {
   disperse = false;
   
}

if (stopped && toprighttriangleY > 100) {
toprighttriangleY = 100;
toplefttriangleY = 260;
righttoptriangleX = 344;
leftbottomtriangleY = 480;
bottomrectangleY = 520;
rightbottomtriangleX = 332;
leftrectangleX = 171;
leftmidtriangleX = 175;
lefttoptriangleX = 135;
rightrectangleX = 300;
rightbottomlineX = 380;
toprightlineY = 128;
bottomleftlineY = 375;
leftbottomlineX = 380;
righttoplineX = 280;
topleftlineY = 117;
lefttoplineX = 195;
bottomrightlineY = 420;
alpha = 255;
}

if (toprighttriangleY > 100) {
  stopped = true;
}




/*
//points
noSmooth();
stroke(0);
strokeWeight(6);
point(300, 103);
point(320, 135);
point(345, 175);
point(208, 259);
point(400, 259);
point(197, 280);
point(280, 280);
point(183, 300);
point(380, 300);
point(137, 380);
point(220, 380);
point(345, 380);
point(472, 380);
point(240, 420);
point(320, 400);
point(334, 442);
point(440, 442);
point(280, 460);
point(430, 460);
point(186, 482);
point(195, 498); 
point(300, 482);
point(300, 698);
point(333, 638);
point(380, 480);
point(420, 480);
point(220, 545);
point(240, 584);
*/
}

void mouseClicked() {
 hueChangeLight= floor(random(250)); 
 hueChangeDark= floor(random(250));
}


