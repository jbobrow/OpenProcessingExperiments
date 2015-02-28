
//Potser aquest cop he pecat de falta d'originalitat, però el meu repte
//ha estat fer un tauler de dibuix que pogués fer accions similars al
//Paint de Windows, poguent-ne canviar gruixos, colors, formes, etc.

//El boleà "neteja" esborra tot el progrés realitzat fins al moment.
boolean neteja = false;
//El boleà "dibuixar" varia entre el moviment sense traç de dibuix (false)
//i el moviment amb traç de dibuix (true).
boolean dibuixar = false;
//Permet dibuixar línies. Per defecte està activat.
boolean linia = true;
//Permet dibuixar triangles.
boolean triangles = false;
//Permet dibuixar cercles.
boolean cercle = false;
//Permet dibuixar triangles.
boolean quadrat = false;
//Permet dibuixar estrelles.
boolean estrella = false;
//L'enter "gruix" varia les dimensions de les línies o els contorns.
int gruix = 4;
//L'enter "mida" varia les dimensions de les figures.
int mida = 21;
//L'enter "interior" modifica el color intern de la forma o traç escollit. 
int interior = color(0,0,0);
//L'enter "contorn" modifica el color de les línies i els marges de les formes.
int contorn = color(0,0,0);

//Les dimensions són 600x600 i, per defecte, el fons és blanc.
void setup(){
  size(600,600);
  background(255,255,255);
}

