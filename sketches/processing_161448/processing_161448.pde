
//dichiarazione variabili float, ovvero, variabili che possono assumere numeri al di fuori dell'insieme dei numeri naturali.

float s, m, h, x, y, offx, offy, x1, y1, z, w, z1, w1, a, b, c, d, e, f, g, o, i, l, p, n, centroA, centroB, centroC, centroD, centroE, centroF, centroG, centroO, centroI, centroL;
float tx1, ty1, tx2, ty2, tx3, ty3, j, k, j1, k1;
float scalar = 600;



void setup() {
  size (800, 800);
  offx = width/2 ;
  offy = height/2;
  
  // valori fittizi di centro usati come fossero offset per creare l'effetto di "sfasamento" tra i colori delle lencette
  centroA = width/2 + 20 ;
  centroB = height/2 + 20;
  centroC = width/2 + 40;
  centroD = height/2 + 40;
  centroE = width/2;
  centroF = height/2;
  centroG = width/2 + 20; 
  centroO = height/2 + 20;
  centroI = width/2 + 40;
  centroL = height/2 + 40;
  
  // valori posizionali delle coordinate del triangolo del quadrante
  tx1 = 200;
  ty1 = 500;
  tx2 = 600;
  ty2 = 500;
  tx3 = 400;
  ty3 = 154;
  smooth();
  
}

//blocco di programmazione per l'animazione delle lancette

void draw () {
  background(0);
  
  //mappatura dei valori dei secondi, minuti e ore
  
  s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;                  
  m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  

//triangolo quadrante
  noFill();
  stroke(#FFFFFF);
  strokeWeight(10);
  triangle(tx1, ty1, tx2, ty2, tx3, ty3);

  
//lancetta secondi
  x = (offx + cos(s) * (scalar/2 - 5));          
  y = (offy + sin(s) * (scalar/2 - 5));
  stroke(210);
  strokeWeight(4);
  
  //condizione per cui se premo il tasto del mouse la lancetta dei secondi si ferma

 if (mousePressed) {
   line (width/2, height/2, x1, y1);
                   }
   else {
     x1 = x;
     y1 = y;
     z1 = z;
     w1 = w;
      line (width/2, height/2, x, y);

         }


   
//lancetta minuti

//ho usato così tante variabili perchè è come se ci fossero tre lancette dei minuti legate fra di loro per creare l'effetto arcobaleno

  e = centroE + cos(m) * scalar/3;
  f = centroF + sin(m) * scalar/3;
  g = centroG + cos(m) * scalar/3;
  o = centroO + sin(m) * scalar/3;
  i = centroI + cos(m) * scalar/3;
  l = centroL + sin(m) * scalar/3;
 
  strokeWeight(10);
  stroke(#FCFF50);
  line (width/2, height/2, e, f);
  stroke(#FF7824,205);
  line (width/2, height/2, g, o);
  stroke(#FF0000,185);
  line (width/2, height/2, i, l);



 
//lancetta ore

//ho usato così tante variabili perchè è come se ci fossero tre lancette delle ore legate fra di loro per creare l'effetto arcobaleno

  x = offx + cos(h) * scalar/3;
  y = offy + sin(h) * scalar/3;
  a = centroA + cos(h) * scalar/3;
  b = centroB + sin(h) * scalar/3;
  c = centroC + cos(h) * scalar/3;
  d = centroD + sin(h) * scalar/3;
  
  strokeWeight(20);
  stroke(#A800B4);
  line (width/2, height/2, x, y);
  stroke(#3298FA,205);
  line (width/2, height/2, a, b);
  stroke(#A0E002,185);
  line (width/2, height/2, c, d);

}


