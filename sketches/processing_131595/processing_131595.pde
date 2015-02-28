
/*Tarea de Mariana Mora 

Hackeando el codigo de Melania Gonzalez y Tomas de Camino
  
 *Tarea #1 - Se cambio cantidad de bolas en el ejercicio, color del background, de las esferas, la direccion de la 
 linea entre las mismas y el grosor de las lineas.
 */
  
// DECLARAR VARIABLES
int nBolas=20;
int rango;
int [][] bolas = new int[nBolas][9];
 
// INICIALIZAR VARIABLES
void setup() {
  size(1000, 600); //size of the screen
  rango=(int)random(100);
//RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=(int)random(width); //iniciar x
    bolas[i][1]=(int)random(height);//iniciar y
    bolas[i][2]=(int)random(width); //iniciar a
    bolas[i][3]=(int)random(height);//iniciar b
    bolas[i][4]=(int)random(120);    //iniciar diametro
    bolas[i][5]=(int)random(50,100);   //iniciar Velocidad
    bolas[i][6]=(int)random(200,255);   //iniciar color
    bolas[i][7]=(int)random(225,255);   //iniciar color
    bolas[i][8]=(int)random(245,255);   //iniciar color
  }
}
 
//METODO PRINCIPAL QUE SE EJECUTA REPETIDAMENTE
void draw() {
  background(245); //pintar el background en cada frame
   
  //RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
     
    fill(bolas[i][6],bolas[i][7],bolas[i][8]); //color de la bola
    ellipse(bolas[i][0], bolas[i][1], bolas[i][4], bolas[i][4]); //pintar bola
     
    //MOVER BOLA PARA QUE AVANCE DE "A" A "B"
    int v= bolas[i][5]; //VELOCIDAD O RAZON DE CAMBIO
    bolas[i][0]+=(bolas[i][2]-bolas[i][0])/v; //mover punto A en x
    bolas[i][1]+=(bolas[i][3]-bolas[i][1])/v; //mover punto A en y
     
    //CONFIRMO SI POSICION "A" ES IGUAL A LA "B" PARA SABER SI YA LLEGO AL DESTINO
    int cx= bolas[i][0]-bolas[i][2]; //que tan cerca esta del punto B en x?
    int cy= bolas[i][1]-bolas[i][3]; //que tan cerca esta del punto B en x?
        if(((cx<v)&&(cx>-v))&&(cy<v)&&(cy>-v)) //preguntamos si ya esta en el punto o dentro de la razon e cambio
        {
        bolas[i][2]=(int)random(width);//generamos nuevo punto B en x (alpha)
        bolas[i][3]=(int)random(height);//generamos nuevo punto B en y (beta)
        }
      
     //Creo un nuevo iterador
     for (int p=0;p<nBolas;p++) {
       if(i!=p){
          
         //distancia de bolita-i a la bolita-p
         int distancia = (int)sqrt(sq(bolas[i][0]-bolas[p][0])+sq(bolas[i][0]-bolas[p][1]));
          
         if(distancia<rango){
           //dibujar linea entre 2 colitas q estan a menos de cierta distancia
           colorMode(HSB, 360, 100, 100);
           strokeWeight(5.0);
           line(bolas[i][0],bolas[i][1],bolas[p][0],bolas[p][1]);
           
         }//termina el IF
          
       }//termina el IF 
    }//termina iterador "p"
         
    }//termina iterador "i"
    //imprimo datos de la primera bolita para visualizar
    print("x="+bolas[0][0]+" y="+bolas[0][1]+" a="+bolas[0][2]+" b="+bolas[0][3]+"\n");
}

