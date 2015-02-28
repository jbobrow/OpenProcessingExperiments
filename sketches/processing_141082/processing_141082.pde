
/*
 Konkuk University
 SOS iDesign

Name: Your Name <<------ Write your full name here!
 ID: Your ID <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("wassily_kandinsky.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 


background(545.2,531.1,408.9);

stroke(0);
strokeWeight(3);
line(0,168,363,168);

stroke(0);
strokeWeight(2);
line(89,327,311,327);

stroke(0);
strokeWeight(2);
line(25,518,328,518);

stroke(0);
strokeWeight(8);
line(0,67,345,411);

stroke(0);
strokeWeight(7);
line(0,67,167,600);

noStroke();
fill(308.8,152.75,500.95);
ellipse(72,322,165,165);

strokeWeight(1);
stroke(0);
strokeWeight(3);
line(288,0,600,475);


noStroke();
fill(0,305.5,359.55);
ellipse(373,449,250,250);

strokeWeight(4);
stroke(0);
fill(255,0,0);
rect(476,510,90,79);

stroke(0,0,0);
strokeWeight(3);
line(528,540,598,540);

stroke(0,0,0);
strokeWeight(5);
line(528,555,598,552);

noStroke();
fill(mouseX,100,mouseY,100);
quad(359,173,198,350,414,410,359,173);

fill(mouseX,150,mouseY,180);
quad(40,0,107,69,124,43,81,0);

strokeWeight(2);
stroke(0);
noFill();
bezier(8,66,62,66,120,113,135,165);

stroke(0,0,0);
strokeWeight(5);
line(349,0,462,181);

stroke(0,0,0);
strokeWeight(5);
line(395,0,445,76);

stroke(0,0,0);
strokeWeight(5);
line(466,0,497,53);

}

