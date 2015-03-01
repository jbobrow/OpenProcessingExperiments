
// VARIABLES //
Walls[] paredes = new Walls[27]; //Muros del laberinto
Button[] botones = new Button[4]; //Botones para volver
Time tiempo; //Variable para el tiempo
boolean gameOver = false; //Trigger game over
boolean gameWinner = false; //Trigger game Winner
int squareX = 158; //Posición X del cuadrado
int squareY = 280; //Posicion Y del cuadrado
int squareP; //Posición del cuadrado
int squareT = millis()+3000; //Tiempo para cambiar de posición

void setup(){
  size(800,600); //Establecemos el tamaño de la ventana
  
  // Llamamos a la classe del botón para luego dibujarlos //
  botones[0] = new Button();
  botones[1] = new Button(2,548,50,50,255,"Volver");
  botones[2] = new Button(748,548,50,50,255,"Volver");
  botones[3] = new Button(748,2,50,50,255,"Volver");
  
  // Llamamos la clase del tiempo, inicio en millis();, tiempo en regresivo (60s), posición, medida y texto
  tiempo = new Time(millis(), 60000, (width/2)-(35),(height/2)+(10), 29, 0);
 
  // Creamos las paredes en el array 
  paredes[0] = new Walls(290, 225, 25, 125, color(255,255,0), true);
  paredes[1] = new Walls(315, 225, 255, 25, color(255,255,0), true);
  paredes[2] = new Walls(545, 250, 25, 125, color(255,255,0), true);
  paredes[3] = new Walls(290, 350, 255, 25, color(255,255,0), true);
  
  paredes[4] = new Walls(315, 250, 200, 30, color(0), false);
  paredes[5] = new Walls(315, 280, 30, 70, color(0), false);
  paredes[6] = new Walls(345, 320, 200, 30, color(0), false);
  paredes[7] = new Walls(515, 250, 30, 70, color(0), false);
  
  paredes[8] = new Walls(260,195,30, 210, color(0), false);
  paredes[9] = new Walls(315,195,255, 30, color(0), false);
  paredes[10] = new Walls(570,195,30, 210, color(0), false);
  paredes[11] = new Walls(290,375,250, 30, color(0), false);
  
  paredes[12] = new Walls(0,60,30, 480, color(0), false);
  paredes[13] = new Walls(60,0,680, 30, color(0), false);
  paredes[14] = new Walls(770,60,30, 480, color(0), false);
  paredes[15] = new Walls(60,570,680, 30, color(0), false);
  
  paredes[16] = new Walls(60,60,30, 240, color(0), false);
  paredes[17] = new Walls(60,340,30, 200, color(0), false);
  
  paredes[18] = new Walls(710,60,30, 240, color(0), false);
  paredes[19] = new Walls(710,340,30, 200, color(0), false);
  
  paredes[20] = new Walls(90,60,620, 30, color(0), false);
  paredes[21] = new Walls(90,510,620, 30, color(0), false);
  
  paredes[22] = new Walls(650,120,30, 360, color(0), false);
  paredes[23] = new Walls(120,120,30, 360, color(0), false);
  
  paredes[24] = new Walls(180,120,470, 30, color(0), false);
  
  paredes[25] = new Walls(180,140,30, 280, color(0), false);
  paredes[26] = new Walls(150,450,470, 30, color(0), false);
  
  // FIN  del setup
  
}

void draw(){
    
  if(gameOver){
    gameOverF();  //Si el trigger gameover es true, mostramos pantalla GameOver;
  }else if(gameWinner){
    gameWinnerF(); //Si el trigger gamewinner es true, mostramos la pantalla GameWinner
  }else{
    
    //Si ambos booleanos están en falso, dibujamos el laberinto.
    background(25);
    
    // Calculamos el tiempo que queda para cambiar de posición //
    if(squareT < millis()){
       squareP = (int)random(1,5); // si se acabó el tiempo, creamos una nueva posición
       squareT = squareT + 3000;  //Añadimos 3s mas al squareT
    }
    
    //Calculamos la X e Y nuevos dependiendo de squareP;
     switch(squareP){
      
        case 1: 
           squareX = 100;
           squareY = 260;
           break;
           
        case 2: 
           squareX = 690;
           squareY = 100;
           break;
        
        case 3:
            squareX = 630;
            squareY = 490;
            break;
        
        case 4:
            squareX = 410;
            squareY = 100;
            break;
       
     }
    
      // Calculamos la posición del Mouse para saber si está encima del cuadrado
      if((mouseX+10) > squareX && (mouseX+10) < squareX+15 && (mouseY+10) > squareY && (mouseY+10) < squareY+15  ||
         (mouseX+10) > squareX && (mouseX+10) < squareX+15 && (mouseY-10) > squareY && (mouseY-10) < squareY+15  ||
         (mouseX-10) > squareX && (mouseX-10) < squareX+15 && (mouseY-10) > squareY && (mouseY-10) < squareY+15  ||
         (mouseX-10) > squareX && (mouseX-10) < squareX+15 && (mouseY+10) > squareY && (mouseY+10) < squareY+15  
      ){
        
        // Si se encuentra encima del cuadrado, reniciamos el contador.
        tiempo.setTime(millis());
        
      }
      
    // Dibujamos el cuadrado 
    fill(255);
    rect(squareX, squareY, 15,15);
    
    // Dibujamos el cursor
    fill(255,0,0);
    noStroke();
    rect(mouseX-10, mouseY-10, 20, 20,4);
    
    // Dibujamos el fondo del contador y mostramos el texto del tiempo.
    fill(255);
    rect(335,269,200,50);
    tiempo.calcule();
    
   
    // Recorremos el blucle de las paredes y las dibujamos.
    for(int i = 0; i < paredes.length; i++){
    paredes[i].show();
    }
    
   
  }
      
}
class Button{
  
