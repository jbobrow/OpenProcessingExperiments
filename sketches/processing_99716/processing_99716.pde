
float c1;  
float c2;  
float s1;
float s2;

void setup (){
size (1200,600);
colorMode (HSB, 360,100,100,100);  // para decirle al programa que usaremos el modelo de color HSB e vez de RGB que es por omisión
                       // 360 va a ser el ángulo del color, el nivel máximo (hue); 
                       // 100 va a ser el porcentaje de saturación
                       //100 va a ser el porcentaje de brillo
                       // 100 va a ser el porcentaje de transparencia
c1 = 0;  // definimos el primer color c1 que como está en 0, será rojo
c2 = c1 + 180;   // definimos el segundo color
s1 = 0;
s2 = s1 + 50;
}

void draw (){
  rectMode (CORNER);  //al añadir esta función el segundo rectángulo se dibujará desde la esquina
  stroke (100);
  fill (c1, 100,100);
  rect (0,0,width,height);
  rectMode (CENTER);
  fill (c2,100,100);  // si modifico el último valor, de la brillantez, por ejemplo a 0, se convierte en negro
  rect(width/2, height/2, width/2, height/2);  // para centrar totalmente el rectángulo en el lienzo
  
  c1 = map(mouseY,0,height,0,360);   //puede variar de 0 al ancho del lienzo, si quiero que sea de 0 a 360, uso la función map para cartografiarlo
  //el rango inicial va de 0 a width; el rango final va de 0 a 360
  //el valor que queremos mapear o cartografiar es el de mouseX
  println(c1);
  c2 = (c1 + 180) % 360;  //actualizamos la información de c2 con un operador de porcentaje, para que cuando el círculo cromático llegue a 360 que es el tope, vuelva a empear
  s1 = map(mouseY,0,height,0,100);
  s2 = map(mouseY,0,height,0,100);
}



