
/* Taller número 4 - Hungry Fish
 Realizado por: Nicodemus Luna
 Código: 11212041*/
 
 
//Variables 
int pantalla;
int vidas; 
int puntos;
int velocidad;
int nivel;
int nivelVelocidad;

int mover;

PFont fuente;

boolean arriba;
boolean abajo;
boolean derecha;
boolean izquierda;
boolean cambioPng;


float px, py;
int pmx, pmy;
float ancho, alto;

//Variables enemigos

//Pez Linterna:
int posXPezLinterna;
int posYPezLinterna;
int estadoPezLinterna;
//Pez Globo:
int posXPezGlobo;
int posYPezGlobo;
int estadoPezGlobo;
//Tiburon:
float posXTiburon;
float posYTiburon;
boolean desaparecerTiburon;

boolean desaparecerPezGlobLin;

int duracionDesaparecer;
int duracionDesaparecerDos;


void setup() { 
  size(810, 550); 
  
  px = 30;
  py = 30;
  pmx = 1;
  pmy = 1;
  alto=30;
  ancho=30;
  imageMode(CORNER);
 
  pez = new PImage [8];
  for (int i=0; i<8; i++) {
    pez [i]= loadImage("pez"+i+".png");
  }
  
  mover=1;

  inicio=loadImage("inicio.png");
  ganaste=loadImage("ganaste.png");
  nivel=1;
  nivelVelocidad=0;
  perdiste=loadImage("perdiste.png");
  comidaAzul=loadImage("azul.png");
  comidaVerde=loadImage("verde.png");
  comidaRoja=loadImage("rojo.png");
  escenarioUno=loadImage("escenarioUno.png");
  
  desapareceTiburon=loadImage("desapareceTiburon.png");
  desaparecePeces=loadImage("desaparecePeces.png");
  
  duracionDesaparecer=48;
  duracionDesaparecerDos=48;
  desaparecerTiburon=true;
  desaparecerPezGlobLin=true;
  
  fuente= loadFont("fuente.vlw");
  
  pantalla=0;
  puntos=0;
  vidas=1;
  
  //Declaración Variables de los enemigos
  pngPezLinternaUno=loadImage("pngPezLinternaUno.png");
  pngPezLinternaDos=loadImage("pngPezLinternaDos.png");
  posXPezLinterna=570;
  posYPezLinterna=420;
  estadoPezLinterna=0;
  
  pngPezGloboUno=loadImage("pngPezGloboUno.png");
  pngPezGloboDos=loadImage("pngPezGloboDos.png");
  posXPezGlobo=720;
  posYPezGlobo=30;
  estadoPezGlobo=0;
  
  tiburonArriba=loadImage("tiburonArriba.png");
  tiburonAbajo=loadImage("tiburonAbajo.png");
  tiburonIzquierda=loadImage("tiburonIzquierda.png");
  tiburonDerecha=loadImage("tiburonDerecha.png");
  posXTiburon=540;
  posYTiburon=30;
  
  
  
}//Cierra el void setup

////////////////Metodo para pintar a los peces Enmigos////////////////////

void pezLinterna () {

  if (estadoPezLinterna==0) {
    image (pngPezLinternaUno, posXPezLinterna, posYPezLinterna);
    posXPezLinterna+=1;
    if (posXPezLinterna==720) {
      estadoPezLinterna=1;
    }
  }
   if (estadoPezLinterna==1) {
    image (pngPezLinternaDos, posXPezLinterna, posYPezLinterna);
    posXPezLinterna-=1;
    if (posXPezLinterna==570) {
      estadoPezLinterna=0;
    }   
  }
}

void pezGlobo () {

  if (estadoPezGlobo==0) {
    image (pngPezGloboUno, posXPezGlobo, posYPezGlobo);
    posYPezGlobo+=1;
    if (posYPezGlobo==240) {
      estadoPezGlobo=1;
    }
   }
  if (estadoPezGlobo==1) {
    image (pngPezGloboDos, posXPezGlobo, posYPezGlobo);
    posYPezGlobo-=1;
    if (posYPezGlobo==30) {
      estadoPezGlobo=0;
    }
   }
}

