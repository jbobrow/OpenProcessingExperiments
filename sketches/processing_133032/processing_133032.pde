
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

void setup(){
size(600, 800);
background(255);
frameRate(40);
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
//background diamond
noStroke();
fill(212, 39, 39, alpha);
beginShape();
vertex(300, 102);
vertex(136, 380);
vertex(300, 697);
vertex(474, 380);
endShape(CLOSE);
alpha = alpha-.5;

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
alpha = alpha-.4;

//top right triangle
noStroke();
fill(241, 209, 4, 230);
beginShape();
vertex(300, toprighttriangleY);
vertex(400, toprighttriangleY+160);
vertex(237, toprighttriangleY+160);
vertex(237, toprighttriangleY+108);
endShape(CLOSE);
toprighttriangleY = toprighttriangleY-2.5;

//top left triangle
noStroke();
fill(241, 209, 4, 230);
triangle(206, toplefttriangleY, 227, toplefttriangleY-35, 227, toplefttriangleY);
toplefttriangleY = toplefttriangleY-1.2;

//right top triangle
noStroke();
fill(234, 224, 153, 150);
triangle(righttoptriangleX, 170, righttoptriangleX, 380, righttoptriangleX+131, 380);
righttoptriangleX = righttoptriangleX+2;

//bottom rectangle
noStroke();
fill(234, 224, 153, 125);
beginShape();
vertex(310, bottomrectangleY);
vertex(355, bottomrectangleY);
vertex(355, bottomrectangleY+75);
vertex(310, bottomrectangleY+160);
endShape(CLOSE);
bottomrectangleY++;

//right bottom triangle
noStroke();
fill(186, 212, 225, 150);
triangle(rightbottomtriangleX, 440, rightbottomtriangleX, 639, rightbottomtriangleX+110, 440);
rightbottomtriangleX = rightbottomtriangleX+1.7;


//left bottom triangle
noStroke();
fill(241, 209, 4);
triangle(186, leftbottomtriangleY, 300, leftbottomtriangleY, 300, leftbottomtriangleY+220);
leftbottomtriangleY = leftbottomtriangleY+2.5;

//left middle triangle
noStroke();
fill(234, 224, 153, 175);
beginShape();
vertex(leftmidtriangleX, 460);
vertex(leftmidtriangleX+20, 460);
vertex(leftmidtriangleX+20, 499);
endShape(CLOSE);
leftmidtriangleX = leftmidtriangleX-2;

//left top triangle
noStroke();
fill(234, 224, 153, 175);
beginShape();
vertex(lefttoptriangleX, 380);
vertex(lefttoptriangleX+60, 280);
vertex(lefttoptriangleX+60, 445);
vertex(lefttoptriangleX+32, 445);
endShape(CLOSE);
lefttoptriangleX--;

//left rectangle
noStroke();
fill(186, 212, 225, 200);
beginShape();
vertex(leftrectangleX, 320);
vertex(leftrectangleX+189, 320);
vertex(leftrectangleX+189, 360);
vertex(leftrectangleX-24, 360);
endShape(CLOSE);
leftrectangleX = leftrectangleX-2;

//right rectangle
noStroke();
fill(241, 209, 4);
beginShape();
vertex(rightrectangleX, 390);
vertex(rightrectangleX+169, 390);
vertex(rightrectangleX+152, 420);
vertex(rightrectangleX, 420);
endShape(CLOSE);
rightrectangleX = rightrectangleX+1.2;

//black lines
//right top line
noStroke();
fill(0);
beginShape();
vertex(righttoplineX, 460);
vertex(righttoplineX+151, 460);
vertex(righttoplineX+149, 462);
vertex(righttoplineX, 462);
endShape(CLOSE);
righttoplineX = righttoplineX+2;

//right bottom line
noStroke();
fill(0);
beginShape();
vertex(rightbottomlineX, 480);
vertex(rightbottomlineX+40, 480);
vertex(rightbottomlineX+39, 482);
vertex(rightbottomlineX, 482);
endShape(CLOSE);
rightbottomlineX = rightbottomlineX+1.3;

//top right line
noStroke();
fill(0);
beginShape();
vertex(317, toprightlineY);
vertex(323, toprightlineY+9);
vertex(323, toprightlineY+282);
vertex(317, toprightlineY+282);
endShape(CLOSE);
toprightlineY = toprightlineY-1.5;

//top left line
noStroke();
fill(0);
beginShape();
vertex(310, topleftlineY);
vertex(312, topleftlineY+3);
vertex(312, topleftlineY+88);
vertex(310, topleftlineY+88);
endShape(CLOSE);
topleftlineY = topleftlineY-2;


//left top line
noStroke();
fill(0);
beginShape();
vertex(lefttoplineX, 280);
vertex(lefttoplineX+85, 280);
vertex(lefttoplineX+85, 282);
vertex(lefttoplineX-2, 282);
endShape(CLOSE);
lefttoplineX = lefttoplineX-2.5;

//left bottom line
noStroke();
fill(0);
beginShape();
vertex(leftbottomlineX-197, 300);
vertex(leftbottomlineX, 300);
vertex(leftbottomlineX, 302);
vertex(leftbottomlineX-198, 302);
endShape(CLOSE);
leftbottomlineX = leftbottomlineX-1.5;

//bottom left line
noStroke();
fill(0);
beginShape();
vertex(220, bottomleftlineY);
vertex(223, bottomleftlineY);
vertex(223, bottomleftlineY+177);
vertex(220, bottomleftlineY+170);
endShape(CLOSE);
bottomleftlineY = bottomleftlineY+2;

//bottom right line
noStroke();
fill(0);
beginShape();
vertex(235, bottomrightlineY);
vertex(245, bottomrightlineY);
vertex(245, bottomrightlineY+174);
vertex(235, bottomrightlineY+153);
endShape(CLOSE);
bottomrightlineY = bottomrightlineY+1.3;




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

//This piece was inspired by Ilya Bolotowsky. I attempted to reflect his style by using a bold diamond contour, strong vertical and horizontal lines, and triangles positioned throughout the piece. I have also incorporated varying widths of the lines and shapes and used a limited but contrasting color palette. 


