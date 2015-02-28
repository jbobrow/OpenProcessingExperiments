
float robotX;
float robotY;

void setup()
{
  size(800, 800);
  smooth();
}

void draw()
{
background(210,237,243);  
//  robotY = 200;  
for (int robotY = 200; robotY < height; robotY+= 250) {
for (int robotX = 100; robotX < width; robotX+= 200) {  
strokeWeight (3);
//ROBOT HEAD
//coloring the head
stroke(174,223,228); 
fill(174,223,228);
rect (robotX-60,robotY-150,120,120);
rect (robotX-80,robotY-130,160,80); 
//antennae
stroke(0);
line (robotX, robotY-150, robotX-10, robotY-170);
line (robotX, robotY-150, robotX+10, robotY-170);
//head border lines
line (robotX-60, robotY-150, robotX+60, robotY-150);
line (robotX-60, robotY-30, robotX+60, robotY-30);
line (robotX-80, robotY-130, robotX-80, robotY-50);
line (robotX+80, robotY-130, robotX+80, robotY-50);
//head's corners
ellipseMode(CORNER);
arc(robotX-80, robotY-150, 40, 40, PI, TWO_PI-PI/2);
arc(robotX+40, robotY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
arc(robotX+40, robotY-70, 40, 40, 0, PI/2);
arc(robotX-80, robotY-70, 40, 40, PI/2, PI);
//eyes
//smiling eyes
fill(174,223,228);
stroke(0); 
ellipseMode(CENTER);
arc(robotX-40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
arc(robotX-40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
arc(robotX+40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
arc(robotX+40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
//blush
ellipseMode(CENTER);
stroke(247,165,170);
fill(247,165,170); 
ellipse(robotX-50,robotY-100,10,10);
ellipse(robotX+50,robotY-100,10,10);
//mouth
stroke(0); 
line (robotX-20, robotY-100, robotX+20, robotY-100);

//ROBOT BODY
fill(174,223,228);
rect (robotX-25,robotY-30,50,50);
ellipse (robotX,robotY-5,30,30);
line (robotX-5, robotY-10, robotX-5, robotY);
line (robotX+5, robotY-10, robotX+5, robotY);
//hands
line (robotX-25, robotY-30, robotX-35, robotY);
line (robotX+25, robotY-30, robotX+35, robotY);
//legs
line (robotX-15, robotY+20, robotX-15, robotY+40);
line (robotX+15, robotY+20, robotX+15, robotY+40);
}}
}


