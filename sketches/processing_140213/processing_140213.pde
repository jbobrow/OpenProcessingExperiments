
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JEONG Eunyeah
// ID: 201420106

xPImage img;

void setup(){
background(248,236,184);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420106 eunyeah Jeong.jpg"); // put the image in the same folder as the processing file
 }

void draw(){

colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY);

strokeWeight(5);
fill(432,78,135);
rect(437,346,101,93);

noStroke();
fill(mouseY,182,252,183);
ellipse(322,270,277,277);

noStroke();
fill(512,421,139);
quad(255,1,122,155,375,235,321,3);

strokeWeight(2);
stroke(0);
fill(mouseX,258,108,420);
bezier(-1,46,75,78,56,182,0,207);

stroke(0);
strokeWeight(8);
line(313,252,75,1);
line(492,399,578,395);

stroke(0);
strokeWeight(3);
line(-1,143,85,457);
line(600,345,391,0);
line(498,382,575,382);

strokeWeight(2);
stroke(0);
point(276,353);
line(276,353,-1,349);
line(247,131,-1,124);

noStroke();
noFill();
ellipse(322,270,277,277);



}
