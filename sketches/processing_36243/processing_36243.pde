
size(800,800);
smooth();


background(211,180,147);



//whiteside
fill(250);
stroke(250);
beginShape();
vertex(90,400);
vertex(150,350);
vertex(180,380);
vertex(300,200);
vertex(300,500);
vertex(90,400);
endShape();
noFill();

fill(0);
text("Igneous Rock.",555,400);

//Grey Side
fill(70);
stroke(70);
beginShape();
vertex(300,200);
vertex(380,325);
vertex(390,300);
vertex(425,350);
vertex(500,450);
vertex(300,500);
vertex(300,200);
endShape();
noFill();


//Magma
fill(0);
text("1,300 to 2,400 Degrees Ferinheight.",500,530);

//A-line
stroke(245,63,12);
strokeWeight(5);
line(300,80,300,500);

//B-Point
//(right)
stroke(245,63,12);
strokeWeight(5);
line(300,80,315,100);
//(left)
stroke(245,63,12);
strokeWeight(5);
line(300,80,285,100);

//magma pool
strokeWeight(1);
fill(245,63,12);
beginShape();
vertex(300,500);
vertex(235,470);
vertex(235,470);
vertex(300,600);
vertex(300,500);
endShape();
noFill();

//magma shadow
strokeWeight(1);
fill(191,66,4);
stroke(191,66,4);
beginShape();
vertex(300,500);
vertex(500,450);
vertex(300,600);
vertex(300,500);
endShape();
noFill();



//outter core
strokeWeight(1);
fill(118,99,79);
stroke(118,99,79);
beginShape();
vertex(300,600);
vertex(500,600);
vertex(500,600);
vertex(300,700);
vertex(300,600);
endShape();
noFill();
fill(0);
text("Liquid Nickle, Iron, and light weight elements.",480,660);

//outer core shadow
strokeWeight(1);
fill(70,47,37);
stroke(70,47,37);
beginShape();
vertex(300,600);
vertex(250,620);
vertex(250,620);
vertex(300,700);
vertex(300,600);
endShape();
noFill();


//inner core
strokeWeight(1);
fill(255,244,142);
stroke(255,244,142);
beginShape();
vertex(90,700);
vertex(380,700);
vertex(380,700);
vertex(300,750);
vertex(300,750);
vertex(90,700);
endShape();
noFill();

//innercore shadow
strokeWeight(1);
fill(211,178,11);
stroke(211,178,11);
beginShape();
vertex(380,700);
vertex(400,725);
vertex(400,725);
vertex(300,750);
vertex(300,750);
vertex(380,700);
endShape();
noFill();

fill(0);
text("Solid Nickle and Iron Crystals.",520,725);




