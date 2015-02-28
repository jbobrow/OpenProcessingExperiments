
void setup(){
  size(700,700);
  background(#834869);
}

void draw(){
println(mouseX+","+mouseY);

//coordenadas base
//point(350,350); //centro
//point(128,358); //orejaIzquierda (128 exacto)
//point(572,358); //orejaDerecha (572 exacto)
//point(350,117); //cabezaTop
//point(350,600); //barbillaBot
//line(170,358,530,358); //ejeX
//line(350,117,350,600); //ejeY

//cabeza
fill(#CC9966);
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
vertex(530,185);
vertex(530,358);
endShape();

//orejas
//derecha
fill(#CC9966);
arc(530, 350, 50, 80, 0, HALF_PI);
arc(540, 295, 35, 30, PI+QUARTER_PI, TWO_PI);
line(554,350,557,295);
//rellenoOrejaDerecha
fill(#CC9966);
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
//rellenoOrejaIzquierda
fill(#CC9966);
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
fill(#33CCFF);
ellipse(275, 285, 35, 35);
fill(#FFFFFF);
ellipse(425, 285, 85, 35);
fill(#33CCFF);
ellipse(425, 285, 35, 35);


//cejas
fill(#000000);
triangle(225,265,320,275,235,245);
triangle(475,265,380,275,465,245);


//nariz
stroke(#000000);
line(345,315,350,330);
line(350,330,335,415);
line(335,415,345,425);
line(360,425,370,415);
line(335,425,325,415);

//boca
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
//dientes
line(404,472,392,495);
line(392,495,386,480);
line(386,480,380,488);
line(380,488,315,495);

//perilla
fill(#000000);
triangle(330,535,350,568,375,535);


//pelo
fill(#000000);
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
  
}




