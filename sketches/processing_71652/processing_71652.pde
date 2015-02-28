
import processing.dxf.*;

size(640, 360);
smooth();
background(239, 236, 226);
// the lines that follow make up the "street" map

//this are the white lines                 STREETS
strokeWeight(8);
stroke(251);
line(640, 79, 0, 79);
line(512, 17, 309, 78);
line(530, 42, 640, 61);
line(609, 79, 588, 128);

//this are the black streets 
strokeWeight(2);
stroke(5);
line(479, 178, 253, 354);
line(448, 360, 320,210);
line(544, 325, 640, 300);
line(625, 304, 494,240);
line(640, 128, 0, 128);
line(588, 128, 588, 285);
line(402, 238, 287, 0);


//this are yellow lines
strokeWeight(8);
stroke(246, 241, 147);
line(640, 180, 0, 240);
line(520, 0, 581, 256);
line(640, 300, 544, 325);
//the park                          PARK  
fill(201,222,180);
noStroke();
quad(490,219,420,233,434,265,496,270);
//river                                RIVER
fill(169, 188, 222);
noStroke();
beginShape();
vertex(566, 360);
vertex(500, 360);
vertex(448, 59);
vertex(407, 0);
vertex(428, 0);
vertex(479, 62);
endShape(CLOSE);
// circle                                BIG CIRCLE
strokeWeight(3);
stroke(217, 28, 92, 140);
fill(228,197,206);
ellipse(170, 181, 400, 400);

noFill();
strokeWeight(1);
stroke(random(255), random(255), random(255), 30);
for (int x=400; x <1200; x+= 60) {
  for (int y=400; y <1200; y+= 40) {
    ellipse(170, 181 ,x, y);
  }
}

// arc                            Bridge
stroke(0);
noFill();
strokeWeight(3);
arc(494,202, 105,105,4.08, 5.04);

/*
//this are the arcs inside the circle
strokeWeight(8);
stroke(7);
noFill();
strokeCap(ROUND);
arc(153, 263, 424,470, 3.5, 6.13);

strokeWeight(7);
stroke(100);
arc(163, 270, 424,470, 3.5, 6);

strokeWeight(7);
stroke(100);
arc(163, 270, 424,470, 3.5, 6);
*/



//Rectangles in top of circles.    RECTANGLES
// rectangle outside the lines.
fill(250);
strokeWeight(3);
stroke(0,182,37);
rect(50,50,250,250);

//HORIZON LINE
stroke(0);
strokeWeight(1);
line(50,225,300,225);

noFill();
strokeWeight(1);
stroke(0);

for (int x=50; x <300; x+= 20) {
  line(50,x+10,130, 80);
}

for (int x=50; x <300; x+= 20) {
  line(x+10, 50 ,130, 80);
}



// triangle
fill(234,251,63);
strokeWeight(2);
stroke(40,41,31,255);
triangle(251,224,223,156,193,214);

// circles effect, on top of the reingle. 

noFill();
strokeWeight(1);

for (int x=0; x <130; x+= 3) { 
  ellipse(222,195,x, 130);
}
