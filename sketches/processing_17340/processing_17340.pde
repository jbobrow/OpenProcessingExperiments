
//Isaac OrtegaAlvarado ITCR-IDI-DVII- Homework #1- Moire Pattern-
//import processing.pdf.*;
void setup(){
  size(700,700);//dimensiones de ventana
  //noLoop();//no se repite la instruccion de guardado
  //beginRecord(PDF,"moire.pdf");//comienza el guardado del PDF 
  background(50);//color de fondo en escala de gris
}

void draw(){
  for (int i = 50; i <=650; i = i+10){
    for (int j =50; j <=650; j = j+10){//ciclo anidado repite figura
      noStroke();//indica que la elipse no lleva linea de contorno
      fill(#f1e31d);//aplica color de relleno a la elipse
      ellipse(i,j,5,5);//dibuja elipse con centro en (i,j)y radio 2.5 px      
    }
  }
  translate (32,-29.5);//traslada el eje
  rotate(PI/36);//rota el eje 5 grados
  for (int i = 50; i <=650; i = i+10){
    for (int j =50; j <=650; j = j+10){
      noStroke();
      fill(#f1e31d);
      ellipse(i,j,5,5); 
    }
  }
  //endRecord();//finaliza el guardado del PDF
}

