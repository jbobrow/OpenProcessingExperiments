
/*
Konkuk University
SOS iDesign

Name: Oh You Ri
ID:201420090

*/

void setup(){
size (600, 600);
// noLoop();
smooth();
background(0);
}

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors. 

//head
noStroke();
fill (0, 209, 250);
ellipse (308, 280, 472, 472);

//eyes
fill (0);
ellipse (472, 171, 26, 26);
ellipse (144, 170, 26, 26);

//nose
ellipse (308, 245, 56, 56);

//mouth
fill (255);
ellipse (363, 319, 100, 100);
ellipse (262, 319, 100, 100);

//the brightness of the eye
ellipse (143, 167, 10, 10);
ellipse (473, 167, 10, 10);

//right mustache
stroke (0);
strokeWeight (3);
line (386, 291, 451, 290);
line (393, 311, 455, 316);
line (396, 332, 449, 347);

//left mustache
line (234, 290, 166, 290);
line (228, 309, 161, 320);
line (222, 330, 163, 349);

//bonus
 
 if(mousePressed){

float Ra = random(255);
float Rb = random(255);
float Rc = random(255);
float Rd = random(100,255);
noStroke();
fill (Ra,Rb,Rc);
ellipse (308, 245, 56, 56);
fill (0,0,Rd);
ellipse (mouseX, mouseY, 50, 50);

 }

}
