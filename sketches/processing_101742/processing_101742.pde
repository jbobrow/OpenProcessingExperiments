
/**
Radial text clock

A small sketch just to pass some time (no pun).

@author: Made by @ramayac
@date: 25 Jun 2013
*/

void setup(){
  size(600, 600);
  //background(#6BB199);
  background(51);
  smooth();
}

//Changed "uno" to "una".
String[] numeros = { "cero", "una", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez", "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho", "diecinueve", "veinte", "veintiuno", "veintidós", "veintitres", "veinticuatro", "veinticinco", "veintiséis", "veintisiete", "veintiocho", "veintinueve", "treinta", "treinta y uno", "treinta y dos", "treinta y tres", "treinta y cuatro", "treinta y cinco", "treinta y seis", "treinta y siete", "treinta y ocho", "treinta y nueve", "cuarenta", "cuarenta y uno", "cuarenta y dos", "cuarenta y tres", "cuarenta y cuatro", "cuarenta y cinco", "cuarenta y seis", "cuarenta y siete", "cuarenta y ocho", "cuarenta y nueve", "cincuenta", "cincuenta y uno", "cincuenta y dos", "cincuenta y tres", "cincuenta y cuatro", "cincuenta y cinco", "cincuenta y seis", "cincuenta y siete", "cincuenta y ocho", "cincuenta y nueve", "sesenta"
};

void draw(){
  background(51);
  
  drawWheel(#332D2F, #F2F1F0, 80+240+240, second(), 60);
  drawWheel(#575151, #F2F1F0, 80+240, minute(), 60);
  drawWheel(#BFC3B9, #332D2F, 80, hour(), 12);
}

void drawWheel(color fondo, color textcolor, int radio, float tiempo, int medida){
  pushMatrix();
  
  fill(fondo);
  //stroke(fondo);
  noStroke();
  ellipse(width/2, height/2, radio, radio);
  
  translate(width / 2, height / 2);
  int t = (int) tiempo;
  float radT = 360 / medida * tiempo - 90;
  
  //String s = "" + (t<=9?"0"+t:t); 
  String s = numeros[t];
  float textW = textWidth(s);
  
  pushMatrix();
  rotate(radians(radT));
  fill(textcolor);
  text(s, radio/2 - textW - 5, 0);
  popMatrix();
  
  popMatrix();
}
