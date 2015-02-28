
void setup(){
  size (600,600);
}

void draw() {
  background (#000000);
  fill (#FCD0B4);
  //orelles
  noStroke();
  fill (#FCD0B4);
  ellipse(124,310,20,90);
  ellipse(476,310,20,90);
  fill(#000000);
  ellipse(125,310,5,20);
  ellipse(475,310,5,20);
  //cara
  fill (#FCD0B4);
  ellipse (300,300, 350, 500);
  //ulls
  fill(#FFFFFF);
  stroke(#000000);
  ellipse(220,265,70,60);
  ellipse(385,265,70,60);
  fill(#0070B8);
  ellipse(220,265,35,30);
  ellipse(385,265,35,30);
  fill(#000000);
  ellipse(220,265,23,18);
  ellipse(385,265,23,18);
  //boca
  fill(#FFFFFF);
  arc(300, 420, 130, 80, 0, PI, OPEN);
  line(235,419,365,419);
  //Celles
  stroke(#480C0C);
  fill(#480C0C);
  //Cella esquerra (de esquerra a dreta)
  triangle(187,205,205,218,161,238);
  triangle(187,205,205,218,234,205);
  triangle(205,218,234,205,254,212);
  triangle(230,215,254,212,260,223);
  //cella dreta (de dreta a esquerra
  triangle(340,223,346,212,370,215);
  triangle(346,212,366,205,397,218);
  triangle(413,205,397,218,366,205);
  triangle(397,218,413,205,439,238);
  //nas
  stroke(#000000);
  line(290,291,285,334);
  line(310,291,315,334);
  noFill();
  arc(300, 340, 60, 60,PI,PI+QUARTER_PI);
  arc(300, 340, 60, 60,TWO_PI-0.75,TWO_PI+PI);
  fill (#FCD0B4);
  noStroke();
  rect(252,349,100,50);
  stroke(#000000);
  noFill();
  arc(300, 343, 40, 30,TWO_PI,TWO_PI+PI);
  //Cabell
  noFill();
  arc(300, 400, 500,540,QUARTER_PI,TWO_PI);
  noStroke();
  //correccions
  fill(#000000);
  rect(100,27,400,100);
  triangle(143,188,138,113,246,121);
  triangle(457,188,462,113,354,121);
  fill(#480C0C);
  stroke(#480C0C);
  //Part esquerra
  triangle(143,188,164,143,182,161);
  triangle(164,143,182,161,198,97);
  triangle(182,161,236,138,300,91);
  triangle(182,161,198,97,300,91);
  triangle(198,97,300,91,227,73);
  triangle(300,91,300,129,236,138);
  triangle(262,56,227,73,300,91);
  triangle(300,50,300,91,262,56);
  //part dreta
  triangle(300,50,300,91,338,56);
  triangle(338,56,373,73,300,91);  
  triangle(300,91,300,129,364,138);
  triangle(402,97,300,91,373,73);  
  triangle(418,161,402,97,300,91);
  triangle(418,161,364,138,300,91);
  triangle(436,143,418,161,402,97);
  triangle(457,188,436,143,418,161);
  //Perilla esquerra
  triangle(261,482,231,531,265,548);
  triangle(261,482,265,548,300,510);
  //perilla dreta
  triangle(339,482,369,531,335,548);  
  triangle(339,482,335,548,300,510);
  //Perilla centre
  triangle(300,510,335,548,265,548);
  triangle(300,555,335,548,265,548);
}
