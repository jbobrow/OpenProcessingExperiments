
// Echo por: Marc Cabañas Garcia 1ºASIX(TARDA)
// Happy de Fairy Tail en movimiento

int fons=#56DB8C;
int cara=#4092C6;
int cola=#4092C6;
int brazo=#4092C6;
int mano=#4092C6;
int piernas=#4092C6;
int orejas=#4092C6;
int interiororejas=#C1677C;
int bigote=#4092C6;
int barriga=#4092C6;
int mejillas=#9FC5DE;
int ojos=#000000;
int nariz=#86501A;
int boca=#C1677C;


void setup() {
  size(600,600); 
  smooth();
}

void draw() {
  background(fons);
  print(mouseX);
  print(",");
  println(mouseY);

// Manos i Piernas

noFill();
stroke(brazo);
strokeWeight(30);
bezier(254,338,254,338,215,386,215,386);

noFill();
stroke(brazo);
strokeWeight(30);
bezier(343,342,343,342,387,386,387,386);

noFill();
stroke(piernas);
strokeWeight(30);
bezier(278,477,268,477,271,535,251,535);

noFill();
stroke(piernas);
strokeWeight(30);
bezier(326,477,330,477,330,535,350,535);

fill(mano);
stroke(#000000);
strokeWeight(2);
line(248,324,203,376);
line(245,372,230,389);
ellipse(216,386,30,30);
ellipse(208,391,8,mouseY/25);
ellipse(214,391,8,mouseY/25);
ellipse(220,391,8,mouseY/25);
ellipse(226,391,8,mouseY/25);

line(347,325,395,373);
line(353,374,373,391);
ellipse(386,386,30,30);
ellipse(378,391,8,mouseY/25);
ellipse(384,391,8,mouseY/25);
ellipse(390,391,8,mouseY/25);
ellipse(396,391,8,mouseY/25);

line(265,467,247,521);
line(286,486,275,533);
line(275,533,265,544);
ellipse(251,535,30,30);
ellipse(243,540,8,mouseY/25);
ellipse(249,540,8,mouseY/25);
ellipse(255,540,8,mouseY/25);
ellipse(261,540,8,mouseY/25);

line(314,484,322,528);
line(322,528,337,546);
line(335,465,352,520);
ellipse(349,535,30,30);
ellipse(341,540,8,mouseY/25);
ellipse(347,540,8,mouseY/25);
ellipse(353,540,8,mouseY/25);
ellipse(359,540,8,mouseY/25);

// Cola

noFill();
stroke(cola);
strokeWeight(30);
bezier(262,455,20,462,80,140,70,190);

stroke(#000000);
strokeWeight(2);
bezier(251,441,-20,422,140,30,55,210);
bezier(265,472,-30,458,80,99,60,190);

fill(#FFFFFF);
ellipse(70,184,30,100);

// Cuerpo

stroke(1);
strokeWeight(2);
fill(barriga);
ellipse(299,389,110,200);

fill(#FFFFFF);
ellipse(300,380,mouseX/7,190);

// Cara i Mejillas

fill(cara);
ellipse(300,230,200,220);

fill(mejillas);
ellipse(254,267,mouseX/25,mouseY/22);
ellipse(350,267,mouseX/25,mouseY/22);

// Ojos

fill(#FFFFFF);
ellipse(258,220,75,70);
ellipse(346,220,75,70);
fill(ojos);
ellipse(259,216,mouseX/13,mouseY/13);
ellipse(343,216,mouseX/13,mouseY/13);

// Boca y Nariz

fill(boca);
arc(302,280,mouseX/7,mouseY/7,0.15,2.99);
fill(80,mouseY+2,mouseX+2);
triangle(292,252,310,252,302,272);
line(302,283,302,272);
fill(bigote);
arc(281,272,50,40,0.45,2.65);
arc(324,272,50,40,0.45,2.65);

// Cejas y bigotes

line(275,154,289,164);
line(311,164,325,154);
line(367,285,400,290);
line(366,294,390,307);
line(230,285,200,290);
line(236,294,208,307);

// Orejas

fill(orejas);
triangle(207,189,275,124,207,mouseY/7);
triangle(327,124,392,192,392,mouseY/7);

fill(interiororejas);
triangle(210,180,245,145,210,mouseY/7);
line(240,150,214,110);
line(234,152,216,129);
line(227,156,216,147);
line(220,163,213,156);
line(215,171,212,168);
triangle(355,147,388,180,388,mouseY/7);
line(360,150,382,116);
line(368,154,383,131);
line(373,160,382,152);
line(380,167,386,162);
line(383,172,386,170);


}

// Pulsar mouse

void mousePressed(){
  fons=#000000;
  cara=#FAEE08;
  cola=#FAEE08;
  brazo=#FAEE08;
  mano=#FAEE08;
  piernas=#FAEE08;
  orejas=#FAEE08;
  interiororejas=#FF8D00;
  bigote=#FAEE08;
  barriga=#FAEE08;
  mejillas=#000000;
  ojos=#FF0000;
  nariz=#FF0000;
  boca=#FF8D00;  
  
}

// Soltar mouse

void mouseReleased(){
  fons=#57A044;
  cara=#4092C6;
  cola=#4092C6;
  brazo=#4092C6;
  mano=#4092C6;
  piernas=#4092C6;
  orejas=#4092C6;
  interiororejas=#C1677C;
  bigote=#4092C6;
  barriga=#4092C6; 
  mejillas=#9FC5DE; 
  ojos=#000000;
  nariz=#86501A;
  boca=#C1677C;
  

  
}

