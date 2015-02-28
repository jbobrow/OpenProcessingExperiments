
//Mondrian practice-Charng-shin Chen (Echo Chen)

void setup(){
//canvaus size
size(800,784);
//white
background(255); 
}

void draw(){
//1.build the Coordinate system by line.
//2.According the Coordinate system to put the color block.

stroke(0);
strokeWeight(12);
line(368,0,368,784);
stroke(0);
strokeWeight(16);
line(0,318,800,318);
stroke(0);
strokeWeight(16);
line(0,508,800,508);
stroke(0);
strokeWeight(10);
line(81,508,81,784);
stroke(0);
strokeWeight(11);
line(614,508,614,784);
stroke(0);
strokeWeight(12);
line(368,742,609,742);

noStroke();
fill(231,6,4);
rect(0,0,362,310);

noStroke();
fill(252,215,4);
rect(0,516,76,284);

noStroke();
fill(25,22,101);
rect(374,516,235,227);
}



