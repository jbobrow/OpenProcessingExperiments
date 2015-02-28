
/*
 Konkuk University
 SOS iDesign

Name: hye ri lee <<------ Write your full name here!
 ID: hye ri lee<<--------- Write your ID here!

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
image (img, 0, 0);
background(484.1,589.85,472,35);
// here you add your code with all shapes and colors. 
strokeWeight(2);
fill(599.25,535.8,0);
triangle(448,139,364,292,472,340);
 
fill(mouseX+30, mouseY+30, 444, 543);
ellipse(466,380,140,200);
fill(mouseX+30, mouseY+30, 333, 533);
ellipse(299,276,80,140);

noFill();
strokeWeight(3);
stroke(0, 0, 0);
bezier(215,136,206,43,323,22,327,138);
stroke(600, 0, 0);

strokeWeight(2);
bezier(92,130,92,32,205,34,206,134);
stroke(0,0,0);
bezier(1,150,16,170,24,193,31,223);

bezier(92,130,92,32,205,34,206,134);
stroke(255,197,0);
bezier(0,50,33,30,76,51,87,128);


strokeWeight(1);
bezier(92,130,92,32,205,34,206,134);
stroke(0,0,0);
bezier(88,144,117,146,140,176,150,234);

strokeWeight(1);
bezier(92,130,92,32,205,34,206,134);
stroke(0,0,0);
bezier(86,328,105,169,230,243,206,351);

bezier(92,130,92,32,205,34,206,134);
stroke(0,0,0);
bezier(86,328,105,169,230,243,205,354);

bezier(92,130,92,32,205,34,206,134);
stroke(255,197,0);
bezier(143,449,133,380,244,270,263,455);











strokeWeight(3);
stroke(0,0,0);
fill(255,0,0);
rect(515,429,45,65);

stroke(600, 0, 0);
strokeWeight(5);
line(84, 71, 82, 594);
stroke(0, 0, 600);


strokeWeight(1);
fill(255,228,0);
quad(280,0,301,0,314,57,324,34);



// blackline
stroke(0,0,0);
line(0,133,446,143);



stroke(0,0,0);
line(243,0,345,511);

strokeWeight(8);
stroke(0,0,0);
line(224,0,452,359);

strokeWeight(2);
stroke(0,0,0);
line(204,272,421,272);

strokeWeight(2);
stroke(0,0,0);
line(268,437,436,432);

strokeWeight(2);
stroke(0,0,0);
line(35,271,163,65);

strokeWeight(1);
stroke(0,0,0);
line(28,264,140,86);

strokeWeight(1);
stroke(0,0,0);
line(40,276,179,48);

strokeWeight(2);
stroke(0,0,0);
line(50,393,201,146);

strokeWeight(1);
stroke(0,0,0);
line(55,399,208,150);

stroke(0,0,0);
line(59,403,212,154);

strokeWeight(3);
stroke(0,0,0);
line(411,0,594,445);

strokeWeight(4);
stroke(0,0,0);
line(411,0,594,445);



strokeWeight(6);
stroke(0,0,0);
line(445,0,503,151);

strokeWeight(6);
stroke(0,0,0);
line(469,0,492,61);




strokeWeight(4);
stroke(0,0,0);
line(507,0,523,44);

strokeWeight(3);
stroke(0,0,0);
line(540,455,576,453);

strokeWeight(5);
stroke(0,0,0);
line(539,468,576,464);

strokeWeight(1);
stroke(0,0,0);
line(93,0,109,24);

strokeWeight(2);
stroke(0,0,0);
line(34,188,36,202);


stroke(0,0,0);
line(51,170,54,182);

stroke(0,0,0);
line(56,166,58,178);

stroke(0,0,0);
line(59,162,61,172);

stroke(0,0,0);
line(64,157,67,167);

stroke(0,0,0);
line(67,153,71,163);

stroke(0,0,0);
line(71,149,76,157);

strokeWeight(5);
fill(0,0,0);
quad(22,197,28,211,11,230,7,219);

strokeWeight(2);
stroke(0,0,0);
line(27,197,161,47);

stroke(0,0,0);
line(29,209,171,53);


strokeWeight(14);
stroke(0,0,0);
line(206,1,165,47);






















}
