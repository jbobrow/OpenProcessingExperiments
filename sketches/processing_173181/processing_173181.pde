
//nube3
float pxn1 = 855;
float pxn2 = 900;
float pxn3 = 945;
float incr = 0.15;
//nube2
float pxn21 = 1200;
float pxn22 = 1245;
float pxn23 = 1290;
float incr2 = 0.25; 
//nube3
float pxn31 = 1100;
float pxn32 = 1145;
float pxn33 = 1190;
float incr3 = 0.05; 
//lineas
float pxl1 = 142;
float pxl2 = 426;
float pxl3 = 710;
float incrl = 69;
//arbustos
float pxa1 = 84;
float pxa2 = 240;
float pxa3 = 412;
float pxa4 = 539;
float pxa5 = 720;
float pxa6 = 890;
float pxa7 = 990;
float pxa8 = 1100;
//float incrl = 69;la misma que linas


void setup(){
  size(1000, 600);
  frameRate(125);
}
 
void draw(){
background(153, 217, 234);
//sol
noStroke();
fill (247, 121, 9);
beginShape();
  vertex(1000, 0);
  vertex(900, 0);
  vertex(892, 27);
  vertex(913, 39);
  vertex(914, 64);
  vertex(938, 71);
  vertex(942, 95);
  vertex(968, 88);
  vertex(988, 103);
  vertex(1000, 96);
  endShape(CLOSE);
fill(255, 255, 0);
ellipse(999, 1, 150, 150);
//arbustos
noStroke();
fill (0, 128, 64);
ellipse (pxa1, 444, 300, 400);
ellipse (pxa2, 444, 300, 400);
ellipse (pxa3, 444, 300, 400);
ellipse (pxa4, 444, 300, 400);
ellipse (pxa5, 444, 300, 400);
ellipse (pxa6, 444, 300, 400);
ellipse (pxa7, 444, 300, 400);
ellipse (pxa8, 444, 300, 400);
//primero
 if(pxa1 + 150 > 0){
 pxa1 = pxa1 - incrl;
 }else{
 pxa1 = pxa1 + 1200;
 }
 //segundo
 if(pxa2 + 150 > 0){
 pxa2 = pxa2 - incrl;
 }else{
 pxa2 = pxa2 + 1200;
 }
 //tercero
 if(pxa3 + 150 > 0){
 pxa3 = pxa3 - incrl;
 }else{
 pxa3 = pxa3 + 1200;
 }
 //cuarto
 if(pxa4 + 150 > 0){
 pxa4 = pxa4 - incrl;
 }else{
 pxa4 = pxa4 + 1200;
 }
 //quinto
 if(pxa5 + 150 > 0){
 pxa5 = pxa5 - incrl;
 }else{
 pxa5 = pxa5 + 1200;
 }
 //sexto
 if(pxa6 + 150 > 0){
 pxa6 = pxa6 - incrl;
 }else{
 pxa6 = pxa6 + 1200;
 }
 //septimo
 if(pxa7 + 150 > 0){
 pxa7 = pxa7 - incrl;
 }else{
 pxa7 = pxa7 + 1200;
 }
 //optavo
 if(pxa8 + 150 > 0){
 pxa8 = pxa8 - incrl;
 }else{
 pxa8 = pxa8 + 1200;
 }
//carretera
fill(40);
rect (0, 450, 1000, 600);
//lineas carretera
fill(255);
rect(pxl1, 530, 142, 20);
rect(pxl2, 530, 142, 20);
rect(pxl3, 530, 142, 20);

 //primera linea primer if
 if(pxl1 + 142 > 0){
 pxl1 = pxl1 - incrl;
 }else{
 pxl1 = pxl1 + 1300;
 }
 //segunda linea segundo if
 if(pxl2 + 142 > 0){
 pxl2 = pxl2 - incrl;
 }else{
 pxl2 = pxl2 + 1300;
 }
  //tercer linea tercer if
 if(pxl3 + 142 > 0){
 pxl3 = pxl3 - incrl;
 }else{
 pxl3 = pxl3 + 1300;
 }


//coche
stroke (5);
//humo tubo
int i = 0;
float pX = 190;
float pY = 450;
float tamanyo = 15;
float basura = random(189,445); 
while (i < 25){
  noStroke();
  fill(basura, basura, basura, 20);

  ellipse(pX, pY, tamanyo, tamanyo);
  pX = pX - random(10);
  tamanyo = tamanyo + random(4);
  i = i + 1;
  }
//tubo
stroke(5);
fill(127, 127, 127);
rect (189, 445, 40, 12);
//nubes
//nube1
noStroke();
    fill(255);
    ellipse (pxn1, 150, 75, 50);
    ellipse (pxn2, 150, 90, 70);
    ellipse (pxn3, 150, 85, 60);
  
  if(pxn3 + 44 > 0 ){
   pxn1 = pxn1 - incr; 
   pxn2 = pxn2 - incr;
   pxn3 = pxn3 - incr;
  }else{
  pxn1 = pxn1 + 1300;
  pxn2 = pxn2 + 1300;
  pxn3 = pxn3 + 1300;
  }
//nube2
noStroke();
    fill(255);
    ellipse (pxn21, 80, 75, 50);
    ellipse (pxn22, 80, 90, 70);
    ellipse (pxn23, 80, 85, 60);
  
  if(pxn23 + 44 > 0 ){
   pxn21 = pxn21 - incr2; 
   pxn22 = pxn22 - incr2;
   pxn23 = pxn23 - incr2;
  }else{
  pxn21 = pxn21 + 1300;
  pxn22 = pxn22 + 1300;
  pxn23 = pxn23 + 1300;
  }
//nube3
 noStroke();
    fill(255);
    ellipse (pxn31, 110, 75, 50);
    ellipse (pxn32, 110, 90, 70);
    ellipse (pxn33, 110, 85, 60);
  
  if(pxn33 + 44 > 0 ){
   pxn31 = pxn31 - incr3; 
   pxn32 = pxn32 - incr3;
   pxn33 = pxn33 - incr3;
  }else{
  pxn31 = pxn31 + 1100;
  pxn32 = pxn32 + 1100;
  pxn33 = pxn33 + 1100;
  }
//base
 //ruedas *aqui para que queden debajo
  stroke(3);
noStroke();
    fill(0);
    float mvr = random (5);
    //rueda trasera
    ellipse (342, 461+mvr, 85, 85);
    fill (123);
    ellipse (342, 461+mvr, 55, 55);
    fill (0);
    ellipse (342, 461+mvr, 15, 15);
    fill (140);
    ellipse (342, 461+mvr, 10, 10);
    //rueda delantera
    fill(0);
    ellipse (635, 461+mvr, 85, 85);
    fill (123);
    ellipse (635, 461+mvr, 55, 55);
    fill (0);
    ellipse (635, 461+mvr, 15, 15);
    fill (140);
    ellipse (635, 461+mvr, 10, 10);
//coche
    stroke(6);
  fill(235, 0, 0);
  beginShape();
  vertex(208, 400);
  vertex(208, 465);
  vertex(300, 465);
  vertex(325, 433);
  vertex(365, 433);
  vertex(390, 465);
  vertex(590, 465);
  vertex(615, 433);
  vertex(655, 433);
  vertex(680, 465);
  vertex(810, 465);
  vertex(810, 400);
  vertex(700, 400);
  vertex(590, 290);
  vertex(300, 290);
  vertex(250, 400);
  endShape(CLOSE);
//detalles
//luz trasera
fill(255, 128, 0);
rect(208, 410, 20 ,20);
//luz delantera
fill(255, 255, 0);
rect(810, 410, -20 ,20);
//cristal delantero
fill(153, 217, 234); //para todos los cristales
  beginShape();
  vertex(595, 295);
  vertex(597, 390);
  vertex(689, 390);
  endShape(CLOSE);
//cristal trasero2
rect(320, 300, 105, 90);
//crsital delantero2
rect(465, 300, 105, 90);
//cristal trasero
  beginShape();
  vertex(297, 295);
  vertex(297, 390);
  vertex(254, 390);
  endShape(CLOSE);
  //base antena
     
strokeWeight(2);
  fill(0);
  rect(449, 282, 5, 7);
//antena
float mva = random(5); 
line (450, 286, 371, 264+mva);






}


