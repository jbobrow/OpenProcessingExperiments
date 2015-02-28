
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
image (img, 0, 0);
// here you add your code with all shapes and colors. 
stroke(600, 0, 0);
strokeWeight(10);
line(428, 60, 427, 299);
noStroke();
fill(0, 226, 255);
rectMode(CENTER);
rect(70,491,80,50);
fill(600,418,576);
stroke(599.25,220.9,0);
strokeWeight(5);
ellipse(246,288,100,100);
fill(mouseX+30, mouseY+30, 589.85, 472.35);
stroke(153,0,76);
strokeWeight(4);
ellipse(149, 151, 264, 264);
line(378,69,540,142);
line(392,146,473,144);
line(399,163,481,160);
stroke(0,305.5,395.55);
line(125,421,599,297);
stroke(140,135,434);
line(225,413,429,210);
line(429,210,599,353);
stroke(306,0,152);
strokeWeight(8);
line(404,539,599,505);
stroke(153,0,76);
strokeWeight(5);
line(390,592,599,534);
stroke(128,65,217);
strokeWeight(2);
line(421,589,599,592);

fill(0, 0, 600);
noStroke();
quad(341, 438, 413, 480, 423, 455, 361, 394);
fill(0, 600, 0);
quad(317, 502, 371, 540, 391, 506, 327, 471);
fill(600, 0, 0);
quad(278, 590, 329, 599, 348, 574, 301,531);

noFill();
strokeWeight(6);
stroke(0, 0, 0);
bezier(237, 390, 248, 413, 320, 405, 308, 375);
bezier(200,461,125,399,210,348,240,395);
bezier(309,374,302,340,389,314,393,349);
bezier(395,349,396,366,467,348,463,332);
bezier(463,332,459,309,595,273,599,289);
strokeWeight(12);
line(156,532,286,598);
strokeWeight(4);
stroke(306,0,152);
line(276,589,361,390);
line(361,390,428,455);
line(428,455,330,598);
point(550, 345);
fill(0,226,255);
quad(349,575,360,586,389,558,370,543);
quad(394,507,423,524,445,501,413,480);
fill(600,600,0);
quad(431,456,463,483,479,470,443,438);
fill(0,0,0);
quad(453,424,490,457,508,441,467,399);
line(444,438,454,423);
line(346,599,586,368);
line(384,599,599,366);
line(417,599,599,397);
line(298,531,376,599);
line(316,501,428,587);
line(329,469,465,545);
line(342,437,481,521);
line(464,484,493,511);
line(479,469,507,497);
line(492,459,518,484);
line(511,444,535,468);
line(546,408,566,433);
line(568,388,590,408);
line(588,368,599,383);
quad(448,501,465,511,479,495,465,485);
quad(505,472,518,485,535,466,521,452);
fill(0,0,0);
quad(480,471,490,482,503,470,493,458);
quad(480,498,491,510,508,495,493,483);
quad(553,420,566,432,587,408,573,394);
quad(569,387,574,393,593,375,587,369);






































































}
