
//Colores
int globalRelleno = color(204,153,102);
int fondoPelo = color(0,0,0);
int bg = color(131,72,105);
int bgOjos = color(0,0,0);


//LA MADRE DE TODAS LAS VARIABLES
int tempo = 0;

void setup(){
size(700,700);
}

void draw(){
background(bg);
println(mouseX+","+mouseY);
println(tempo);    

//coordenadas base
//point(350,350); //centro
//point(128,358); //orejaIzquierda (128 exacto)
//point(572,358); //orejaDerecha (572 exacto)
//point(350,117); //cabezaTop
//point(350,600); //barbillaBot
//line(170,358,530,358); //ejeX
//line(350,117,350,600); //ejeY

//cabeza
fill(globalRelleno);
beginShape();
vertex(530,358);
vertex(530,390);
vertex(495,495);
vertex(465,559);
vertex(350,600);
vertex(235,559);
vertex(205,495);
vertex(170,390);
vertex(170,358);
vertex(170,185);
vertex(515,200);
vertex(530,358);
endShape();

//orejas
//derecha
fill(globalRelleno);
arc(530, 350, 50, 80, 0, HALF_PI);
arc(540, 295, 35, 30, PI+QUARTER_PI, TWO_PI);
line(554,350,557,295);
//rellenoOrejaDerecha
fill(globalRelleno);
noStroke();
beginShape();
vertex(557,295);
vertex(530,287);
vertex(530,350);
vertex(554,350);
vertex(557,295);
endShape();


//izquierda
stroke(#000000);
arc(170, 350, 50, 80, HALF_PI, PI);
arc(160, 295, 35, 30, PI, TWO_PI-QUARTER_PI);
line(144,350,141,295);
//rellenoOrejaDerecha
fill(globalRelleno);
noStroke();
beginShape();
vertex(143,294);
vertex(168,290);
vertex(170,350);
vertex(146,350);
vertex(143,294);
endShape();


//ojos
//ejeOjos line(172,285,527,285);
//centroOjo point(275,285);
fill(#FFFFFF);
ellipse(275, 285, 85, 35);
fill(bgOjos);
ellipse(275, 285, 35, 35);
fill(#FFFFFF);
ellipse(425, 285, 85, 35);
fill(bgOjos);
ellipse(425, 285, 35, 35);


//cejas
fill(fondoPelo);
triangle(225,265,320,275,235,245);
triangle(475,265,380,275,465,245);


//nariz
stroke(#000000);
line(345,315,350,330);
line(350,330,335,415);
line(335,415,345,425);
line(360,425,370,415);
line(335,425,325,415);


//perilla
fill(fondoPelo);
triangle(330,535,350,568,375,535);

if(tempo < 200){
fill(fondoPelo);
beginShape();
vertex(530,335);
vertex(476,223);
vertex(344,274);
vertex(359,261);
vertex(239,234);
vertex(262,224);
vertex(220,221);
vertex(170,335);
vertex(170,288);
vertex(122,175);
vertex(166,200);
vertex(123,78);
vertex(157,99);
vertex(125,34);
vertex(282,93);
vertex(257,52);
vertex(388,95);
vertex(382,66);
vertex(505,158);
vertex(505,135);
vertex(530,185);
vertex(530,335);
endShape();
}else if(tempo > 1){
fill(fondoPelo);
beginShape();
vertex(530,335);
vertex(random(470,480),random(218,227));
vertex(random(354,364),random(270,280));
vertex(random(354,364),random(255,267));
vertex(random(236,240),random(231,236));
vertex(random(260,264),random(221,226));
vertex(random(218,222),random(219,223));
vertex(random(167,172),random(332,337));
vertex(random(167,172),random(285,291));
vertex(random(119,124),random(171,176));
vertex(random(162,168),random(196,204));
vertex(random(120,124),random(75,81));
vertex(random(154,160),random(97,102));
vertex(random(122,127),random(30,37));
vertex(random(278,284),random(89,96));
vertex(random(254,263),random(48,56));
vertex(random(383,391),random(92,97));
vertex(random(379,384),random(63,69));
vertex(random(501,508),random(153,161));
vertex(random(501,508),random(131,138));
vertex(random(528,532),random(183,187));
vertex(random(528,532),random(332,337));
endShape();
}

  
//SUPERGUERREEEEEEEERR!!
  if(mousePressed && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  fill(255,255,255);
  rect(510,230,85,125);
  fill(255,0,0);
  rect(570,280,15,15);
  fill(0,140,0);
  rect(375,250,160,85); 
  tempo = tempo + 1;
  }
  fill(255,255,0);
  textSize(12);
  if(mousePressed && tempo > 200 && tempo < 1100 && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  text("My power is increasing...",385,265);
  }
  if(mousePressed && tempo > 480 && tempo < 1100 && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  text("It's reaching its limit...",385,280);
  }
  if(mousePressed && tempo > 720 && tempo < 1100 && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  text("It's over 9000!!",385,300);
  }
  if(mousePressed && tempo > 920 && tempo < 1100 && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  text("RELEASE THE POWER!!!!",385,320);
  text("LIBERA LA ENERGIA!!",490,90);
  }
  if(mousePressed && tempo > 1300 && 605 >= mouseX && mouseX >= 592 && 58 <= mouseY && mouseY <= 70){
  text("I'M ALREADY AT MY MAX",385,265);
  text("CAN'T CHARGE MORE",385,280);
  }
  
//Mouth gestures
  if(tempo >= 0 && tempo < 200){
  fill(#FFFFFF);
  beginShape();
  vertex(300,505);
  vertex(330,486);
  vertex(410,475);
  vertex(387,497);
  endShape();
  }else if(tempo <= 480 && tempo >= 200){
  fill(#FFFFFF);
  beginShape();
  vertex(310,505);
  vertex(315,495);
  vertex(310,482);
  vertex(295,483);
  vertex(345,475);
  vertex(400,457);
  vertex(395,450);
  vertex(400,457);
  vertex(407,487);
  vertex(398,520);
  vertex(310,505);
  endShape();
  line(404,472,392,495);
  line(392,495,386,480);
  line(386,480,380,488);
  line(380,488,315,495);
  }else if(tempo > 480 && tempo <= 720){
  fill(#FFFFFF);
  beginShape();
  vertex(310,505);
  vertex(315,495);
  vertex(310,482);
  vertex(295,483);
  vertex(345,475);
  vertex(400,457);
  vertex(395,450);
  vertex(400,457);
  vertex(407,487);
  vertex(398,520);
  vertex(310,505);
  endShape();
  fill(0,0,0);
  beginShape();
  vertex(312,487);
  vertex(401,465);
  vertex(407,487);
  vertex(402,510);
  vertex(313,500);
  vertex(315,495);
  vertex(312,487);
  endShape();
  fill(255,102,102);
  beginShape();
  vertex(407,488);
  vertex(341,502);
  vertex(400,509);
  vertex(407,488);
  endShape();
  }else if(tempo > 720){
  fill(0,0,0);
  beginShape();
  vertex(313,454);
  vertex(300,490);
  vertex(304,525);
  vertex(349,531);
  vertex(398,521);
  vertex(400,490);
  vertex(391,454);
  vertex(352,448);
  vertex(313,454);
  endShape();
  fill(#FFFFFF);
  beginShape();
  vertex(303,514);
  vertex(304,525);
  vertex(349,531);
  vertex(398,521);
  vertex(399,508);
  vertex(303,514);
  endShape();
  fill(#FFFFFF);
  beginShape();
  vertex(309,465);
  vertex(313,454);
  vertex(352,448);
  vertex(391,454);
  vertex(394,465);
  vertex(309,465);
  endShape();
  fill(255,102,102);
  beginShape();
  vertex(301,500);
  vertex(303,514);
  vertex(399,508);
  vertex(399,498);
  vertex(301,500);
  endShape();
  }

//Charging & resetting
//Charging
fill(102,0,204);
text("Pica y AGUANTA el mouse aquí para cargar energía",400,50);
ellipse(600, 65, 15, 15);
//Resetting
fill(255,128,0);
ellipse(600,630,15,15);
text("Click resetear tu poder!",500,600);

//Desgaste
  if(mousePressed && 605 >= mouseX && mouseX >= 592 && 621 <= mouseY && mouseY <= 635){
  tempo = 0;
  }


}
void mouseReleased(){


fondoPelo = color(255,255,0);
bg = color(random(255),random(255),random(255));
bgOjos = color(51,204,255);
}


