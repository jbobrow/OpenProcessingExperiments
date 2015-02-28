
size(400,400);
background(200);
int x = int(width*.75);
int y = height/2;
int dia,ancho,altura;
float anguloInicio, anguloFinal;
dia = 20;
noFill();
strokeWeight(2);
anguloInicio = 40; //aqui especificamos los angulos en grados
anguloFinal = 320; //
//smooth();	
for( int i = 0; i < 16; i++){
  dia +=20;
  ancho = altura = dia;
  anguloInicio += 8; //el anguloInicio aumenta
  anguloFinal -= 8;  //al anguloFinal reduce
  arc(x, y, ancho, altura, radians(anguloInicio), radians(anguloFinal)); //tenemos que pasar los angulos del arco como radianos (proporcional a PI);
}

