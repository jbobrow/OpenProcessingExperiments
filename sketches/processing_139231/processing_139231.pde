
// Processing por Javier Melgar
// Granada Escuela Escenica
//------ 7 / 03 / 2013 ---------
//------------ Nuevo Ejemplo ------------------

float tama = 30;
//------------------------------
// Setup (se ejecuta una vez)
//------------------------------

void setup (){
size (500,500);
frameRate(2);
noStroke();
smooth();
println("Bienvenido NEO el setup se ha ejecutado...");
println("Eres un freak");

} //fin de setup()

//------------------------------
// Draw (Se ejecuta en bucle)
//------------------------------

void draw () {
background(0);

for (float i = 0; i < width; i = i + tama){

  for (float o = 0; o < height; o = o + tama){
crearCirculoTam(i, o, tama); 

}
}//fin de for



//crearCirculoTam(random(width), random(height), random(600));






} // fin de draw()


//------------------------------
// Funciones
//------------------------------

void crearCirculo (float _x, float _y ) {


  ellipse (_x, _y, 100, 100);
  fill (0);
  ellipse (_x, _y, 50, 50);
}

void crearCirculoTam (float _x, float _y, float _diam) {

  
  
  fill (127,0,0,127);
  ellipse (_x, _y, _diam, _diam);
  fill (0);
  ellipse (_x, _y, _diam/2, _diam/2);
   fill (127,0,12,127);
  ellipse (_x, _y, _diam/4, _diam/4);
  
}


