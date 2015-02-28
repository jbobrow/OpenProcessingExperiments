
float y;

void setup() {
     size(640, 480);
       y =height+150;
    }
    void draw() {

  int a=255-mouseY;
  int b=179; 



  colorMode(HSB);
  background (156,a,b);
  
  stroke(255); 
y = y - 0.2; 
  if (y < -100) { y = height+200; } 


noStroke();

  fill(43,255,198);
ellipse(mouseX-40,mouseY-40,80,80);

fill(255);
ellipse(y-19,101,18,18);
ellipse(y-9,78,34,34);
ellipse(y-3,87,40,40);
ellipse(y+12,65,35,35);
ellipse(y+23,97,31,31);
ellipse(y+33,67,38,38);
ellipse(y+42,87,40,40);
ellipse(y+56,78,34,34);
ellipse(y+77,101,18,18);

ellipse(y+81,61,18,18);
ellipse(y+91,38,34,34);
ellipse(y+97,47,40,40);
ellipse(y+112,25,35,35);
ellipse(y+123,57,31,31);
ellipse(y+133,27,38,38);
ellipse(y+142,47,40,40);
ellipse(y+156,38,34,34);
ellipse(y+177,61,18,18);
  

  fill(68,a+50,96);
  rect(0, 302, 640, 180); //grama
 
  stroke(1);
  fill(50);
quad(-1, 370, 640, 390, 640, 377, -1, 355); //passeio


noStroke();
fill(85,a+170,84);
ellipseMode(CORNER);
ellipse(20, 211, 50, 50); //folhas da árvore
ellipse(-1, 105, 50, 50);
ellipse(100, 115, 50, 50);
ellipse(157, 200, 50, 50);
ellipse(190, 110, 50, 50);
ellipse(132, 38, 50, 50);

stroke(0);
line(82, 258, 0, 158); //galhos da árvore
line(45, 237, 74, 161);
line(0, 192, 50, 108);
line(42, 134, 0, 94);
line(125, 210, 121, 87);
line(134, 140, 75, 82);
line(117, 102, 172, 52);
line(205, 171, 224, 108);
line(230, 144, 187, 105);
line(110, 241, 194, 217);
line(155, 220, 185, 238);

  fill(0,105,58);
beginShape(); //tronco da árvore
vertex(65, 432);
vertex(112, 432);
vertex(94, 268);
vertex(162, 184);
vertex(218, 172);
vertex(210, 160);
vertex(148, 177);
vertex(75, 265);
vertex(65, 432);
endShape(CLOSE);
  
  //a estufa começa aqui
  
  noFill();
  arc(361, 157, 93, 93, radians(180), radians(360), OPEN);  
  arc(432, 157, 93, 93, radians(180), radians(360), OPEN);
  arc(498, 157, 93, 93, radians(180), radians(360), OPEN);
  
  arc(319, 252, 93, 93, radians(180), radians(360), OPEN);
  arc(386, 252, 93, 93, radians(180), radians(360), OPEN);
  arc(463, 252, 93, 93, radians(180), radians(360), OPEN);
  arc(543, 252, 93, 93, radians(180), radians(360), OPEN);

 arc(318, 204, 93, 93, radians(180), radians(270), OPEN);
 arc(540, 204, 93, 93, radians(270), radians(360), OPEN);
 
    line(366,181,585,181);
 line(362,204,540,204); //horizontais de cima pra baixo
   line(318,250,570,250);
   
   line(318,250,318,300); //verticais, da esq. pra dir.
  line(361,204,361,300);
    line(432,204,432,300);
            line(454,204,454,300);
            line(498,204,498,300);
        line(525,204,525,300);

//ninho
noFill();
beginShape();
vertex(140, 433);
vertex(156, 428);
vertex(164, 409);
vertex(173, 420);
vertex(186, 412);
vertex(192, 420);
vertex(199, 430);
vertex(221, 433);
vertex(221, 423);
vertex(229, 427);
vertex(233, 422);
vertex(233, 434);
vertex(263, 440);
endShape();

//quero-querinho


      noStroke();
    fill(0,255,192);
    triangle(214,419,221,413,214,415);
    fill(128);
    arc(198,412, 15, 15, radians(-10), radians(150));
  ellipse(209, 414, 7, 7);
  stroke(0,255,64);
  strokeWeight(3);
  point(212,417);
  
  //quero-quero
 
noStroke();
fill(255);
triangle(130,382,161,377,157,361);
fill(0);
beginShape();
vertex(155, 375);
vertex(161, 377);
vertex(171, 368);
vertex(170, 362);
vertex(172, 354);
vertex(157, 361);
vertex(154, 365);
endShape();
fill(153);
beginShape();
vertex(125, 375);
vertex(146, 377);
vertex(157, 362);
vertex(166, 370);
vertex(170, 366);
vertex(168, 360);
vertex(172, 353);
vertex(164, 352);
vertex(159, 359);
endShape();
  stroke(0,255,64);
  strokeWeight(3);
  point(165,357);
  noStroke();
     fill(0,255,153);
    triangle(169,359,176,362,171, 355);
  stroke(0);
    strokeWeight(1);
  line(153,402,147,386);
    line(147,386,151,377);
    line(143,402,143,382);
    line(143,382,148,377);
    }

