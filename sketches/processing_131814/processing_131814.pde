
//* La mayor parte del codigo lo pude hacer gracias a Melania Gonzales
// estuve traveseando tratando de meter rectángulos: traté de usar el mismo iterador y los mismos valores, 
// o el mismo iterador pero agregando 4 valores solo para los rectángulos, los rectángulos o bien aparecían y desaparecían,
// o bien varios circulos y rectángulos se quedaban quietos al legar al B mientras que otros sí se movían.
// En definitiva requiero un mejor manejo de conceptos para poder "jugar" más.

int ncircs=20; //declarar la cantidad de círculos
int [][] circs = new int[ncircs][9]; 
// primer[]: cantidad de elementos, segundo[]: cantidad de variables para esos elementos

void setup() {
  size(700,700);//tamaño de la pantalla
  for (int i=0;i<ncircs;i++) //declara como recorre la matriz
    {
    circs[i][0]=(int)random(width); //el inicio en el eje X
    circs[i][1]=(int)random(height); // el inicio en el eje Y
    circs[i][2]=(int)random(width); //punto de destino en el eje X
    circs[i][3]=(int)random(height); //punto de destino en el eje y
    circs[i][4]=(int)random(100); //radio max
    circs[i][5]=(int)random(50,200); //velocidad inicial
    circs[i][6]=(int)random(255); //color
    circs[i][7]=(int)random(255); //color
    circs[i][8]=(int)random(255); //color
    //fija valores dentro de una matriz 
   }
}

void draw() {
  background(255);//color del fondo
  for(int i=0;i<ncircs;i++) { //para esta formula:
    
    fill(circs[i][6],circs[i][7],circs[i][8]); //pintar ellipse en RGB aleatorio
    ellipse(circs[i][0],circs[i][1],circs[i][4],circs[i][4]); //dibujar ellipse
    
    int v= circs[i][5]; //establecer la razon de cambio
    circs[i][0]+=(circs[i][2]-circs[i][0])/v; //mover del punto A al punto B en el eje X
    circs[i][1]+=(circs[i][3]-circs[i][1])/v; //mover del punto A al punto B en el eje Y
    
    int a= circs[i][0]-circs[i][2]; //que tan cerca de B sobre el X
    int b= circs[i][1]-circs[i][3]; //que tan cerca de B sobre el Y
    
      if (((a<v)&&(a>-v))&&((b<v)&&(b>-v)))
        {
        circs[i][2]=(int)random(width); //se renueva el punto B sobre el eje X
        circs[i][3]=(int)random(height); //se renueva el punto B sobre el eje Y
        
        }
    for(int p=0;p<ncircs;p++) { //establece un nuevo iterrador para dibujar las líneas
      if(i!=p){ //si i es diferente a p entonces....
        int dist = (int)sqrt(sq(circs[i][0]-circs[p][0])+sq(circs[i][1]-circs[p][1]));
        //calcula la hipotenusa entre dos puntos para ser el punto de contacto
        if(dist<100){ //si la distancia es menor a 100 pixeles
            line(circs[i][0],circs[i][1],circs[p][0],circs[p][1]); //dibuja la línea entre ambos puntos
          }
        }
    }
  }
}