void tiburon(){
   ///////Enemigo principal: Tiburon/////////
   //Condicional quie hace que el tiburon aumente su velocidad cuando el pez este cerca
   if ((dist(px, py, posXTiburon, posYTiburon)<=500)){ 
    posXTiburon = posXTiburon + (px - posXTiburon)/(500-nivelVelocidad);
    posYTiburon = posYTiburon + (py - posYTiburon)/(500-nivelVelocidad);    
   }
   if ((dist(px, py, posXTiburon, posYTiburon)<=200)){ 
    posXTiburon = posXTiburon + (px - posXTiburon)/(300-nivelVelocidad);
    posYTiburon = posYTiburon + (py - posYTiburon)/(300-nivelVelocidad);    
   }
    if ((dist(px, py, posXTiburon, posYTiburon)<=90)){ 
    posXTiburon = posXTiburon + (px - posXTiburon)/(100);
    posYTiburon = posYTiburon + (py - posYTiburon)/(100);    
   }
       
    if(px<posXTiburon){
      image (tiburonIzquierda, posXTiburon, posYTiburon);
    }
    else {
       image (tiburonDerecha, posXTiburon, posYTiburon);
    }
}


void draw() {
  mover=30;
  
  background(255);
  
  fill(41, 125, 224);
  rect(-1,510,811,40);
  
  switch(pantalla) {

  case 0://inicio----------------------------------------------
    image(inicio, 0, 0);
    puntos=0;
    break;//----------------------------------------------
  
  
  case 1://juego----------------------------------------------
  //Pinta el escenario
    image(escenarioUno,0,0);
    
  //pinta la reticula de cuadros--------------------

  for (int i = 0 ; i < 17 ; i++) {
    for (int j = 0 ; j < 27 ; j++) {
      switch(escenario[i][j]) {
      case 0:
        fill(255,255,255,50);
        break;
      case 1:
        fill(255,0,0,50);
        break;
      }//Cierre Switch para rellenar
      
  // rect(j*(alto), i*(ancho), (alto), (ancho));        
   
    //////////////Pinta y desaparece a los  peces comida//////////////////-------> Realizado con ayuda de: Sebastián Vasquez
     switch(elementos[i][j]) { 

      case 1:      
      if (elementos[i][j] == 1){ 
      image(comidaAzul, 10+j*alto, 10+i*ancho);      
      if (px == (j*30)&& py == (i*30)) {
            elementos[i][j] = 6;
            puntos+=5;
       }
      }    
      break;
      case 2:
      if (elementos[i][j] == 2){ 
      image(comidaRoja, 10+j*alto, 10+i*ancho);      
      if (px == (j*30)&& py == (i*30)) {
            elementos[i][j] = 7;
            puntos-=5;
            vidas+=1;
       }
      }
      break;
      case 3:
      if (elementos[i][j] == 3){ 
      image(comidaVerde, 10+j*alto, 10+i*ancho);      
      if (px == (j*30)&& py == (i*30)) {
            elementos[i][j] = 8;
            puntos+=15;
       }
      }
      break;           
      case 4:        
        if (elementos[i][j] == 4){ 
        image(desapareceTiburon, 10+j*alto, 10+i*ancho);      
        if (px == (j*30)&& py == (i*30)) {
              elementos[i][j] = 9;
              posXTiburon=900;
              posYTiburon=900;    
              desaparecerTiburon=false; 
         }
         }       
        break; 
        case 5:
        if (elementos[i][j] == 5){ 
        image(desaparecePeces, 10+j*alto, 10+i*ancho);      
        if (px == (j*30)&& py == (i*30)) {
              elementos[i][j] = 10;
               posXPezLinterna=900;
               posYPezLinterna=900;
               posXPezGlobo=900;
               posYPezGlobo=900;     
               desaparecerPezGlobLin=false;         
               if (estadoPezLinterna==0){
                 estadoPezLinterna=1; 
               }
                if(estadoPezLinterna==1){
                 estadoPezLinterna=0; 
               }
                if(estadoPezGlobo==0){
                 estadoPezGlobo=1;  
                }
                else if(estadoPezGlobo==1){
                 estadoPezGlobo=0;  
                }
         }
         }
      
        break; 
        } //Cierre Switch Elementos
    } //Cierre For reticula de cuadros X
  } //Cierre For reticula de cuadros Y
  
  
  if (desaparecerTiburon==false){
         if(frameCount%13==0){
           duracionDesaparecer--;
         }
         if (duracionDesaparecer==0) {
         posXTiburon=540;
         posYTiburon=30;
         }
  }
  if (desaparecerPezGlobLin==false){
         if(frameCount%13==0){
           duracionDesaparecerDos--;
         }
         if (duracionDesaparecerDos==0) {
         posXPezLinterna=570;
         posYPezLinterna=420;
        posXPezGlobo=720;
        posYPezGlobo=240;
        //estadoPezLinterna=1;        
        //estadoPezGlobo=1;
         }
  }
 /////////////////////////////////////////----------------NIVEL 2--------------////////////////////////////////////////////
     if (puntos==775){
     nivel=2;  

        if (estadoPezLinterna==1){
          estadoPezLinterna=0;
        }
        if (estadoPezGlobo==1){
          estadoPezGlobo=0;
        }
        posXPezLinterna=645; // Punto medio
        posYPezLinterna=420;
        posXPezGlobo=720;
        posYPezGlobo=135; //Punto medio
        for (int i = 0 ; i < 17 ; i++) {
        for (int j = 0 ; j < 27 ; j++) {
        if (elementos[i][j] == 6){
         elementos[i][j]=1;
        } 
        
        if (elementos[i][j] == 7){
         elementos[i][j]=2;
        } 
        
        if (elementos[i][j] == 8){
         elementos[i][j]=3;
        } 
        
        if (elementos[i][j] == 9){
         elementos[i][j]=4;
        }
        
        if (elementos[i][j] == 10){
         elementos[i][j]=5;
        }
        }
        }        
        nivelVelocidad=20;
    }
    
     if (puntos==1550){
       pantalla=3;
     }
        
  
  ///////////////Puntaje///////////////////  
    fill(0);                             
    textFont(fuente,20);
    text("points:  "+puntos*5, 35, 540); // Muestra el puntaje
    text("lifes:  "+vidas*1, 200, 540);  // Muestra la cantidad de vidas
    text("level:  "+nivel*1, 368, 540);  // Muestra el nivel
    println(("points:"+puntos)+"    "+("lifes:"+vidas)+"   "+frameCount);
  /////////////////////////////////////////

  //////////////////////////////Llama a los metodos de pintar a los enemigos///////////////////////////////  
   pezLinterna();
   for(int a=0; a<25; a++){
   if ((dist(px, py, posXPezLinterna+a, posYPezLinterna+a)<=25)) {
        vidas-=1;
        pmx=1;
        pmy=1;
        px=30;
        py=30;   
      
    if(vidas==0){
        pantalla=2;
   }
   }
   }
   
   pezGlobo();
   for(int a=0; a<25; a++){
   if ((dist(px, py, posXPezGlobo+a, posYPezGlobo+a)<=25)) {
        vidas-=1;
        pmx=1;
        pmy=1;
        px=30;
        py=30; 
             
    if(vidas==0){
        pantalla=2;
   }
   }
   }
     
   tiburon();    
   for(int a=0; a<25; a++){
   if ((dist(px, py, posXTiburon+a, posYTiburon+a)<=30)) {
        vidas-=1;
        pmx=1;
        pmy=1;
        px=30;
        py=30;   
      
    if(vidas==0){
        pantalla=2;
   }
   }
   }
   /////////////////////////////////////////////////////////////
    
    //pinta al personaje--------------------------------------------
    if (keyCode==0) {//imagen inicial     
       if (cambioPng) {
        image(pez[0], px, py);
      }
      else {
        image(pez[1], px, py);
      }
      arriba=false;
      abajo=false;
      derecha=false;
      izquierda=false;
    }
    if (arriba==true) {//cuando va hacia arriba
      if (cambioPng) {
        image(pez[2], px, py);
      }
      else {
        image(pez[3], px, py);
      }
    }
    if (abajo==true) {// cuando va hacia abajo
      if (cambioPng) {
        image(pez[0], px, py);
      }
      else {
        image(pez[1], px, py);
      }
    }
    if (derecha==true) {// cuando va hacia la derecha
      if (cambioPng) {
        image(pez[4], px, py);
      }
      else {
        image(pez[5], px, py);
      }
    }
    if (izquierda==true) {// cuando va hacia la izquierda
      if (cambioPng) {
        image(pez[6], px, py);
      }
      else {
        image(pez[7], px, py);
      }
    }
    
      if (frameCount%10==0) {  //////Tiempo o velocidad de la animación
      cambioPng=!cambioPng;
    }        
    
   break;
   
   case 2://pierdes  ////////////////////////////////////////////--Se restauran los valores iniciales--////////////////////////////////////////////////////////
        image(perdiste,0,0);   
        fill(0);
        textFont(fuente,30);
        text("points:  "+puntos*5, 35, 540); // Muestra el puntaje 
         
        pmx=1;
        pmy=1;
        px=30;
        py=30;  
        vidas=1;
       // estadoPezLinterna=0;
      //  estadoPezGlobo=0;     
        posXTiburon=540;
        posYTiburon=30;     
        posXPezLinterna=645; // Punto medio
        posYPezLinterna=420;
        posXPezGlobo=720;
        posYPezGlobo=135; //Punto medio
        nivel=1;
        nivelVelocidad=0;
        duracionDesaparecer=48;
        duracionDesaparecerDos=48;
        desaparecerTiburon=true;
        desaparecerPezGlobLin=true;
        
        for (int i = 0 ; i < 17 ; i++) {
        for (int j = 0 ; j < 27 ; j++) {
        if (elementos[i][j] == 6){
         elementos[i][j]=1;
        } 
        
        if (elementos[i][j] == 7){
         elementos[i][j]=2;
        } 
        
        if (elementos[i][j] == 8){
         elementos[i][j]=3;
        } 
        
        if (elementos[i][j] == 9){
         elementos[i][j]=4;
        }
        
        if (elementos[i][j] == 10){
         elementos[i][j]=5;
        }
        }
        }
    break;
         
   case 3://ganas  ////////////////////////////////////////////--Se restauran los valores iniciales--////////////////////////////////////////////////////////
      image(ganaste,0,0);
        fill(0);
        textFont(fuente,30);
        text("points:  "+puntos*5, 35, 540); // Muestra el puntaje 
         
        pmx=1;
        pmy=1;
        px=30;
        py=30;  
        vidas=1;
       // estadoPezLinterna=0;
      //  estadoPezGlobo=0;     
        posXTiburon=540;
        posYTiburon=30;     
        posXPezLinterna=645; // Punto medio
        posYPezLinterna=420;
        posXPezGlobo=720;
        posYPezGlobo=135; //Punto medio
        nivel=1;
        nivelVelocidad=0;
        duracionDesaparecer=48;
        duracionDesaparecerDos=48;
        desaparecerTiburon=true;
        desaparecerPezGlobLin=true;
        
        for (int i = 0 ; i < 17 ; i++) {
        for (int j = 0 ; j < 27 ; j++) {
        if (elementos[i][j] == 6){
         elementos[i][j]=1;
        } 
        
        if (elementos[i][j] == 7){
         elementos[i][j]=2;
        } 
        
        if (elementos[i][j] == 8){
         elementos[i][j]=3;
        } 
        
        if (elementos[i][j] == 9){
         elementos[i][j]=4;
        }
        
        if (elementos[i][j] == 10){
         elementos[i][j]=5;
        }
        }
        }
             
   break;
   
   
  } //Cierre Switch pantalla
} //Cierre Void Draw


