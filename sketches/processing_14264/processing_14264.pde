
void setup() {
  size(500,500);
background(45,80,247);
}

void draw() {
  background(45,80,247);
//gras
noStroke();
fill(17,131,48);
rectMode(CORNER);
rect(0,400,600,600);

//body
noStroke();
fill(152,21,6);
rect(175,125,150,320);

//head
ellipseMode(CENTER);
ellipse(250,125,149,150);


//right arm
quad(50,125+mouseY,175,175,175,225,50,175+mouseY);

//right hand
ellipseMode(CENTER);
ellipse(50,150+mouseY,50,50);
ellipseMode(CENTER);
ellipse(50,125+mouseY,20,20);

//left arm
quad(325,175,450,125+mouseY,450,175+mouseY,325,225);

//left hand
ellipseMode(CENTER);
ellipse(450,150+mouseY,50,50);
ellipseMode(CENTER);
ellipse(450,125+mouseY,20,20);

//mouth
fill(10);
ellipseMode(CENTER);
ellipse(250,175,100,100);
fill(152,21,6);
rectMode(CENTER);
rect(250,210,150,60);

//tooth
fill(255);
rect(270,170,15,20);

//eye w
fill(250);
ellipseMode(CENTER);
ellipse(250,90,40,40);

//eye b
fill(0);
ellipseMode(CENTER);
ellipse(250,92,15,15);

//pink
fill(250,127,114);
rectMode(CENTER);
rect(250,320,75,130);

//upperpink
ellipseMode(CENTER);
ellipse(250,255,75,75);

//brow
fill(152,21,6);
rectMode(CENTER);
rect(250,73,40,10);
}