    int posX, posY, sizeX, sizeY;
    color fll;
    String texte;
  
    Button(){
      posX = 2;
      posY = 2;
      sizeX = 50;
      sizeY = 50;
      fll = color(255);
      texte = "Volver"; 
    }
    
    Button(int px, int py, int sx, int sy, color fl, String tx){
      posX = px;
      posY = py;
      sizeX = sx;
      sizeY = sy;
      fll = color(fl);
      texte = tx; 
    }
    
    // Función para mostrar los botones
    void show(){
      
     fill(fll);
     rect(posX, posY, sizeX, sizeY, 3);
     fill(0);
     textSize(11);
     text(texte,posX+9,posY+30);
     this.clicker(); 
      
    }
 
   // Función para detectar el Click
   void clicker(){
  
     if(mousePressed){
      
        if(mouseX > posX && mouseX < posX+sizeX && mouseY > posY && mouseY < posY+sizeY){
           //Si se clicla, ponemos los boleanos en falso y reniciamos el tiempo (Empieza la partida de nuevo) 
           gameOver = false;
           gameWinner = false;
           tiempo.setTime(millis());
        }
     }
       
   }   
}
class Time{
  
  int start, regresive, posX, posY, size, fll;
  int countM, countS, countMS;
  String countMs, countSs, countMSs;

   Time(){
       start = millis();
       regresive = 60000;
       posX = 50;
       posY = 50;
       size = 29;
       fll = 0;
   }
   
   Time(int st, int rg, int px, int py, int sz, color fl){
    
       start = st;
       regresive = rg;
       posX = px;
       posY = py;
       size = sz;
       fll = fl;
     
   }
   
   //Función para devolver los segundos que quedan (Para detectar si quedan menos de 30 segundos al pisar la casilla amarilla)
   int getTime(){
       int timer = ((regresive-(millis()-start))/1000);
       return timer; 
    }
   
   // Función para calcular el tiempo
   void calcule(){
    
      countS = floor(((regresive-(millis()-start))/1000)%60);
      countSs = countS <= 9 ? "0"+ str(countS) : str(countS);  //Calculamos en INT y con un String añadimos un "0" a los valores inferiores a 9
      countM = floor(((regresive-(millis()-start))/1000)/60);
      countMs = countM <= 9 ? "0"+ str(countM) : str(countM);  //Calculamos en INT y con un String añadimos un "0" a los valores inferiores a 9
      countMS = floor(((regresive-(millis()-start))/10)%100);
   
      countMSs = countMS <= 9 ? "0"+ str(countMS) : str(countMS); //Calculamos en INT y con un String añadimos un "0" a los valores inferiores a 9
     
      //Ejecutamos la función para mostrar
      this.show(); 
    
    //Detectamos si el tiempo se acabó para hacer "GameOver"
    if((regresive-(millis()-start)) <= 0){ gameOver = true; }
     
   }
 
   // Función para mostrar el contador
   void show(){
 
     textSize(size);
     fill(fll);
     text(countMs+":"+countSs+":"+countMSs,posX, posY);
 
     
   }
   
   // Función para cambiar el valor del tiempo.
   void setTime(int tm){
      start = tm; 
   }
  
}
class Walls{
  
   int posX, posY, sizeX, sizeY;
   color fil;
   int maxX, maxY;
   boolean bad;
   
    Walls(){
     
       posX = 0;
       posY = 0;
       sizeX = 0;
       sizeY = 0;
       fil = 0;
       bad = false;
     
    }
   
    Walls(int px, int py, int sx, int sy, color fl, boolean bd){
     
     posX = px;
     posY = py;
     sizeX = sx;
     sizeY = sy;
     fil = fl;
     bad = bd;
     
    } 
    
    // Función para mostrar las paredes
    void show(){
     
     fill(fil);
     rect(posX, posY, sizeX, sizeY);
     this.cursor(); //Ejecutamos el void para detectar la posición del mouse en las paredes
     
    }

    void cursor(){
     
      if((mouseX+10) > posX && (mouseX+10) < posX+sizeX && (mouseY+10) > posY && (mouseY+10) < posY+sizeY  ||
         (mouseX+10) > posX && (mouseX+10) < posX+sizeX && (mouseY-10) > posY && (mouseY-10) < posY+sizeY  ||
         (mouseX-10) > posX && (mouseX-10) < posX+sizeX && (mouseY-10) > posY && (mouseY-10) < posY+sizeY  ||
         (mouseX-10) > posX && (mouseX-10) < posX+sizeX && (mouseY+10) > posY && (mouseY+10) < posY+sizeY  
      ){
        
        //En el caso de haber pisado una pared...
        
        if(!bad){
        gameOver = true; //Si la pared era mala (Negra, bad = true) Game over
        }else{
            //En el caso contrario, bad = false...
            if(tiempo.getTime() >= 30){
            gameWinner = true; //Si quedaban mas de 30 segundos, GameWinner.
            }else{
            gameOver = true; //Del caso contrario, GameOver.
            }
            
        }
      }
      
    }
  
  
  
  
  
}
//Función para mostrar la pantalla de Game OVER
void gameOverF(){
    background(0);
    
    for(int i = 0; i < botones.length; i++){
       botones[i].show(); 
    }
    
    fill(255);
    textSize(72);
    text("GAME", 300, 290);
    text("OVER", 315, 360);
}
//Función para mostrar Game Winner
void gameWinnerF(){
  background(0);
  
  for(int i = 0; i < botones.length; i++){
       botones[i].show(); 
    }
    
    fill(255);
    textSize(56);
    text("¡Enhorabuena!", 230, 290);
    text("Has ganado", 275, 350);
  

    
}


