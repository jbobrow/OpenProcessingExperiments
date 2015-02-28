
//Intro to Creative Programming 
//Assignment 1
//Sang Un Jeon


size(640, 360);
background(164,0,16);
smooth();

//basic pattern
for (int i = -60; i < 1200; i += 5) {
  line(i-60, 200, i + 60, 50);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 500, i + 60, 350);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 800, i + 60, 650);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 1100, i + 60, 950);
}

for (int i = -60; i < 1200; i += 5) {
  line(200, i-60, 50, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(500, i-60, 350, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(800, i-60, 650, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(1100, i-60, 950, i+60);
}

//in-between pattern

stroke(0,0,0,100);
for (int i = -60; i < 1200; i += 20) {
  line(i-60, 280, i + 60, 270);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 580, i + 60, 570);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 880, i + 60, 870);
}

for (int i = -60; i < 1200; i += 20) {
  line(280, i-60, 270, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(580, i-60, 570, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(880, i-60, 870, i+60);
}

//Yellow
stroke(253,253,3,100);
for (int i = -60; i < 1200; i += 20) {
  line(i-60, 130, i + 60, 120);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 430, i + 60, 420);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 730, i + 60, 720);
}

for (int i = -60; i < 1200; i += 20) {
  line(130, i-60, 120, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(430, i-60, 420, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(730, i-60, 720, i+60);
}




//FLY
beginShape();
fill(253,253,3,100);
noStroke();
stroke(0,0,0,0);
strokeJoin(ROUND);
strokeWeight(0);
int a = 250;
int b =350;
curveVertex(a+191,b-84);
curveVertex(a+201,b-87);
curveVertex(a+232,b-74);
curveVertex(a+238,b-74);
curveVertex(a+238,b-70);
curveVertex(a+248,b-70);
curveVertex(a+253,b-65);
curveVertex(a+257,b-65);
curveVertex(a+263,b-69);
curveVertex(a+267,b-61);
curveVertex(a+267,b-52);
curveVertex(a+258,b-43);
curveVertex(a+254,b-43);
curveVertex(a+234,b-39);
curveVertex(a+201,b-26);
curveVertex(a+191,b-28);
curveVertex(a+197,b-42);
curveVertex(a+207,b-49);
curveVertex(a+199,b-53);
curveVertex(a+199,b-56);
curveVertex(a+205,b-65);
curveVertex(a+191,b-78);
curveVertex(a+191,b-84);
endShape();

beginShape();
fill(253,253,3,100);
noStroke();
stroke(0,0,0,0);
strokeJoin(ROUND);
strokeWeight(0);
int c = 100;
int d = 230;
curveVertex(c+191,d-84);
curveVertex(c+201,d-87);
curveVertex(c+232,d-74);
curveVertex(c+238,d-74);
curveVertex(c+238,d-70);
curveVertex(c+248,d-70);
curveVertex(c+253,d-65);
curveVertex(c+257,d-65);
curveVertex(c+263,d-69);
curveVertex(c+267,d-61);
curveVertex(c+267,d-52);
curveVertex(c+258,d-43);
curveVertex(c+254,d-43);
curveVertex(c+234,d-39);
curveVertex(c+201,d-26);
curveVertex(c+191,d-28);
curveVertex(c+197,d-42);
curveVertex(c+207,d-49);
curveVertex(c+199,d-53);
curveVertex(c+199,d-56);
curveVertex(c+205,d-65);
curveVertex(c+191,d-78);
curveVertex(c+191,d-84);
endShape();

beginShape();
fill(253,253,3,100);
noStroke();
stroke(0,0,0,0);
strokeJoin(ROUND);
strokeWeight(0);
int e = -40;
int f = 100;
curveVertex(e+191,f-84);
curveVertex(e+201,f-87);
curveVertex(e+232,f-74);
curveVertex(e+238,f-74);
curveVertex(e+238,f-70);
curveVertex(e+248,f-70);
curveVertex(e+253,f-65);
curveVertex(e+257,f-65);
curveVertex(e+263,f-69);
curveVertex(e+267,f-61);
curveVertex(e+267,f-52);
curveVertex(e+258,f-43);
curveVertex(e+254,f-43);
curveVertex(e+234,f-39);
curveVertex(e+201,f-26);
curveVertex(e+191,f-28);
curveVertex(e+197,f-42);
curveVertex(e+207,f-49);
curveVertex(e+199,f-53);
curveVertex(e+199,f-56);
curveVertex(e+205,f-65);
curveVertex(e+191,f-78);
curveVertex(e+191,f-84);
endShape();





//zigzag
//beginShape();
fill(0,0,0);
stroke(0,0,0);
vertex(-30,330);
vertex(66,312);
vertex(82,342);
vertex(112,310);
vertex(152,330);
vertex(195,300);
vertex(232,320);
vertex(277,302);
vertex(357,324);
vertex(397,293);
vertex(498,303);
vertex(543,289);
vertex(621,332);
vertex(643,287);
vertex(650,361);
vertex(-30,361);
vertex(-30,330);
//endShape();
