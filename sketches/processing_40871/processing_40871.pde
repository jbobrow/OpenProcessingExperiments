
int fly = -500;
int off = 100;
int fly2=-1000;

void setup() {
size(400, 400);
background(75,75,255);
  frameRate(30);
noStroke();
fill(102);

}

void draw() {

  fly= fly+3;
  off= off + 1 ;
  fly2=fly2+2;
  

stroke(0);
strokeWeight(3);
fill(100,188,89);
ellipse(25,off+300,200,350);
ellipse(200,off+300,200,350);
ellipse(400,off+300,200,350);
ellipse(100,off+350,200,350);
ellipse(330,off+330,200,350);


stroke(255);
strokeWeight(0);
fill(255);
ellipse(100,off,125,65);
ellipse(80,(off-25),50,50);
ellipse(115,(off-25),75,75);

stroke(255);
strokeWeight(0);
fill(255);
ellipse(300, off,125,65);
ellipse(300,(off-25),50,50);
ellipse(315,(off-25),75,75);

stroke(0);
strokeWeight(20);
line(25, -150, 25, fly);
line(150, -180, 150, fly);
line(350, -155, 350, fly);
line(75, -150, 75, fly);
line(200, -180, 200, fly);
line(260, -155, 260, fly);

line(50,-250,50,fly-1);
line(175,-265,175,fly-1);
line(315,-246,315,fly-1);

fill(0);
rect(0,-500,600,fly);

stroke(255,255,0);
strokeWeight(10);
line(50,-250,50,fly2);
line(200,-265,200,fly2);
line(315,-246,315,fly2);

stroke(255,255,0);
strokeWeight(40);
fill(255,0,0);
line(200,300,200,off+200);
strokeWeight(10);
stroke(255,0,0);
line(200,300,200,off+200);


fill(100);
stroke(0);
strokeWeight(2);
ellipse(200,300,40,100);
triangle(182, 320, 195, 355, 160, 360);
triangle(217, 320, 210, 355, 240, 360);
fill(255);
ellipse(200,300,10,10);
ellipse(200,285,10,10);

stroke(255);
strokeWeight(15);
line(75,-265,75,fly2-200);
line(250,-265,250,fly2-200);
line(375,-265,375,fly2-200);
strokeWeight(25);
line(355,-265,355,fly2-400);
line(150,-265,150,fly2-400);

}