void keyPressed() {
  switch(keyCode) {
  case LEFT:
    if (pmx==0) {
        pmx = 26;
        px = 780;
    } else if (escenario[pmy][pmx-1] != 1) {
      px-=mover;
      pmx--;
        arriba= false;
        abajo= false;
        izquierda= true;
        derecha= false;
    }    
    break;
  case RIGHT:
    if (pmx==26) {
        pmx = 0;
        px = 0;
    } else if (escenario[pmy][pmx+1] != 1) {
      px+=mover;
      pmx++;
        arriba= false;
        abajo= false;
        izquierda= false;
        derecha= true;
    }
    break;
  case UP:
    if (pmy==0) {
        pmy = 16;
        py = 480;
    } else if (escenario[pmy-1][pmx] != 1) {
      py-=mover;
      pmy--;
        arriba= true;
        abajo= false;
        izquierda= false;
        derecha= false;
    }
    break;
  case DOWN:
    if (pmy==16) {
        pmy = 1;
        py = 30;
    } else if (escenario[pmy+1][pmx] != 1) {
      py+=mover;
      pmy++; 
        arriba= false;
        abajo= true;
        izquierda= false;
        derecha= false;     
   }
    break;
    
     //Clave o Truco que sirve para probar el juego
    case SHIFT:
      vidas+=1;
    break;
     
  }
   //Cierre Switch
} //Cierre KeyPressed*/