void draw(){
  //Si es compleix "neteja", es sobreposa el fons blanc per eliminar el
  //progrés realitzat.
  if (neteja) {
    background(255,255,255);
  }
  //Si es compleix "dibuixar" i sota la y=50 (per no escriure sota la barra
  //d'eines i edició), es faran traços, amb els següents valors per defecte:
  //forma = línia, interior = negre, contorn, = negre, gruix = 4, mida = 21.
  //Figura = línia.
  if (dibuixar && mouseY >= 50 && linia) {
    strokeWeight(gruix);
    stroke(contorn);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  //Figura = triangle.
  if (dibuixar && mouseY >= 50 && triangles) {
    strokeWeight(gruix);
    stroke(contorn);
    fill(interior);
    triangle (mouseX - mida, mouseY + mida/2, mouseX, mouseY - mida, mouseX + mida, mouseY + mida/2);
  }
  //Figura = cercle.
  if (dibuixar && mouseY >= 50 && cercle) {
    strokeWeight(gruix);
    stroke(contorn);
    fill(interior);
    ellipse (mouseX, mouseY, mida, mida);
  }
  //Figura = quadrat.
  if (dibuixar && mouseY >= 50 && quadrat) {
    strokeWeight(gruix);
    stroke(contorn);
    fill(interior);
    rect(mouseX - mida/2, mouseY - mida/2, mida, mida);
  }
  //Figura = estrella.
  if (dibuixar && mouseY >= 50 && estrella) {
    strokeWeight(gruix);
    stroke(contorn);
    fill(interior);
    beginShape();
      vertex(mouseX,mouseY - mida);
      vertex(mouseX + mida/3, mouseY - mida/3);
      vertex(mouseX + mida, mouseY - mida/3);
      vertex(mouseX + mida/2, mouseY + mida/3);
      vertex(mouseX + (2 * mida) / 3, mouseY + mida);
      vertex(mouseX, mouseY + mida/2);
      vertex(mouseX - (2 * mida) / 3, mouseY + mida);
      vertex(mouseX - mida/2, mouseY + mida/3);
      vertex(mouseX - mida, mouseY - mida/3);
      vertex(mouseX - mida/3, mouseY - mida/3);
      vertex(mouseX, mouseY - mida);
    endShape();
  }
  //Definint la barra superior d'eines i edició
  //Disseny dels marcs.
  strokeWeight(3);
  stroke(0,0,0);
  fill(200,200,200);
  rect(0,0,600,50);
  line(260,0,260,50);
  line(340,0,340,50);
  //Texts informatius.
  fill(0,0,0);
  text("intern: ",10,20);
  text("contorn: ",8,40);
  //Indica en tot moment el gruix del contorn amb el qual es traça.
  //Atenció! La línia es considera contorn.
  text("gruix: " + gruix,278,20);
  text("mida: " + mida,278,40);
  text("figura: ",350,30);
  strokeWeight(2);
  //Colors interiors.
  rect(50,10,10,10);
  fill(255,0,0);
  rect(68,10,10,10);
  fill(0,0,255);
  rect(86,10,10,10);
  fill(0,255,0);
  rect(104,10,10,10);
  fill(255,255,0);
  rect(122,10,10,10);
  fill(255,0,255);
  rect(140,10,10,10);
  fill(0,255,255);
  rect(158,10,10,10);
  fill(120,0,120);
  rect(176,10,10,10);
  fill(255,120,0);
  rect(194,10,10,10);
  fill(150,150,150);
  rect(212,10,10,10);
  fill(255,255,255);
  rect(230,10,10,10);
  //Colors de contorn.
  fill(0,0,0);
  rect(56,30,10,10);
  fill(255,0,0);
  rect(74,30,10,10);
  fill(0,0,255);
  rect(92,30,10,10);
  fill(0,255,0);
  rect(110,30,10,10);
  fill(255,255,0);
  rect(128,30,10,10);
  fill(255,0,255);
  rect(146,30,10,10);
  fill(0,255,255);
  rect(164,30,10,10);
  fill(120,0,120);
  rect(182,30,10,10);
  fill(255,120,0);
  rect(200,30,10,10);
  fill(150,150,150);
  rect(218,30,10,10);
  fill(255,255,255);
  rect(236,30,10,10);
  //Figura seleccionada.
  rect(390,10,30,30);
  rect(430,10,30,30);
  rect(470,10,30,30);
  rect(510,10,30,30);
  rect(550,10,30,30);
  stroke(0,0,255);
  line(395,35,415,15);
  stroke(255,0,0);
  triangle(435,35,445,15,455,35);
  stroke(0,255,0);
  ellipse(485,25,20,20);
  stroke(255,120,0);
  rect(515,15,20,20);
  stroke(180,180,0);
  beginShape();
    vertex(554,22);
    vertex(562,22);
    vertex(565,15);
    vertex(568,22);
    vertex(576,22);
    vertex(570,27);
    vertex(573,34);
    vertex(565,29);
    vertex(557,34);
    vertex(560,27);
    vertex(554,22);
  endShape();
  //Rectangle groc que t'indica el teu color o figura actual.
  //Rectangle del color intern.
  stroke(255,255,0);
  noFill();
  if (interior == color(0,0,0)) {
    rect(48,8,14,14);
  }
  if (interior == color(255,0,0)) {
    rect(66,8,14,14);
  }
  if (interior == color(0,0,255)) {
    rect(84,8,14,14);
  }
  if (interior == color(0,255,0)) {
    rect(102,8,14,14);
  }
  if (interior == color(255,255,0)) {
    rect(120,8,14,14);
  }
  if (interior == color(255,0,255)) {
    rect(138,8,14,14);
  }
  if (interior == color(0,255,255)) {
    rect(156,8,14,14);
  }
  if (interior == color(120,0,120)) {
    rect(174,8,14,14);
  }
  if (interior == color(255,120,0)) {
    rect(192,8,14,14);
  } 
  if (interior == color(150,150,150)) {
    rect(210,8,14,14);
  }
  if (interior == color(255,255,255)) {
    rect(228,8,14,14);
  }
  //Rectangle del color del contorn.
  if (contorn == color(0,0,0)) {
    rect(54,28,14,14);
  }
  if (contorn == color(255,0,0)) {
    rect(72,28,14,14);
  }  
  if (contorn == color(0,0,255)) {
    rect(90,28,14,14);
  }
  if (contorn == color(0,255,0)) {
    rect(108,28,14,14);
  }
  if (contorn == color(255,255,0)) {
    rect(126,28,14,14);
  } 
  if (contorn == color(255,0,255)) {
    rect(144,28,14,14);
  }
  if (contorn == color(0,255,255)) {
    rect(162,28,14,14);
  }
  if (contorn == color(120,0,120)) {
    rect(180,28,14,14);
  }
  if (contorn == color(255,120,0)) {
    rect(198,28,14,14);
  }
  if (contorn == color(150,150,150)) {
    rect(216,28,14,14);
  }
  if (contorn == color(255,255,255)) {
    rect(234,28,14,14);
  }
  //Rectangle de la figura seleccionada.
  if (linia) {
    rect(388,8,34,34);
  }  
  if (triangles) {
    rect(428,8,34,34);
  }
  if (cercle) {
    rect(468,8,34,34);
  }
  if (quadrat) {
    rect(508,8,34,34);
  }
  if (estrella) {
    rect(548,8,34,34);
  }   
}

void mousePressed(){
  //Mentre cliques, dibuixes.
  dibuixar = true;
  //Definint els canvis de colors interiors a la barra d'eines i edició segons
  //el requadre de color on cliques.
  if (mouseX > 50 && mouseX < 60 && mouseY > 10 && mouseY < 20) {
    interior = color(0,0,0);
  }
  if (mouseX > 68 && mouseX < 78 && mouseY > 10 && mouseY < 20) {
    interior = color(255,0,0);
  }
  if (mouseX > 86 && mouseX < 96 && mouseY > 10 && mouseY < 20) {
    interior = color(0,0,255);
  }
  if (mouseX > 104 && mouseX < 114 && mouseY > 10 && mouseY < 20) {
    interior = color(0,255,0);
  }
  if (mouseX > 122 && mouseX < 132 && mouseY > 10 && mouseY < 20) {
    interior = color(255,255,0);
  }
  if (mouseX > 140 && mouseX < 150 && mouseY > 10 && mouseY < 20) {
    interior = color(255,0,255);
  }
  if (mouseX > 158 && mouseX < 168 && mouseY > 10 && mouseY < 20) {
    interior = color(0,255,255);
  }
  if (mouseX > 176 && mouseX < 186 && mouseY > 10 && mouseY < 20) {
    interior = color(120,0,120);
  }
  if (mouseX > 194 && mouseX < 204 && mouseY > 10 && mouseY < 20) {
    interior = color(255,120,0);
  }
  if (mouseX > 212 && mouseX < 222 && mouseY > 10 && mouseY < 20) {
    interior = color(150,150,150);
  }
  if (mouseX > 230 && mouseX < 240 && mouseY > 10 && mouseY < 20) {
    interior = color(255,255,255);
  }
  //Definint els canvis de colors de contorn a la barra d'eines i edició segons
  //el requadre de color on cliques.
  if (mouseX > 56 && mouseX < 66 && mouseY > 30 && mouseY < 40) {
    contorn = color(0,0,0);
  }
  if (mouseX > 74 && mouseX < 84 && mouseY > 30 && mouseY < 40) {
    contorn = color(255,0,0);
  }
  if (mouseX > 92 && mouseX < 102 && mouseY > 30 && mouseY < 40) {
    contorn = color(0,0,255);
  }
  if (mouseX > 110 && mouseX < 120 && mouseY > 30 && mouseY < 40) {
    contorn = color(0,255,0);
  }
  if (mouseX > 128 && mouseX < 138 && mouseY > 30 && mouseY < 40) {
    contorn = color(255,255,0);
  }
  if (mouseX > 146 && mouseX < 156 && mouseY > 30 && mouseY < 40) {
    contorn = color(255,0,255);
  }
  if (mouseX > 164 && mouseX < 174 && mouseY > 30 && mouseY < 40) {
    contorn = color(0,255,255);
  }
  if (mouseX > 182 && mouseX < 192 && mouseY > 30 && mouseY < 40) {
    contorn = color(120,0,120);
  }
  if (mouseX > 200 && mouseX < 210 && mouseY > 30 && mouseY < 40) {
    contorn = color(255,120,0);
  }
  if (mouseX > 218 && mouseX < 228 && mouseY > 30 && mouseY < 40) {
    contorn = color(150,150,150);
  }
  if (mouseX > 236 && mouseX < 246 && mouseY > 30 && mouseY < 40) {
    contorn = color(255,255,255);
  }
  //Definint els canvis de figura a la barra d'eines i edició segons
  //el requadre de forma on cliquis.
  if (mouseX > 390 && mouseX < 420 && mouseY > 10 && mouseY < 40) {
    linia = true;
    triangles = false;
    cercle = false;
    quadrat = false;
    estrella = false;
  }
  if (mouseX > 430 && mouseX < 460 && mouseY > 10 && mouseY < 40) {
    linia = false;
    triangles = true;
    cercle = false;
    quadrat = false;
    estrella = false;
  }
  if (mouseX > 470 && mouseX < 500 && mouseY > 10 && mouseY < 40) {
    linia = false;
    triangles = false;
    cercle = true;
    quadrat = false;
    estrella = false;
  }
  if (mouseX > 510 && mouseX < 540 && mouseY > 10 && mouseY < 40) {
    linia = false;
    triangles = false;
    cercle = false;
    quadrat = true;
    estrella = false;
  }
  if (mouseX > 550 && mouseX < 580 && mouseY > 10 && mouseY < 40) {
    linia = false;
    triangles = false;
    cercle = false;
    quadrat = false;
    estrella = true;
  }
}

void mouseReleased(){
  //Si no cliques, no dibuixes.
  dibuixar = false;
}

void keyPressed(){
  //Amb la barra esborres el progrés realitzat.
  if (key == ' ') {
    neteja = true;
  }
  //Els augments i disminucions són de 2 per fer més pràctics i més
  //notable els canvis.
  //Amb la tecla '+', augmentes el gruix de la línia o els contorns,
  //sense que aquest valor sigui major a la mida (ja que no té sentit
  //que el contorn sigui més ample que la mida de la figura).
  if (key == '+' && gruix < 50 && mida - 2 > gruix) {
    gruix = gruix + 2;
  }
  //Amb la tecla '-', disminueixes el gruix de la línia o els contorns.
  if (key == '-' && gruix > 1) {
    gruix = gruix - 2;
  }
  //Amb la tecla '.', augmentes la mida de la figura.
  if (key == '.' && mida < 499) {
    mida = mida + 2;
  }
  //Amb la tecla ',', disminueixes la mida de la figura.
  if (key == ',' && mida > 1 && mida - 2 > gruix) {
    mida = mida - 2;
  } 
}

void keyReleased(){
  //Si es deixa de pulsar la barra, es deixa d'aplicar la "neteja".
  if (key == ' ') {
    neteja = false;
  }
}


