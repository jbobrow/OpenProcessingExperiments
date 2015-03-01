
// Declaramos las variables necesarias
Bola[] boles = new Bola[500]; //Creamos un array para almacenar hasta 500 bolas
int numBoles = 0; //Creamos una variable contadora para saber cuantas bolas hay
float temps = 1; //Creamos una variable de tiempo/puntuación
boolean died = false; //Creamos variable para saber si el juego ha terminado
float newTime;
void setup(){
  size(600,400); //Pantalla de 600x400px
}
 
void draw(){
   
  //Si el juego no ha terminado...
  if(died == false){
     
      background(200);
      //Dibujamos las bolas numBoles
      for(int i = 0; i < numBoles; i++){
      boles[i].show();
      }
       
      //Dibujamos el cuadro del cursor
      fill(0);
      rect(mouseX-10, mouseY-10, 20, 20, 3);
       
      //Incrementamos el tiempo
      temps = temps + 0.05;
       
      //Si eltiempo es mayor a numBoles, añadimos una bola más (Máximo 500);
      if(numBoles < boles.length && numBoles < temps){
        if((int)temps == 1 || (int)temps == 2){
          newTime = 1;
        }else{
          newTime = (int)temps/3;
        }
         
      boles[numBoles] = new Bola(newTime);
        
      numBoles++; 
      }
       
  }else{
    //Si el juego ha finalizado, mostramos la función showDied() de la otra pestaña.
    showDied();
  }
   
}
 
 
class Bola{
     
    //Creamos las variables para dibujar las bolas
    float radi, posX, posY, speed; //Radio y posición y velocidad
    color bg; //Fondo de la bola
    int direction, count, maxCount; //Dirección, contador de tiempo y máximo tiempo para cambiar de dirección
    int newDirection; //Variable auxiliar para sacar una nueva dirección (Exluyendo la actual)
     
    //Constructor por defecto
    Bola(){
      radi = random(20,40);
      posX = width/2;
      posY = height/2;
      bg = color(random(255),random(255),random(255));
      direction = (int)random(1,5);
      speed = random(1,7);
      count = (int)random(1,5);
      maxCount = (int)random(20,40);
    }
     
    Bola(float spd){
      radi = random(20,40);
      posX = width/2;
      posY = height/2;
      bg = color(random(255),random(255),random(255));
      direction = (int)random(1,5);
      speed = spd;
      count = (int)random(1,5);
      maxCount = (int)random(20,40);
    }
     
  
    //Dibujamos la bola
    void show(){
      fill(bg);
      ellipse(posX, posY, radi, radi);
       
      //La hacemos mover y verificamos que el cursor no esté encima
      this.move();
      this.checkCursor();
       
    }
  
  //Comprobamos que el cursor no está encima, en caso contrario died = true
   void checkCursor(){
     
      if((((mouseX-10) - posX) * ((mouseX-10) - posX) + ((mouseY-10) - posY) * ((mouseY-10) - posY) <= PI * radi)   ||
        (((mouseX+10) - posX) * ((mouseX+10) - posX) + ((mouseY+10) - posY) * ((mouseY+10) - posY) <= PI * radi)  ||
        (((mouseX-10) - posX) * ((mouseX-10) - posX) + ((mouseY+10) - posY) * ((mouseY+10) - posY) <= PI * radi)  ||
        (((mouseX+10) - posX) * ((mouseX+10) - posX) + ((mouseY-10) - posY) * ((mouseY-10) - posY) <= PI * radi)){
        died = true;
        }
      
   }
 
    //Hacemos mover la bola y cambiar de dirección
    void move(){
        
          switch(direction){
             
            case 1: posX = posX + speed; break;
            case 2: posX = posX - speed; break;
            case 3: posY = posY + speed; break;
            case 4: posY = posY - speed; break;
            
          }
           
          //Comprobamos que la bola no esté en un extremo para hacerla rebotar  >> changeDirection(true);
          if( (posY < 0 && direction == 4) || (posY > (height) && direction == 3) || (posX < 0  && direction == 2) || (posX > (width) && direction == 1) ){
          this.changeDirection(true);
          }else{
          this.changeDirection(false);
          }
     }
     
    //Función para hacer cambiar de dirección la bola
    void changeDirection(boolean rebote){
       
      //Verificamos que el tiempo para cambiar de dirección no se haya agotado o se llame la función para hacer rebotar la bola.
      if(count > maxCount || rebote == true){
         
        /*Calculamos una dirección aleatoria del 1 al 3, excluyendo la dirección actual y
        dependiendo de su dirección sacará una nueva*/
        newDirection = (int)random(1,4);
         
          if(direction == 1){
              if(rebote == true){
                direction = 2;
              }else{
                if(newDirection == 1){ direction = 2; }else
                if(newDirection == 2){ direction = 3; }else{
                                       direction = 4; }
              }
          }else if(direction == 2){
             if(rebote == true){
                direction = 1;
             }else{
                if(newDirection == 1){ direction = 1; }else
                if(newDirection == 2){ direction = 3; }else{
                                       direction = 4; }
             }                        
          }else if(direction == 3){
            if(rebote == true){
              direction = 4;
            }else{
                if(newDirection == 1){ direction = 1; }else
                if(newDirection == 2){ direction = 2; }else{
                                       direction = 4; }
            }                         
          }else{
           if(rebote == true){
             direction = 3;
           }else{
             if(newDirection == 1){ direction = 1; }else
             if(newDirection == 2){ direction = 2; }else{
                                    direction = 3; }
           }                     
          }
             
            //Reniciamos el contador para cambiar de dirección
           if(rebote == false){ count = 0; }
             
        }else{
          //incrementamos el contador de tiempo para cambiar de dirección
          count ++;
        }
    }
   
  }
     
void showDied(){
  
  //Dibujamos la pantalla de "GAME OVER"
 background(0);
 fill(255);
 textSize(60);
 text("GAME", 220, 170);
 text("OVER", 230, 240);
  
 //Mostramos la puntuación (Número de bolas en pantalla antes de morir)
 textSize(16);
 if((int)temps == 1){
 text("Tu puntuación ha sido de 1 punto", 170, 310);
 }else{
 text("Tu puntuación ha sido de: " + (int)temps + " puntos", 170, 310);
 }
  
 //Dibujamos un botón para regresar al juego
 rect(480, 10, 110, 30, 3);
 fill(0);
 textSize(12);
 text("Volver a intentar", 488, 30);
   
  //Botón. Si pulsamos se renicia el tiempo, las bolas y vuelve al juego
  if(mousePressed == true && mouseX > 480 && mouseX < 590 && mouseY > 10 && mouseY < 40){
  numBoles = 0;
  temps = 1;
  died = false;
  }
   
}

