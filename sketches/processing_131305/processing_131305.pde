
/*Melania Gonzalez 
 
 *Tarea #1 - Hackeando el codigo del profe.
 *Descripcion: El ejercicio original que hicimos en la Clase #2
 mueve a una serie de bolitas de un punto A a un punto B 
 respectivamente, siendo el punto B la posicion del Mouse.
 *Objetivo: Reproducir el ejercicio, pero en este caso 
 el punto B será una posicion Random respectivamente para cada Bola.
 
 -----MATRIZ de Bolas-----
   x | y | a | b | d | v | c |     y=Posicion en x, punto A (Variable)
----------------------------       x=Posicion en y, punto A (Variable)
B1|  |   |   |   |   |   |   |     a(alpha)=Posicion en, x punto B (Variable)
----------------------------       b(beta) =Posicion en, y punto B (Variable)
B2|  |   |   |   |   |   |   |     d=diametro del circulo (Constante)
----------------------------       v=velocidad o razon de cambio
B3|  |   |   |   |   |   |   |     c=color (Constante)
----------------------------
...

 */
 
// DECLARAR VARIABLES
int nBolas=10;
int [][] bolas = new int[nBolas][7];

// INICIALIZAR VARIABLES
void setup() {
  size(700, 700); //size of the screen

//RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=(int)random(width); //iniciar x
    bolas[i][1]=(int)random(height);//iniciar y
    bolas[i][2]=(int)random(width); //iniciar a
    bolas[i][3]=(int)random(height);//iniciar b
    bolas[i][4]=(int)random(80);    //iniciar radio
    bolas[i][5]=(int)random(100);   //iniciar Velocidad
    bolas[i][6]=(int)random(255);   //iniciar color
  }
}

//METODO PRINCIPAL QUE SE EJECUTA REPETIDAMENTE
void draw() {
  background(255); //pintar el background en cada frame
  
  //RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
    
    fill(bolas[i][6]); //color de la bola
    ellipse(bolas[i][0], bolas[i][1], bolas[i][4], bolas[i][4]); //pintar bola
    
    //MOVER BOLA PARA QUE AVANCE DE "A" A "B"
    int v= bolas[i][5]; //VELOCIDAD O RAZON DE CAMBIO
    bolas[i][0]+=(bolas[i][2]-bolas[i][0])/v; //mover punto A en x
    bolas[i][1]+=(bolas[i][3]-bolas[i][1])/v; //mover punto A en y
    
    //CONFIRMO SI POSICION "A" ES IGUAL A LA "B" PARA SABER SI YA LLEGO AL DESTINO
    int a= bolas[i][0]-bolas[i][2]; //que tan cerca esta del punto B en x?
    int b= bolas[i][1]-bolas[i][3]; //que tan cerca esta del punto B en x?
        if(((a<v)&&(a>-v))&&(b<v)&&(b>-v)) //preguntamos si ya esta en el punto o dentro de la razon e cambio
        {
        bolas[i][2]=(int)random(width);//generamos nuevo punto B en x (alpha)
        bolas[i][3]=(int)random(height);//generamos nuevo punto B en y (beta)
        }
    }
    //imprimo datos de la primera bolita para visualizar
    print("x="+bolas[0][0]+" y="+bolas[0][1]+"a="+bolas[0][2]+" b="+bolas[0][3]+"\n");
}
