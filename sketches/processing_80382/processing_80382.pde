
size(425,500);
background(255);

//première ligne
//1
strokeWeight(3);
ellipse(100, 100, 80, 80);
line(120, 65, 65, 120);
line(105, 60, 60, 105);
line(93, 93, 127, 128);
line(84, 102, 116, 135);

//2
ellipse(210, 100, 80, 80);
line(210, 100, 210, 60);
line(170, 100, 250, 100);
line(210, 100, 191, 135);

//3
ellipse(320, 100, 80, 80);
line(320, 100, 353, 80);
line(320, 100, 353, 120);


//Premiere Déclinaison de traits
//4
strokeWeight(5);
ellipse(100, 210, 80, 80);
line(110, 174, 64, 220);
line(90, 215, 70, 235);
line(91, 216, 120, 243);

//5
ellipse(210, 210, 80, 80);
line(210, 210, 210, 170);
line(210, 210, 250, 210);

//6
ellipse(320, 210, 80, 80);
line(320, 210, 353, 187);
line(320, 210, 353, 230);
point(325, 190);


//Troisième déclinaison, simplification ou transformation de la forme
strokeWeight(9);
//7
ellipse(100, 320, 80, 80);
line(64, 322, 105, 285);
line(70, 340, 87, 325);

//8
ellipse(210, 320, 80, 80);
line(210, 320, 190, 354);
line(210, 320, 175, 320);

//9
ellipse(320, 320, 80, 80);
line(321, 321, 353, 300);
line(321, 321, 353, 342);
point(320, 300);
noStroke();{
triangle(330, 322, 365, 297, 365, 345); }
