
void setup() {
  size(500,600);
}
void draw() {
background(255);
noStroke();
fill(150);
ellipseMode(CENTER);
ellipse(250,100,150,150);//the head
fill(0);
rectMode(CENTER);
rect(250,18,1,15);
fill(255,0,0);
ellipseMode(CENTER);
ellipse(250,10,8,8);//the antennae
fill(mouseX,0,0);
ellipseMode(CENTER);
ellipse(225,75,17,17);//eye number 1, changing colour according to mouse position
fill(mouseY,0,0);
ellipseMode(CENTER);
ellipse(275,75,17,17);//eye number 2, changing colour according to mouse position
fill(255,255,0);
rectMode(CENTER);
rect(225,75,7,7);//pupil number 1
fill(255,255,0);
rectMode(CENTER);
rect(275,75,7,7);//pupil number 2
fill(255,0,0);
rectMode(CENTER);
rect(250,100,15,10);//the nose
fill(255);
ellipseMode(CENTER);
ellipse(250,137,50,15);//the mouth
fill(150);
rectMode(CENTER);
rect(250,170,20,35);//the neck
fill(150);
rectMode(CENTER);
rect(250,280,100,200);//the body
fill(100);
ellipseMode(CENTER);
ellipse(205,185,10,10);
fill(100);
ellipseMode(CENTER);
ellipse(295,185,10,10);
fill(100);
ellipseMode(CENTER);
ellipse(205,375,10,10);
fill(100);
ellipseMode(CENTER);
ellipse(295,375,10,10);//the bolts
fill(150);
rectMode(CENTER);
rect(200,200,20,10);
fill(150);
rectMode(CENTER);
rect(300,200,20,10);
fill(130);
rectMode(CORNER);
rect(170,180,20,120);
fill(130);
rectMode(CENTER);
rect(320,240,20,120);//the arms
fill(0);
rectMode(CENTER);
rect(320,240,20,1);
fill(0);
rectMode(CENTER);
rect(180,240,20,1);
fill(50);
rectMode(CENTER);
rect(168,240,5,10);
fill(50);
rectMode(CENTER);
rect(192,240,5,10);
fill(50);
rectMode(CENTER);
rect(308,240,5,10);
fill(50);
rectMode(CENTER);
rect(332,240,5,10);//arm bolts/lines
fill(mouseY+50,0,0);
ellipseMode(CENTER);
ellipse(250,280,40,40);
fill(0,0,150,50);
ellipseMode(CENTER);
ellipse(250,280,50,50);
fill(0,0,mouseY-10);
rectMode(CENTER);
rect(210,200,10,10);
fill(mouseX+10,0,0);
rectMode(CENTER);
rect(220,200,10,10);
fill(0,mouseY-200,0);
rectMode(CENTER);
rect(230,200,10,10);//body buttons with colours changing according to where the mouse is
fill(130);
rectMode(CORNER);
rect(210,380,30,130);
fill(130);
rectMode(CORNER);
rect(260,380,30,130);//the legs
fill(0);
rectMode(CENTER);
rect(225,450,30,1);
fill(0);
rectMode(CENTER);
rect(275,450,30,1);
fill(50);
rectMode(CENTER);
rect(208,450,5,10);
fill(50);
rectMode(CENTER);
rect(242,450,5,10);
fill(50);
rectMode(CENTER);
rect(258,450,5,10);
fill(50);
rectMode(CENTER);
rect(292,450,5,10);//leg bolts/lines
fill(100);
rectMode(CORNER);
rect(205,510,40,20);
fill(100);
rectMode(CORNER);
rect(255,510,40,20);//the feet
if (!mousePressed) {
fill(0);
ellipseMode(CENTER);
ellipse(250,137,50,15);
fill(0);
rectMode(CENTER);
rect(250,100,15,10);
fill(0);
ellipseMode(CENTER);
ellipse(225,75,17,17);
fill(0);
ellipseMode(CENTER);
ellipse(275,75,17,17);
fill(0);
rectMode(CENTER);
rect(210,200,10,10);
fill(0);
rectMode(CENTER);
rect(220,200,10,10);
fill(0);
rectMode(CENTER);
rect(230,200,10,10);//when the mouse isn't clicked, the eyes and buttons are off
  }
}



