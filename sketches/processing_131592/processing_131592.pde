
/*Melania Gonzalez 
 
 *Tarea #1 - Melania Gonzalez
 
 -----MATRIZ de Bolas-----
   x | y | a | d | v | r | g b o   x=Posicion en x, punto A (Variable)
----------------------------       y=Posicion en y, punto A (Variable)
B1|  |   |   |   |   |   |   |     a=angulo (Variable)
----------------------------       d=diametro del circulo (Constante)
B2|  |   |   |   |   |   |   |     v=velocidad o razon de cambio (Constante)
----------------------------       r=red (Constante)
B3|  |   |   |   |   |   |   |     g=green (Constante)
----------------------------       b=blue (Constante)
...                                o=opacity
                                   t=type

 */
 
// DECLARAR VARIABLES
int nBolas=10;
int rango=210;
float [][] bolas = new float[nBolas][9];

// INICIALIZAR VARIABLES
void setup() {
  size(700, 700); //size of the screen
  //rango=(int)random(100);
//RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
    bolas[i][3]=random(40,100);    //iniciar diametro
    bolas[i][0]=random(bolas[i][3],width-bolas[i][3]); //iniciar x
    bolas[i][1]=random(bolas[i][3],height-bolas[i][3]);//iniciar y
    bolas[i][2]=random(360);    //iniciar angulo
    bolas[i][4]=random(0.3,2);   //iniciar Velocidad
    bolas[i][5]=random(255);   //iniciar color
    bolas[i][6]=random(255);   //iniciar color
    bolas[i][7]=random(255);   //iniciar color
    bolas[i][8]=random(50,220);   //opacidad
  }
}

//METODO PRINCIPAL QUE SE EJECUTA REPETIDAMENTE
void draw() {
  background(255); //pintar el background en cada frame
  
  //RECORRER LA MATRIZ
  for (int i=0;i<nBolas;i++) {
    
    //variables temporales
    float d= bolas[i][3]; //DIAMETRO
    float x= bolas[i][0]; //punto x
    float y= bolas[i][1]; //punto y
    float r= bolas[i][5]; //r
    float g= bolas[i][6]; //g
    float b= bolas[i][7]; //b
    float o= bolas[i][8]; //o
    
    //Dibujar las bolitas
    noStroke();
    fill(r,g,b,o); //color de la bola
    ellipse(x, y, d, d); //dibujar bola
    
    fill(b,g,r,o); //color del triangulo
    triangle(x+(d/2),y+(d/2),x-(d/2),y+(d/2),x,y);
    
    fill(r,b,g,o); //color del triangulo
    triangle(x-(d/2),y-(d/2),x+(d/2),y-(d/2),x,y);
    
    fill(b,r,g,o); //color del triangulo
    triangle(x-(d/2),y-(d/2),x-(d/2),y+(d/2),x,y);
    
    fill(g,b,r,o); //color del triangulo
    triangle(x+(d/2),y-(d/2),x+(d/2),y+(d/2),x,y);
    
    //MOVER BOLA CON RESPECTO A EL ANGULO Y LA VELOCIDAD
    float v= bolas[i][4]; //VELOCIDAD O RAZON DE CAMBIO
    float a=bolas[i][2];  //ANGULO
    bolas[i][0]+=cos(a)*v;
    bolas[i][1]+=sin(a)*v;
    
    
    //CONFIRMO SI LA BOLITA HA LLEGADO A LA ORILLA DE LA PANTALLA
    
    if(x>width-(d/2)) //LLEGO A LA ORILLA DE LA DERECHA?
      {
        bolas[i][2]=random(90,270); //generamos nuevo angulo
        bolas[i][0]-=v;
      }//generamos nuevo angulo
    else if(x<(d/2))  //LLEGO A LA ORILLA DE LA IZQUIERDA?
      {
      bolas[i][2]=random(-90,90); //generamos nuevo angulo
      bolas[i][0]+=v;
      }
    else if(y>height-(d/2))//LLEGO A LA ORILLA DE ABAJO?
      {
        bolas[i][2]=random(0,180); //generamos nuevo angulo
        bolas[i][1]-=v;
      }
    else if(y<(d/2))      //LLEGO A LA ORILLA DE ARRIBA?
      {
        bolas[i][2]=random(180,360); //generamos nuevo angulo
        bolas[i][1]+=v;
      }
  
  
     //Creo un nuevo iterador
     for (int p=0;p<nBolas;p++) {
       if(i!=p){
         
         //distancia de bolita-i a la bolita-p
         int distancia = (int)sqrt(sq(bolas[i][0]-bolas[p][0])+sq(bolas[i][1]-bolas[p][1]));
         
         if(distancia<rango){
           //dibujar linea entre 2 colitas q estan a menos de cierta distancia
           strokeWeight(4);
           stroke(0,0,random(255));
           line(bolas[i][0],bolas[i][1],bolas[p][0],bolas[p][1]);
         }//termina el IF
         
       }//termina el IF  
    }//termina iterador "p" 
        
    }//termina iterador "i"
    //imprimo datos de la primera bolita para visualizar
    print("x="+bolas[0][0]+" y="+bolas[0][1]+" a="+bolas[0][2]+" b="+bolas[0][3]+"\n");
}
