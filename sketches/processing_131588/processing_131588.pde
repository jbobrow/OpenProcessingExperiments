
//Ejercicio desarrollado por Alberto Castillo
//Basado en el código explicado por Melania y Paula.

//Probé en lugar de trabajar todo con números enteros, manejarlo todo con números reales (floats).
//Según entiendo esto hace que los círculitos no salten tanto de lugar en lugar sino que se agrupen. Me gusta más la organización que hacen así.
//Lo demás fueron detalles cómo el color, la opacidad, el punto en el centro de masa del círculo, etc.


int nCirculos =25;//cantidad de círculos en el sistema
float[][] circulos= new float [nCirculos][10]; //produce una matriz de 4 filas y 3 columnas

void setup(){
  size(800,500);
  noCursor();
  smooth();
  fill(HSB,255,255,255);
  for(int i=0;i<nCirculos;i++){
    circulos[i][0]=(float)random(width);//primera posición X
    circulos[i][1]=(float)random(height);//primera posición Y
    circulos[i][2]=(float)random(15,150);//genera el radio
    circulos[i][3]=(float)random(width);//nueva posición X
    circulos[i][4]=(float)random(height);//nueva posición Y
    circulos[i][5]=(float)random(200,400);//velocidad
    circulos[i][6]=(float)random(0,161);//R
    circulos[i][7]=(float)random(252,255);//G
    circulos[i][8]=(float)random(255);//B
    circulos[i][9]=(float)random(25,30);//opacidad
    
}
}
void draw(){
  background(35);//refresca el background en cada iteración
  for(int i=0;i<nCirculos;i++){//llama a la matriz de círculos creada anteriormente
    
    //establece las propiedades gráficas de los círculos
    strokeWeight(2);
    point(circulos[i][0],circulos[i][1]);
    strokeWeight(1);
    stroke(circulos[i][6],circulos[i][7],circulos[i][8],circulos[i][9]*1.5);
    fill(circulos[i][6],circulos[i][7],circulos[i][8],circulos[i][9]); 
    ellipse(circulos[i][0],circulos[i][1],circulos[i][2],circulos[i][2]);//dibuja el círculo en sí con las calidades establecidas en la matriz.
  
    float v=circulos[i][5];//introduce la velocidad (o razón de cambio).
    circulos[i][0]+=(circulos[i][3]-circulos[i][0])/v;//mueve el punto A en x.
    circulos[i][1]+=(circulos[i][4]-circulos[i][1])/v;//mueve el punto A en y.
    
    
    float cx=circulos[i][0]-circulos[i][3];//relación de distancia entre posiciones X.
    float cy=circulos[i][1]-circulos[i][4];//relación de distancia entre posiciones Y.
      if(((cx<v)&&(cx>-v))&&(cy<v)&&(cy>-v)){//define si el círculo ya llegó al punto B).
        
        circulos[i][3]=(float)random(width);//vuelve a producir una nueva ubicación para los círculos en x.
        circulos[i][4]=(float)random(height);//vuelve a producir una neva ubicación para los círculos en y.
  
      }
        for(int p=0;p<nCirculos;p++){ //el p se pone porque es otro lector de matriz
        if(i!=p){
          //distancia entre círculo i al círculo p
          float distancia = sqrt(sq(circulos[i][0]-circulos[p][0])+sq(circulos[i][1]-circulos[p][1]));
         
          if(distancia<50){//produce que si la distancia entre un círculo y otro es menor a 50px, dibuja una línea.
           stroke(255);//color de la línea
           strokeWeight(1);//peso de la línea
            line(circulos[i][0],circulos[i][1],circulos[p][0],circulos[p][1]);//dibuja la línea entre los círculos. 
          }
        }
      }
  }
      
}
