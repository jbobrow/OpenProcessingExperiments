
int x = 300;
int y = 50;
int w = 200;
int h = 200;



void setup(){

size (600,300);
smooth();
background(255);
 
 }


void draw()

{ 



//Head
fill(40);
strokeWeight(2);
rect(100, 50, 100, 100);
fill(50);
quad(100, 50, 100, 150, 75, 100, 75, 50);
strokeWeight(2);
line(100,50,198,50);
 
//Wheel
fill(0);
stroke(0,0,0);
strokeWeight(2);
ellipse(145,230,30,35);
fill(200);
stroke(0,0,0);
ellipse(142,230,10,15);
 
 
//Body
fill(46);
strokeWeight(1);
rect(100, 150, 100, 75);
fill(46);
quad(100, 150, 100, 225, 75, 100, 75, 100);
 
//Eye

fill(200,7,8);
strokeWeight(2);
ellipse(150,90,45,50);
fill(0,0,55);
strokeWeight(1);
ellipse(150, 90,20, 20);
 
 
//Antenna
fill(0);
stroke(0,0,0);
strokeWeight(2);
line(140,49,140,20);
ellipse(140,20,10,10);
 
//Left Upper Arm
strokeWeight(5);
line(87,150,65,175);
 
//Left Lower Arm
strokeWeight(5);
line(65,175,70,190);
 
//Left Shoulder
fill(140);
strokeWeight(2);
arc(87,150,15,15, 0, PI+HALF_PI);
 
//Left Elbow
fill(140);
strokeWeight(2);
arc(65,175,10,10, 0, 4.71);
 
//Left Hand
fill(110);
strokeWeight(2);
arc(70,190,15,15, 1.26, TWO_PI);
 
//Right Arm
strokeWeight(4);
line(202,150,245,95);
 
//Right Elbow
fill(140);
strokeWeight(2);
ellipse(221,125,10,10);
 
 
//Right Hand
fill(110);
strokeWeight(2);
arc(245,95,15,15, 0, PI+HALF_PI);
 
//Funny Lights
strokeWeight(2);
ellipse(150,135,20,15);
line(150,128,150,140);
line(145,130,145,138);
line(155,128,155,138);
strokeWeight(2);
fill(0,225,0);
ellipse(130,200,16,15);
fill(0,0,225);
strokeWeight(2);
ellipse(130,175,16,15);
fill(225,0,0);
strokeWeight(2);
ellipse(165,185,15,35);

//ground
strokeWeight(2);
line(0,250, 1000, 250);


if 
((pmouseX > x) && 
(pmouseX < x+w) &&
(pmouseY > y) && 
(pmouseY < y+h)) 
{

if (mousePressed == true) {
if(mouseButton == LEFT) {

strokeWeight(2);
fill(0);
stroke(0);
line(pmouseX, pmouseY,mouseX,mouseY);
}
}
}

if (keyPressed) {
if (key == 'k') {
size (600,300);
smooth();
background(255);

}
}


if (keyPressed) {
if (key == 'l') {


fill(0,0,0);
strokeWeight(2);
ellipse(150,90,45,50);
fill (100,0,0);
ellipse(150,90,20,20);
 stroke(255,0,0);
 line(150,90,pmouseX, pmouseY);
 fill(0);
 stroke(0);
textSize(35);
text( "Bzzzzzzzz", 200, 85);

 
 println("Ok, you got 'em. Press 'k' to reset");

}
}

if (keyPressed) {
if (key == 'k') {
    background(255);

}
}
}


