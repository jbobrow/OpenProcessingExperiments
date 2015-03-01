

 int x = (mouseX+55);

void setup() {
size (1500,251);
smooth();
background (70);
 }

 
 void draw() {
 background (70);
 
//Head
fill(40);
strokeWeight(2);
stroke(0);
rect(pmouseX+100, 50, 100, 100);
fill(50);
quad(pmouseX+100, 50, pmouseX+100, 150, pmouseX+75, 100, pmouseX+75, 50);
strokeWeight(2);
line(pmouseX+100,50,pmouseX+198,50);

//Wheel
fill(0);
stroke(0,0,0);
strokeWeight(2);
ellipse(pmouseX+145,230,30,35);
fill(200);
stroke(0,0,0);
ellipse(pmouseX+142,230,10,15);

 
//Body
fill(46);
stroke(0);
strokeWeight(2);
rect(pmouseX+100, 150, 100, 75);
fill(46);
strokeWeight(1);
quad(pmouseX+100, 150, pmouseX+100, 225, pmouseX+75, 100, pmouseX+75, 100);
 

//Eye
fill(200,7,8);
strokeWeight(2);
ellipse(pmouseX+150,90,45,50);
fill(0,0,55);
strokeWeight(1);
ellipse(pmouseX+150, 90,20, 20);

if (mousePressed) {
 if (mouseButton == LEFT) {

fill(0,0,0);
strokeWeight(2);
ellipse(pmouseX+150,90,45,50);
fill (100,0,0);
ellipse(pmouseX+150, 90,20,20);
}
}
 
if (mousePressed) {
 if (mouseButton == LEFT) {
 if (keyPressed) {
 if (key == 'l') {
 
 stroke(255,0,0);
 line(pmouseX+150,90,1500,90);
 fill(0);
textSize(35);
text( "Bzzzzzzzz", mouseX + 180, 85);


 }
 }
 }
 }
 
//Antenna
fill(0);
stroke(0,0,0);
strokeWeight(2)
line(pmouseX+140,49,pmouseX+140,20);
ellipse(pmouseX+140,20,10,10);
 
//Left Upper Arm
strokeWeight(5);
line(pmouseX+87,150,pmouseX+65,175);
 
//Left Lower Arm
strokeWeight(5);
line(pmouseX+65,175,pmouseX+70,190);
 
//Left Shoulder
fill(140);
strokeWeight(2);
arc(pmouseX+87,150,15,15, 0, PI+HALF_PI);
 
//Left Elbow
fill(140);
strokeWeight(2);
arc(pmouseX+65,175,10,10, 0, 4.71);
 
//Left Hand
fill(110);
strokeWeight(2);
arc(pmouseX+70,190,15,15, 1.26, TWO_PI);
 
//Right Arm
strokeWeight(4);
line(pmouseX+202,150,pmouseX+245,95);
 
//Right Elbow
fill(140);
strokeWeight(2);
ellipse(pmouseX+221,125,10,10);
 
 
//Right Hand
fill(110);
strokeWeight(2);
arc(pmouseX+245,95,15,15, 0, PI+HALF_PI);
 
//Funny Lights
strokeWeight(2);
ellipse(pmouseX+150,135,20,15);
line(pmouseX+150,128,pmouseX+150,140);
line(pmouseX+145,130,pmouseX+145,138);
line(pmouseX+155,128,pmouseX+155,138);
strokeWeight(2);
fill(0,225,0);
ellipse(pmouseX+130,200,16,15);
fill(0,0,225);
strokeWeight(2);
ellipse(pmouseX+130,175,16,15);
fill(225,0,0);
strokeWeight(2);
ellipse(pmouseX+165,185,15,35);

if (mousePressed == true) {
if(mouseButton == RIGHT) {

fill(0,0,225);
ellipse(pmouseX+130,200,16,15);
fill(225,0,0);
ellipse(pmouseX+130,175,16,15);;
fill(0,225,0);
strokeWeight(2);
ellipse(pmouseX+165,185,15,35);

}
}

 //Ground
stroke(0,225,0);
strokeWeight(2);
line(0,249,1500,250);

}
