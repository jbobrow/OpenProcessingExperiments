
int i = 0;
int n = 0; 

void setup () {
 size(350,350);
background(#000033);
}

void mouseClicked(){
  i++;
}

void drawWhipe () {
  background(20);
}

void drawRowOne () {
//square 1
stroke(0);
fill(102,102,51,177);
rect(32,48,10,7);
//square 2
stroke(0);
fill(102,0,0,177);
rect(42,48,8,7);
//square 3
stroke(0);
fill(255,153,153,177);
rect(50,48,18,7);
//square 4
stroke(0);
fill(201,51,0,177);
rect(65,48,6,7);
//square 5
stroke(0);
fill(102,102,51,177);
rect(70,48,8,7);
//square 6
stroke(0);
fill(15,177);
rect(79,48,4,7);
//square 7
stroke(0);
fill(204,153,53);
rect(83,48,7,7);
//square 8
stroke(0);
fill(200);
rect(89,48,5,7);
}

void drawRowTwo () {
//ROW 2
stroke(0);
fill(20,177);
rect(32,55,10,15);
stroke(0);
fill(102,51,0,177);
rect(42,55,8,15);
stroke(0);
fill(153,102,51,177);
rect(50,55,15,15);
stroke(0);
fill(25,177);
rect(65,55,4,15);
stroke(0);
fill(255,204,204,177);
rect(70,55,8,15);
stroke(0);
fill(102,0,0,177);
rect(79,55,4,15);
stroke(0);
fill(90,177);
rect(83,55,6,15);
stroke(0);
fill(102,51,0,177);
rect(89,55,5,15);
}

void drawRowThree () {
 //ROW 3
stroke(0);
fill(255,153,163);
rect(32,70,10,10);
stroke(0);
fill(204,51,51);
rect(42,70,8,10);
stroke(0);
fill(102,51,0);
rect(50,70,15,10);
stroke(0);
fill(255,153,163);
rect(65,70,6,10);
stroke(0);
fill(0);
rect(70,70,8,10);
stroke(0);
fill(102,51,0);
rect(79,70,4,10);
stroke(0);
fill(255,51,51);
rect(83,70,7,10);
stroke(0);
fill(153,102,0);
rect(89,70,5,10);
}

void drawRowFour () { 
//ROW 4
stroke(0);
fill(0);
rect(32,79,10,12);
stroke(0);
fill(153,102,0);
rect(42,79,8,12);
stroke(0);
fill(51,0,0);
rect(50,79,15,12);
stroke(0);
fill(204,153,51);
rect(65,79,5,12);
stroke(0);
fill(204,102,102);
rect(70,79,9,12);
stroke(0);
fill(0);
rect(79,79,4,12);
stroke(0);
fill(0,51,51);
rect(83,79,6,12);
stroke(0);
fill(51,0,0);
rect(89,79,5,12);
}

void drawRowFive () {
 //ROW 5
stroke(0);
fill(255,204,204);
rect(32,90,10,7);
stroke(0);
fill(0);
rect(42,90,8,7);
stroke(0);
fill(60);
rect(50,90,15,7);
stroke(0);
fill(0);
rect(65,90,5,7);
stroke(0);
fill(102,102,51);
rect(70,90,9,7);
stroke(0);
fill(51,0,0);
rect(79,90,4,7);
stroke(0);
fill(153,163,204);
rect(83,90,6,7);
stroke(0);
fill(204,102,102);
rect(89,90,5,7);
}

void drawRowSix () {
 
//ROW 6
stroke(0);
fill(0);
rect(32,96,10,8);
stroke(0);
fill(102,0,0);
rect(42,96,8,8);
stroke(0);
fill(204,163,153);
rect(50,96,15,8);
stroke(0);
fill(255,102,102);
rect(65,96,5,8);
stroke(0);
fill(255,51,51);
rect(70,96,9,8);
stroke(0);
fill(102,102,51);
rect(79,96,4,8);
stroke(0);
fill(204,204,153);
rect(83,96,6,8);
stroke(0);
fill(0);
rect(89,96,5,8);
}

void drawCircleOne () {
 
//CIRCLE 1
smooth();
//first arc
stroke(0);
fill(255,153,0,177);
arc(76,160,80,80,radians(180),radians(270));
//second arc
stroke(0);
fill(102,153,204,177);
arc(76,160,80,80,radians(270),radians(360));
//third arc
stroke(0);
fill(153,0,0,177);
arc(76,160,80,80,radians(0),radians(90));
//4th arc
stroke(0);
fill(255,204,0,177);
arc(76,160,80,80,radians(90),radians(180));
}

void drawCircleTwo () {
 
//CIRCLE 2
smooth();
stroke(0);
fill(204,153,204,160);
ellipse(145,218,140,140);
     //INNER CIRCLE
stroke(0);
fill(0);
ellipse(145,218,70,70);
}

void drawLines () {
 
//VERTICAL LINE 1
strokeWeight(6);
strokeCap(SQUARE);
line(75,116,75,200);
stroke(255,102,102,160);
strokeWeight(6);
strokeCap(SQUARE);
line(75,200,75,245);
stroke(255,102,102,160);
strokeWeight(6);
strokeCap(SQUARE);
line(75,114,75,121);
 
//VERTICAL LINE 2
noStroke();
fill(204,102,0,130);
beginShape();
vertex(145,182);
vertex(153,182);
vertex(153,253);
vertex(145,255);
endShape();
 
noStroke();
fill(0,200);
beginShape();
vertex(145,74);
vertex(153,74);
vertex(153,184);
vertex(145,183);
endShape();
 
noStroke();
fill(0,200);
beginShape();
vertex(145,254);
vertex(153,253);
vertex(153,450);
vertex(145,450);
endShape();
 
//VERTICAL LINE 3
strokeWeight(6);
stroke(0,80);
strokeCap(SQUARE);
line(18,263,18,334);
}
 
 void drawSquares () {
 
//square 1
strokeWeight(0);
fill(153,102,153);
rect(180,209,16,20);
//square 2
stroke(0);
fill(255,255,102);
rect(196,209,10,20);
//square 3
stroke(0);
fill(255,51,0,200);
rect(206,209,12,20);
//square 4
stroke(0);
fill(0);
rect(218,209,3,20);
//square 5
stroke(0);
fill(204,204,255);
rect(221,209,18,20);
//square 6
stroke(0);
fill(51,51,102,100);
rect(239,209,18,20);
//square 7
stroke(0);
fill(255,51,0);
rect(257,209,23,20);
//square 8
stroke(0);
fill(35);
rect(279,209,20,20);
 }
 
 void drawFinal() {
 
//ROW 2
stroke(0);
fill(255,51,0,200);
rect(187,229,9,20);
stroke(0);
fill(20);
rect(197,229,9,20);
stroke(0);
fill(204,51,102,177);
rect(206,229,12,20);
stroke(0);
fill(0);
rect(218,229,3,110);
stroke(0);
fill(51,51,0,177);
rect(221,229,18,20);
stroke(0);
fill(225,204,0);
rect(239,229,18,20);
stroke(0);
fill(102,153,153,177);
rect(257,229,22,20);
stroke(0);
fill(200,177);
rect(279,229,20,20);
 
//ROW 3
stroke(0);
fill(255,255,201);
rect(221,249,18,21);
stroke(0);
fill(153,51,0);
rect(239,249,18,21);
stroke(0);
fill(0);
rect(257,249,22,21);
stroke(0);
fill(204,153,102);
rect(279,249,20,21);
 
//ROW 4
stroke(0);
fill(255,51,0,177);
rect(178,269,40,23);
stroke(0);
fill(255,204,0,177);
rect(221,269,18,23);
stroke(0);
fill(0,177);
rect(239,269,18,23);
stroke(0);
fill(0,51,102,177);
rect(257,269,22,23);
stroke(0);
fill(204,153,0,180);
rect(279,269,20,23);
 
//top squares
stroke(0);
fill(255,102,0);
rect(196,180,10,29);
//-----fillin----
 
 
//TOP HALF of CIRCLE 3
stroke(0);
fill(51,102,0,177);
arc(283,155,60,60,radians(180),radians(360));
 
 
//SHAPE (INTERSECTING 3RD CIRCLE)
stroke(0);
fill(255,255,201,100);
beginShape();
vertex(280,24);
vertex(299,104);
vertex(299,208);
vertex(280,208);
endShape();
stroke(0);
fill(0,0,51,160);
beginShape();
vertex(280,24);
vertex(299,104);
vertex(299,180);
vertex(280,185);
endShape();
 
//BOTTOM HALF of CIRCLE 3
stroke(0);
fill(0,51,102,177);
arc(283,155,60,59,radians(0),radians(180));
 
//HORIZONTAL LINE
strokeWeight(8);
stroke(0,200);
strokeCap(SQUARE);
line(19,160,333,160);
 
//YELLOW ARC
stroke(255,153,51,100);
strokeWeight(6);
noFill();
arc(154,56,70,70,radians(0),radians(112));
 
//RED ARC
stroke(153,0,0,100);
strokeWeight(7);
noFill();
arc(154,56,100,100,radians(0),radians(112));
 
//BLACK ARC 1
stroke(0);
strokeWeight(2);
arc(150,120,115,115,radians(270),radians(360));
 
//BLACK ARC 2
stroke(0);
strokeWeight(4);
arc(150,120,90,90,radians(270),radians(380));
 }
 
 void draw(){
   
  if (i>0) drawRowOne();
  if (i>1) drawRowTwo ();
  if (i>2) drawRowThree();
  if (i>3) drawRowFour();
  if (i>4) drawRowFive();
  if (i>5) drawRowSix();
  if(i>6) drawCircleOne();
  if (i>7) drawCircleTwo();
  if (i>8) drawLines();
  if (i>9) drawSquares();
  if (i>10) drawFinal();
  if (keyPressed == true) n++;
  if ( n>0) drawWhipe();
 
}

                
                                
