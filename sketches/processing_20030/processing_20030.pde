



PImage img;
int numeroColumnas=10;
void setup(){    
    size(600,667);
    int anchoColumna=width/numeroColumnas;
    int numeroFilas=int(height/anchoColumna);
    img=loadImage("portrait.jpg");
    PGraphics[] celdas=new PGraphics[numeroColumnas*numeroFilas];
    for(int contadorColumna=0; contadorColumna<numeroColumnas; contadorColumna++){ 
     for(int contadorFila=0; contadorFila<numeroFilas; contadorFila++){
        
        PGraphics celdaActual=createGraphics(anchoColumna, anchoColumna, JAVA2D);
        celdaActual.colorMode(HSB, 100, 100, 100,100);
        stroke(255, 70);
        fill(255,random(70,180));
        int coordX=contadorColumna*anchoColumna;
        int coordY=contadorFila*anchoColumna;

        celdaActual.beginDraw();
          celdaActual.translate(-anchoColumna/2, -anchoColumna/2);

         celdaActual.rotate(random(-radians(35),radians(35)));
 
         if(random(3)>2){


        celdaActual.tint(255, 0, 0);

        }else{

        celdaActual.tint(255, 140, 0);
          
        }
          celdaActual.image(img, -coordX+anchoColumna/2,-coordY+anchoColumna/2);
  
          celdaActual.endDraw();

          image(celdaActual, coordX, coordY);
  

        noFill();
        rect(coordX, coordY, anchoColumna, anchoColumna);

        int posicion=int((((contadorColumna+1)*(contadorFila+1)) - 1));

        celdas[posicion]=celdaActual;
        }
    }
    
    println("hola"+celdas.length);
}
int contadorFotos=0;
void draw(){
}
void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



