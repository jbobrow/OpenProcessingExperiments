
//Assignment #1
//Name: Erin Penney
//E-mail: epenney@brynmawr.edu
//Course: CS 110 - Section 001
//Submitted: 9/11/12
//Description: This is the drawing created for assignment 1. It is a drawing of Thor, the Norse god of thunder. Press and hold the mouse in the window to bring down his thunderous wrath. Move the mouse while holding to move the lightning. It will disappear after you release the mouse.

boolean lightningOn = false;

//setup sketch
void setup() {
size(500,500);
background(0,255,0);
smooth();

//draw cape
fill(255,0,0);
strokeWeight(5);
quad(155,290, 125,425, 375,425, 335,290);

//draw hammer
stroke(185,97,13);
strokeWeight(10);
line(70,230, 130,350);
stroke(0,0,0);
strokeWeight(5);
fill(100);
quad(30,240, 85,200, 120,245, 55,285);

//draw left arm
strokeWeight(5);
stroke(0,0,0);
fill(250,180,160);
bezier(200,315, 40,250, 65,300, 200,350);

//draw right arm
fill(250,180,160);
bezier(310,320, 425,250, 455,300, 325,345);

//draw legs
fill(12,193,201);
strokeWeight(10);
rectMode(CENTER);
rect(210,440, 50,35);
rect(290,440, 50,35);

//draw left boot
fill(0,0,0);
rect(210,460, 60,20);

//draw right boot
fill(0,0,0);
rect(290,460, 60,20);

//draw body
fill(51,7,147);
rect(249,350, 150,150);

//draw buttons
ellipseMode(CENTER);
fill(58,232,240);
strokeWeight(5);
ellipse(210,350, 30,30);
ellipse(290,350, 30,30);
ellipse(210,390, 20,20);
ellipse(290,390, 20,20);

//draw hair
fill(229,193,7);
strokeWeight(5);
bezier(128,240, 125,340, 130,390, 154,280);
bezier(372,240, 360,340, 365,390, 336,280);

//draw head
ellipseMode(CENTER);
strokeWeight(10);
fill(250,180,160);
ellipse(250,200, 250,250);

//draw mouth
strokeWeight(5);
line(220,260, 280,260);

//draw eyes
fill(0,0,0);
ellipse(200,200, 20,20);
ellipse(300,200, 20,20);
noStroke();
fill(250, 180, 160);
triangle(200,200, 220,190, 220,210);
triangle(300,200, 320,190, 320,210);

//draw left wing
stroke(0,0,0);
fill(255,255,255);
bezier(125,130, 90,90, 80,100, 125,155);
bezier(125,100, 80,50, 70,60, 125,130);
bezier(125,60, 70,15, 60,10, 125,100);
stroke(0,0,0);
strokeWeight(5);
line(125,60, 125,150);

//draw right wing
stroke(0,0,0);
fill(255,255,255);
bezier(370,130, 395,90, 405,100, 370,155);
bezier(370,100, 405,50, 415,60, 370,130);
bezier(370,60, 415,15, 425,10, 370,100);
strokeWeight(5);
line(370,60, 370,150);

//draw helmet
fill(100);
strokeWeight(10);
arc(250,180, 249,230, -3.141592654,0);
strokeWeight(5);
triangle(250,45,240,65,260,65);

//draw lightning

}

//lightning
void draw() {
  //setup sketch
size(500,500);
background(0,255,0);
smooth();

//draw cape
fill(255,0,0);
strokeWeight(5);
quad(155,290, 125,425, 375,425, 335,290);

//draw hammer
stroke(185,97,13);
strokeWeight(10);
line(70,230, 130,350);
stroke(0,0,0);
strokeWeight(5);
fill(100);
quad(30,240, 85,200, 120,245, 55,285);

//draw left arm
strokeWeight(5);
stroke(0,0,0);
fill(250,180,160);
bezier(200,315, 40,250, 65,300, 200,350);

//draw right arm
fill(250,180,160);
bezier(310,320, 425,250, 455,300, 325,345);

//draw legs
fill(12,193,201);
strokeWeight(10);
rectMode(CENTER);
rect(210,440, 50,35);
rect(290,440, 50,35);

//draw left boot
fill(0,0,0);
rect(210,460, 60,20);

//draw right boot
fill(0,0,0);
rect(290,460, 60,20);

//draw body
fill(51,7,147);
rect(249,350, 150,150);

//draw buttons
ellipseMode(CENTER);
fill(58,232,240);
strokeWeight(5);
ellipse(210,350, 30,30);
ellipse(290,350, 30,30);
ellipse(210,390, 20,20);
ellipse(290,390, 20,20);

//draw hair
fill(229,193,7);
strokeWeight(5);
bezier(128,240, 125,340, 130,390, 154,280);
bezier(372,240, 360,340, 365,390, 336,280);

//draw head
ellipseMode(CENTER);
strokeWeight(10);
fill(250,180,160);
ellipse(250,200, 250,250);

//draw mouth
strokeWeight(5);
line(220,260, 280,260);

//draw eyes
fill(0,0,0);
ellipse(200,200, 20,20);
ellipse(300,200, 20,20);
noStroke();
fill(250, 180, 160);
triangle(200,200, 220,190, 220,210);
triangle(300,200, 320,190, 320,210);

//draw left wing
stroke(0,0,0);
fill(255,255,255);
bezier(125,130, 90,90, 80,100, 125,155);
bezier(125,100, 80,50, 70,60, 125,130);
bezier(125,60, 70,15, 60,10, 125,100);
stroke(0,0,0);
strokeWeight(5);
line(125,60, 125,150);

//draw right wing
stroke(0,0,0);
fill(255,255,255);
bezier(370,130, 395,90, 405,100, 370,155);
bezier(370,100, 405,50, 415,60, 370,130);
bezier(370,60, 415,15, 425,10, 370,100);
strokeWeight(5);
line(370,60, 370,150);

//draw helmet
fill(100);
strokeWeight(10);
arc(250,180, 249,230, -3.141592654,0);
strokeWeight(5);
triangle(250,45,240,65,260,65);

//lightning
if (lightningOn) {
  fill(255,255,0);
  beginShape();
    vertex(0,0);
    vertex(mouseX*.25,mouseY*.5);
    vertex(mouseX*.5, mouseY*.33);
    vertex(mouseX, mouseY);
    vertex(mouseX*.66, mouseY*.1);
    vertex(mouseX*.3, mouseY*.25);
    vertex(mouseX*.1, 0);
    endShape();
}

}

//lightning
void mousePressed() {
  lightningOn = true;
}

void mouseReleased() {
  lightningOn = false;
}

