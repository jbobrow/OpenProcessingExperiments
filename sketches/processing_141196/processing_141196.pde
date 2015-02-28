
/*
Konkuk University
SOS iDesign

Name: Shin yeonsik
ID: dnmys11

*/

PImage img;

void setup(){
size (600, 600);
background(255, 255, 255);
// noLoop();
smooth();
colorMode (RGB);

}


float dia = 80;

float c1 = random(width);

void draw(){
  
if(mousePressed){
noStroke();
fill(mouseX,width-mouseY,0,20);
ellipse(mouseX,mouseY,dia,dia);
ellipse(mouseX,height-mouseY,dia,dia);
ellipse(width-mouseX,mouseY,dia,dia);
ellipse(width-mouseX,height-mouseY,dia,dia);
}



//head
fill(84,144,237);
stroke(0);
strokeWeight(3);
ellipse(303,300,466,444);

//face
fill(255,255,255);
stroke(0);
strokeWeight(3);
ellipse(301,325,424,374);

//eyes1
fill(255,255,255);
stroke(0);
strokeWeight(3);
ellipse(346,150,88,118);
ellipse(257,150,88,118);

//eyes2
noStroke();
fill(3,3,3);
ellipse(330,164,26,38); 
ellipse(275,164,25,38);

//eyes3
noStroke();
fill(255,255,255);
ellipse(329,166,6,10);
ellipse(275,166,6,10);


//nose1
stroke(0);
fill(255,0,0);
ellipse(301,219,58,54);

//nose3
line(301,248,301,375);

//neck
stroke(0);
fill(255,0,0);
rect(136,474, 335, 50, 20);

//bell1
stroke(0);
fill(255,255,0);
ellipse(304,524,74,72);

//bell2
stroke(0);
fill(255,255,0);
rect(263,507, 82, 10, 20);

//bell3
stroke(0);
fill(255,255,255);
ellipse(304,535,14,14);

//bell4
line(304,544,304,560);

//lip
noFill();
stroke(0);
bezier(130,291,140,402,466,402,475,291);

//mustache
line(374,252,489,208);
line(237,252,113,208);
line(373,276,508,269);
line(237,276,96,269);
line(374,303,496,335);
line(235,303,113,335);


if(mousePressed){ 
fill(mouseX,mouseY,0); 
ellipse(301,219,58,54);
}
 
//nose2
stroke(0);
fill(255, 255, 255);
ellipse(296,210,12,12);
}

void keyPressed(){
  setup();

}

