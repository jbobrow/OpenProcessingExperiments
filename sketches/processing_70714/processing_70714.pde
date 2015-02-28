

size(325,325);//dimensions of window
background(255);//RGB background color
strokeCap(SQUARE);//Edges
stroke(0);//Stoke Color(pencil)

            //Variables//
//lines bottom right next to blue box
strokeWeight(4);
int a = 185;
int b = 280;
int c = 115;

line(a, b, a+c, b);
line(a, b+0, a-c+40, b+0);





//Rectangle RED
smooth();
strokeWeight(0);
fill(227,79,51);//Rectangle Color
rect(35,40,150,150);//Simple Rectangle

//Rectangle BLACK
smooth();
strokeWeight(0);
fill(11,17,17);//Rectangle Color
rect(35,190,75,70);//Simple Rectangle

//Rectangle Yellow Top right
smooth();
strokeWeight(0);
fill(252,214,105);
rect(185,0,118,120);

//Rectangle Yellow Bottom left
smooth();
strokeWeight(0);
fill(252,214,105);
rect(0,222,35,90);


//Blue box
smooth();
strokeWeight(0);
fill(6,64,122);
rect(185,225,115,55);

//Red Box bot right
smooth();
strokeWeight(0);
fill(227,79,51);
rect(300,223,200,90);


//Black Box middle
beginShape();
fill(11,17,17);
vertex(110,260);
vertex(185, 260);
vertex(185, 280);
vertex(110, 280);
endShape(CLOSE);

//Horizonal Lines
strokeWeight(5);
line(35,190,299,190);
line(315,225,10,225);
line(185,260,35,260);
line(299,40,10,40);
line(188,120,299,120);
line(35,120,10,120);

//Vertical Lines
strokeWeight(5);
line(300,300,300,10);
line(187,280,187,5);
line(72,38,72,10);
line(33,300,33,42);
line(72,259,72,192);
line(110,190,110,300);


