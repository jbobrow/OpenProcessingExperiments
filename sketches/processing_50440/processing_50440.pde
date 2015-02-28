
/*****************************************
 * Assignment 01
 * Name:         Zhen Xu
 * E-mail:       zxu01@brynamwr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    25/Jan/2012
 * 
 * A Doraemon is peaking at you in the dark! Click the switch to turn on the
 * light and see what he got!( The white "leaf" on his head is his aircraft--
 * "the bamboo dragonfly"
 ***********************************************/ 
void setup() {
  
size( 500,750);
background(0);
strokeWeight(2);
//switch
quad(425,50,425,125,475,125,475,50);
quad(437.5,75,437.5,112.5,462.5,112.5,462.5,75);
println("press the swith to turn on the light!");

//head 
smooth();
arc(250,250,300,300,2.601,6.824);
//eyes
ellipse(225,175,50,100);
ellipse(275,175,50,100);
line(225,175,212.5,187.5);
line(225,175,237.5,187.5);
line(275,175,262.5,187.5);
line(275,175,287.5,187.5);
//mustache
line(175,225,225,250);
line(175,250,225,250);
line(175,275,225,250);
line(275,250,325,225);
line(275,250,325,250);
line(275,250,325,275);
//nose
fill(255,0,0);
ellipse(250,250,12.5,12.5);
//mouth
noFill();
arc(250,250,70.71,70.71,0.785,2.356);
//neck
beginShape();
vertex(125,325);
vertex(100,350);
vertex(400,350);
vertex(375,325);
endShape(CLOSE );
//bell
ellipse(250,375,50,50);
//leftarm
curve(234,288,100,350,175,499,465,463);
arc(225,500,50,50,3.142,6.284);
curve(54,345,150,350,225,475,152,597);
//rightarm
curve(224,341,275,475,350,350,346,266);
arc(275,500,50,50,3.142,6.284);
curve(72,513,325,500,400,350,318,270);
//pocket and belly
line(175,500,325,500);
noFill();
arc(250,475,158.1,158.1,0.297,2.845);
arc(250,500,150,150,0.000,3.142);
//legs
line(150,485,150,600);
line(350,485,350,600);
line(250,575,250,625);
//feet
rect(150,600,200,25);
}
void draw() {
}
void mousePressed() {
 background(255);
strokeWeight(2);
//background
noStroke();
fill(14,237,83);
rect(0,0,250,375);
fill(236,237,14);
rect(250,0,250,375);
fill(250,15,101);
rect(0,375,250,375);
fill(201,109,211);
rect(250,375,250,375);
//aircraft(left)
fill(255);
curve(123,128,200,50,250,100,232,142);
//aircraft(right)
fill(255);
curve(464,56,300,50,250,100,314,167);
//head 
stroke(3);
smooth();
fill(17,51,237);
ellipse(250,250,300,300);
fill(255);
ellipse(250,278,290,290);
//eyes
fill(255);
ellipse(225,175,50,100);
ellipse(275,175,50,100);
line(225,175,212.5,187.5);
line(225,175,237.5,187.5);
line(275,175,262.5,187.5);
line(275,175,287.5,187.5);
//mustache
line(175,225,225,250);
line(175,250,225,250);
line(175,275,225,250);
line(275,250,325,225);
line(275,250,325,250);
line(275,250,325,275);
//nose
fill(255,0,0);
ellipse(250,250,12.5,12.5);
//mouth
noFill();
arc(250,250,70.71,70.71,0.785,2.356);
//neck
fill(255);
beginShape();
vertex(125,325);
vertex(100,350);
vertex(400,350);
vertex(375,325);
endShape(CLOSE);
//body
fill(17,51,237);
rect(150,350,200,250);
//bell
fill(237,245,32);
ellipse(250,375,50,50);
ellipse(250,375,25,25);
//leftarm
fill(17,51,237);
quad(100,350,150,350,220,475,175,500);
fill(255);
arc(225,500,50,50,3.142,6.284);
//rightarm
fill(17,51,237);
quad(350,350,400,350,325,500,275,475);
fill(255);
arc(275,500,50,50,3.142,6.284);
//pocket and belly
line(175,500,325,500);
fill(255);
arc(250,500,150,150,0.000,3.142);
noFill();
arc(250,475,158.1,158.1,0.297,2.845);
//legs
line(150,485,150,600);
line(350,485,350,600);
line(250,575,250,625);
//feet
fill(255);
rect(150,600,200,25);
line(250,600,250,625);
//gifts
stroke(10);
line(50,600,62.5,625);
line(75,600,62.5,625);
fill(255,0,0);
rect(25,625,75,100);
fill(0,255,0);
rect(25,650,75,25);
rect(50,625,25,100);
}

