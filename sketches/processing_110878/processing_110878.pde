
size(640,480);
background(246,231,212);

//coral square
fill(252,111,101);
noStroke();
quad(425,108, 544,108, 544,226, 425,226);

//blue circle
fill(176,196,194,127);
ellipse(430,370,370,370);

//coral rectangle
noStroke();
fill(252,111,101);
quad(104,463, 425,463, 425,480, 104,480);

//5 lines under circle
strokeWeight(5);
stroke(1);
line(353,402, 353,461);
line(366,400, 366,461);
line(378,402, 378,461);
line(390,360, 390,461);
line(402,360, 402,461);


noStroke();

//white circle
fill(255);
ellipse(353,364, 98,98);

quad(459,363, 474,390, 474,419, 436,362);
fill(0);
quad(473,369, 479,369, 479,441, 473,441);

//triangle
fill(0);
triangle(362,198, 460,363, 247,360);

//3 lines under triangle
stroke(1);
strokeWeight(3);
line(474,387, 456,362);
line(474,402, 446,362);
line(474,417, 437,362);

//line
stroke(1);
strokeWeight(2);
line (58,396, 58,480);

//3 lines coral rectangle
strokeWeight(4);
line (212,464, 212,480);
line (263,464, 263,480);
line (317,464, 317,480);

//3 lines coral rectangle
strokeWeight(1);
line (436,45, 448,45);
line (436,55, 448,55);
line (436,65, 448,65);
line (436,75, 448,75);
line (436,85, 448,85);
line (436,95, 448,95);

//zigzag line
beginShape();
vertex(82,480);
vertex(82,444);
vertex(286,444);
vertex(217,337);
vertex(320,192);
vertex(320,29);
vertex(332,12);
vertex(332,195);
vertex(233,335);
vertex(316,463);
vertex(106,463);
vertex(106,480);
// etc;
endShape(CLOSE);

//feather
beginShape();
vertex(154,447);
vertex(154,348);
vertex(122,387);
vertex(122,363);
vertex(154,321);
vertex(154,309);
vertex(122,348);
vertex(122,316);
vertex(154,277);
vertex(154,262);
vertex(122,303);
vertex(122,274);
vertex(164,208);
vertex(164,447);
// etc;
endShape(CLOSE);

//quad
quad(190,451, 190,178, 211,145, 217,448);

//triangle
triangle(184,444, 240,373, 289,447);

//stroke
strokeWeight(7);
line(327,22, 266,106);
line(327,76, 260,165);
line(330,17, 380,86);

//black by coral square
quad(428,105, 428,48, 434,48, 434,105);

ellipse(265,111, 20,20);
ellipse(258,170, 20,20);
ellipse(383,92, 20,20);

//wavy line
noFill();
strokeWeight(4);
arc(381, 108, 25, 25, 0,radians(180));
arc(407, 113, 30, 25, PI, TWO_PI);




