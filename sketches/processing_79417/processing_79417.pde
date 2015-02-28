
// modificar cosas distintas para cada persoanje
//una funcion para acada personaje y 4 variables para cada uno


void setup () {
  size(800,400);
  
}

void draw () {
  
  smooth();
  personaje1(80,20,255,0);
  personaje2(100,0,100,140);
  
}



void personaje1 (int sizecuerpo, int sizepatas, color c, color k ) {

pushMatrix();
noStroke();
fill(0,255,0);
ellipse(100,100,sizecuerpo,sizecuerpo);
ellipse(80,140,sizepatas,sizepatas);
ellipse(120,140,sizepatas,sizepatas);

fill(c);
ellipse(100,120,20,20);

fill (k);
ellipse(100,120,10,10);



popMatrix();


}



void personaje2 (int x, int y, int distanciaojo, int distanciapatas) {

pushMatrix();
translate(x,y);
noStroke();
fill(255,0,0);
ellipse(100,100,80,80);
ellipse(80,distanciapatas,20,20);
ellipse(120,distanciapatas,20,20);

fill(255);
ellipse(distanciaojo,80,20,20);

fill (0);
ellipse(distanciaojo,80,10,10);



popMatrix();


}
