
//COMENTARIOS
/*Diego pruebalo en processing porque la pagina no me respeta unas transparencias de uns circulos
si te fijas cuando colocas "run" va desde una trasparencia al blanco
gracias*/


//El Seteo
void setup() {
   size(1000,700);
   background(0);
   stroke(200);
   strokeCap(SQUARE);
   smooth();
  
}

// La seccion de Dibujo
void draw () {
   // lineas fondo verticales
  for(int w =0; w <= 1000; w = w + 20) {
line(w, 350, w, 0);
}// sector superior izquierdo
 for(int w =0; w <= 1000; w = w + 30) {
line(w, 350, w, 700);
}//sector inferior izquierdo
stroke(100);
for(int w =0; w <= 1000; w = w + 20) {
line(w, 700, w, 350);
}//sector inferior derecho
for(int w =0; w <= 1000; w = w + 30) {
line(w, 0, w, 350);
}//sector superior derecho

//lineas fondo horizontales
stroke(100);
for(int w =0; w <= 1000; w = w + 20) {
line(0, w, 1000, w);
}
 for(int w =0; w <= 1000; w = w + 30) {
line(0,w,0,w);
}
  
//triangulos
    fill(0);
  triangle(500,350,360,200,400,335);
  triangle(530,330,635,252,621,152);
  triangle(506,376,455,569,429,440);
  triangle(540,368,695,443,789,410);
  triangle(461,362,318,318,257,386);
  triangle(512,344,440,177,461,84);
  triangle(530,389,693,449,704,558);
  triangle(468,378,381,473,219,437);
  triangle(519,366,687,251,803,273);
  triangle(695,293,719,189,848,153);
  triangle(433,309,233,268,158,191);
  triangle(377,425,240,577,123,583);
  triangle(666,486,765,603,881,581);
  triangle(529,26,454,48,360,14);
  triangle(295,220,155,239,53,15);
  triangle(754,211,925,177,981,94);
  triangle(221,559,170,646,94,643);
  triangle(452,452,443,600,551,666);
  triangle(785,584,885,644,951,624);

// circunferencias centrales
fill(255,1);
strokeWeight(3);
stroke(255);
ellipse(500, 350, 1100, 1100);
  ellipse(500, 350, 1000, 1000);
  ellipse(500, 350, 950, 950);
  ellipse(500, 350, 900, 900);
  ellipse(500, 350, 700, 700);
  ellipse(500, 350, 550, 550);
  stop();
  ellipse(500, 350, 800, 800);
  ellipse(500, 350, 600, 600);
  ellipse(500, 350, 400, 400);
  ellipse(500, 350, 500, 500);
  ellipse(500, 350, 100, 100);
  ellipse(500, 350, 350, 350);
  stop();
  fill(255,50);
  ellipse(500, 350, 850, 850);
  ellipse(500, 350, 650, 650);
  ellipse(500, 350, 450, 450);
  ellipse(500, 350, 250, 250);
  ellipse(500, 350, 150, 150);
  ellipse(500, 350, 200, 200);
  stop();
  ellipse(500, 350, 800, 800);
  ellipse(500, 350, 600, 600);
  ellipse(500, 350, 400, 400);
  ellipse(500, 350, 500, 500);
  ellipse(500, 350, 100, 100);
  ellipse(500, 350, 350, 350);
  stop();
  
  //triangulos
  strokeWeight(15);
stroke(100);
  triangle(500,350,360,200,400,335);
  triangle(530,330,635,252,621,152);
  triangle(506,376,455,569,429,440);
  triangle(540,368,695,443,789,410);
  triangle(461,362,318,318,257,386);
  triangle(512,344,440,177,461,84);
  triangle(530,389,693,449,704,558);
  triangle(468,378,381,473,219,437);
  triangle(519,366,687,251,803,273);
  triangle(695,293,719,189,848,153);
  triangle(433,309,233,268,158,191);
  triangle(377,425,240,577,123,583);
  triangle(666,486,765,603,881,581);
  triangle(529,26,454,48,360,14);
  triangle(295,220,155,239,53,15);
  triangle(754,211,925,177,981,94);
  triangle(221,559,170,646,94,643);
  triangle(452,452,443,600,551,666);
  triangle(785,584,885,644,951,624);
   
    // arcos centrales
  stroke(255);
  fill(145);
  strokeWeight(40);
  arc(500, 350, 900, 900, 0.00, 0.79);
  fill(0, 225);
  strokeWeight(30);
  arc(500, 350, 700, 700, PI, PI+QUARTER_PI);
  fill(0, 195);
  strokeWeight(20);
  arc(500, 350, 600, 600, HALF_PI, PI);
  fill(0, 165);
  strokeWeight(10);
  arc(500, 350, 500, 500, PI + HALF_PI, 5.50 );
  fill(0,  135);
  strokeWeight(10);
  arc(500, 350, 400, 400, 0.00, 1.57);
  fill(0, 105);
  strokeWeight(20);
  arc(500, 350, 300, 300, PI + HALF_PI, TWO_PI);
  fill(0, 75);
  strokeWeight(30);
  arc(500, 350, 200, 200, HALF_PI, HALF_PI + QUARTER_PI);
  fill(0, 45);
  strokeWeight(40);
  arc(500, 350, 100, 100, PI, PI + HALF_PI);
stop();

//triangulos
strokeWeight(5);
stroke(50);
  triangle(500,350,360,200,400,335);
  triangle(530,330,635,252,621,152);
  triangle(506,376,455,569,429,440);
  triangle(540,368,695,443,789,410);
  triangle(461,362,318,318,257,386);
  triangle(512,344,440,177,461,84);
  triangle(530,389,693,449,704,558);
  triangle(468,378,381,473,219,437);
  triangle(519,366,687,251,803,273);
  triangle(695,293,719,189,848,153);
  triangle(433,309,233,268,158,191);
  triangle(377,425,240,577,123,583);
  triangle(666,486,765,603,881,581);
  triangle(529,26,454,48,360,14);
  triangle(295,220,155,239,53,15);
  triangle(754,211,925,177,981,94);
  triangle(221,559,170,646,94,643);
  triangle(452,452,443,600,551,666);
  triangle(785,584,885,644,951,624);
     
     // arcos centrales
  stroke(0);
   strokeWeight(5);
  arc(500, 350, 900, 900, 0.00, 0.79);
   strokeWeight(5);
  arc(500, 350, 700, 700, PI, PI+QUARTER_PI);
  strokeWeight(5);
  arc(500, 350, 600, 600, HALF_PI, PI);
  strokeWeight(5);
  arc(500, 350, 500, 500, PI + HALF_PI, 5.50 );
  strokeWeight(5);
  arc(500, 350, 400, 400, 0.00, 1.57);
  strokeWeight(5);
  arc(500, 350, 300, 300, PI + HALF_PI, TWO_PI);
  strokeWeight(5);
  arc(500, 350, 200, 200, HALF_PI, HALF_PI + QUARTER_PI);
  strokeWeight(5);
  arc(500, 350, 100, 100, PI, PI + HALF_PI);
  stop();
  
  //triangulos
strokeWeight(1);
stroke(255);
  triangle(500,350,360,200,400,335);
  triangle(530,330,635,252,621,152);
  triangle(506,376,455,569,429,440);
  triangle(540,368,695,443,789,410);
  triangle(461,362,318,318,257,386);
  triangle(512,344,440,177,461,84);
  triangle(530,389,693,449,704,558);
  triangle(468,378,381,473,219,437);
  triangle(519,366,687,251,803,273);
  triangle(695,293,719,189,848,153);
  triangle(433,309,233,268,158,191);
  triangle(377,425,240,577,123,583);
  triangle(666,486,765,603,881,581);
  triangle(529,26,454,48,360,14);
  triangle(295,220,155,239,53,15);
  triangle(754,211,925,177,981,94);
  triangle(221,559,170,646,94,643);
  triangle(452,452,443,600,551,666);
  triangle(785,584,885,644,951,624);
  
  //contornos circunferencias
  fill(255,1);
  stroke(50);
  ellipse(500, 350, 1000, 1000);
  ellipse(500, 350, 950, 950);
  ellipse(500, 350, 900, 900);
  ellipse(500, 350, 700, 700);
  ellipse(500, 350, 550, 550);
  ellipse(500, 350, 800, 800);
  ellipse(500, 350, 600, 600);
  stop();
  ellipse(500, 350, 400, 400);
  ellipse(500, 350, 500, 500);
  ellipse(500, 350, 100, 100);
  ellipse(500, 350, 350, 350);
  ellipse(500, 350, 850, 850);
  stop();
  ellipse(500, 350, 650, 650);
  ellipse(500, 350, 450, 450);
  ellipse(500, 350, 250, 250);
  ellipse(500, 350, 150, 150);
  ellipse(500, 350, 200, 200);
  ellipse(500, 350, 800, 800);
  ellipse(500, 350, 600, 600);
  ellipse(500, 350, 400, 400);
  ellipse(500, 350, 500, 500);
  ellipse(500, 350, 100, 100);
  ellipse(500, 350, 350, 350);
fill(255);
ellipse(500,350,50,50);
fill(0);
ellipse(500,350,40,40);
fill(255);
ellipse(500,350,30,30);
fill(0);
ellipse(500,350,10,10);
  stop();
}