void mouseReleased() {
 
  switch(pantalla) {
  case 0:
    if (mouseX>578 && mouseX<789 && mouseY>401 && mouseY<488) {
      pantalla= 1;
    }
    break;

  case 1:
    pantalla= 1;
    ////////////////////Reestablece los valores iniciales/////////////////
   
    break;

  case 2:
  ///////////////////pantalla perdiste/////////////////
   if (mouseX>547 && mouseX<781 && mouseY>375 && mouseY<462) {
      pantalla= 0;
    }
    
    break;

  case 3:
  //////////////////pantalla ganaste//////////////////
  if (mouseX>547 && mouseX<781 && mouseY>375 && mouseY<462) {
      pantalla= 0;
    }
    break;
  }//cierre switch
}//cierre mousePressed
PImage pez[];

PImage inicio;
PImage ganaste;
PImage perdiste;
PImage comidaAzul;
PImage comidaVerde;
PImage comidaRoja;
PImage escenarioUno;
PImage desapareceTiburon;
PImage desaparecePeces;


//Imagenes de los enemigos
PImage pngPezLinternaUno;
PImage pngPezLinternaDos;

PImage pngPezGloboUno;
PImage pngPezGloboDos;

PImage tiburonAbajo;
PImage tiburonArriba;
PImage tiburonIzquierda;
PImage tiburonDerecha;
int[][] escenario = { 
  {1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1}, 
  {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1},
  {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1},
  {1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1},
  {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1},
  {1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1},
  {0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1},
};

int[][] elementos = { 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 1, 0, 3, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 3, 0, 3, 0, 0, 0, 1, 0},
  {0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0},
  {0, 1, 0, 0, 1, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
  {0, 0, 1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 4, 0},
  {0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 3, 1, 0, 3, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0},
  {0, 3, 0, 0, 1, 0, 0, 3, 1, 0, 3, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 3, 0, 0, 3, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 3, 0, 0, 0, 1, 0},
  {0, 0, 0, 0, 0, 3, 0, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 3, 1, 0, 3, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 3, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 1, 3, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
};










