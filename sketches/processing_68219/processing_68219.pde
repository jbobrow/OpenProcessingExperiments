
class Robot{
  int camaraX=0, camaraY=0;                        //Variables que controlan la vista de camara.
  int altoCaja, anchoCaja, largoCaja;              //Dimensiones de la caja en mm.
  int aSeg1, lSeg1;                                //ancho y largo de segmento 1.
  int aSeg2, lSeg2;                                //ancho y largo de segmento 2.
  int limIni, limFin;                              //Limites de giro de servo.
  int servo1, servo2, servo3;                      //Variables que almacenan el ángulo de los servos.  
  
  int [] movimientos1 = new int[0];                //Listado de movimientos.
  int [] movimientos2 = new int[0];
  int [] movimientos3 = new int[0];  
  
  //Constructor
  Robot(int tempAltoCaja, int tempAnchoCaja, int tempLargoCaja, int tempASeg1, int tempLSeg1, int tempASeg2, int tempLSeg2, int tempLimIni, int tempLimFin){
    altoCaja = tempAltoCaja;
    anchoCaja = tempAnchoCaja;
    largoCaja = tempLargoCaja;
    aSeg1 = tempASeg1;
    lSeg1 = tempLSeg1;
    aSeg2 = tempASeg2;
    lSeg2 = tempLSeg2;
    limIni = tempLimIni;
    limFin = tempLimFin;
  }
  
  //Imprime el angulo de los servos
  void angulo(){
    //Imprime ángulo de servos.
  text("servo1 = ", 550, 400);
  text(servo1, 600, 400);
  text("servo2 = ", 550, 420);
  text(servo2, 600, 420);
  text("servo3 = ", 550, 440);
  text(servo3, 600, 440);
  }
  
  //Dibuja el brazo robotico
  void dibujar(){
    pushMatrix();
    

    translate(width/2, height/2);
    rotateX(radians(camaraY * (-1)));
    rotateY(radians(camaraX));
    fill(#FAE100);
    //Dibuja la base.
    box(anchoCaja, altoCaja, largoCaja);        

    //Dibuja el segmento 1 
    translate(0, 40, 40);
    rotateY(radians(servo1-90));
    rotateZ(radians(servo2-90));
    fill(#FEFEFE);
    rect(-aSeg1/2, 0, aSeg1, lSeg1);                           
  
    //Dibuja el segmento 2
    translate(0, lSeg1, 0);
    rotateZ(radians(servo3-90));
    fill(#FEFEFE);
    rect(-aSeg2/2, 0, aSeg2, lSeg2);
    popMatrix();
  }

/*  
  //Función que va creando el listado de movimientos
  void guardar(){
    movimientos1 = append(movimientos1, servo1);
    movimientos2 = append(movimientos2, servo2);
    movimientos3 = append(movimientos3, servo3);
  }
  
  //Guarda los movimientos definidos por el usuario y cierra el programa.
  void salir() {
  String[] movimientos = new String[movimientos1.length];
  for (int i = 0; i < movimientos1.length; i++) {
    movimientos[i] = movimientos1[i] + "\t" + movimientos2[i] + "\t" + movimientos3[i];
  }
  saveStrings("movimientos.txt", movimientos);
  exit(); // Stop the program
}
*/
}

