
//Hui Zhang processing
// Project 1

void setup(){
size(200,200);

smooth();
}

void draw() {
  
background(255);
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);

fill(0);
line(100,41,50,2);
rect(100,35,20,10);
fill(247,228,10);
rect(100,100,40,100);

fill(255);
ellipse(mouseX,mouseY,60,60);

fill(0);
ellipse(110,70,3,5);
ellipse(90,70,3,5);
ellipse(100,90,3,5);
stroke(0);

//cheek
fill(210,10,50);
ellipse(110,80,10,5);
ellipse(90,80,10,5);

//hands
fill(0);
ellipse(65,100,15,10);
ellipse(135,100,15,10);

//feet
line(100,150,80,160);
line(100,150,120,160);
}


