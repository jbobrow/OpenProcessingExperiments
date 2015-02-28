
/* @pjs preload="Creditos.jpg,Ficha.png,Victoria.jpg,Perdida.jpg,MenuPrincipal.jpg,Tablero.jpg,Historia.jpg,Instrucciones.jpg"; 
 */


/******************************************************
 * Principal de Galactic travel
 
 * Parte de la declaracion de las imagenes
 ******************************************************/

// Esta variable indica en que pantalla estamos en ese momento

boolean back = false;
int nombrePantalla = 1;

// Declaracion de las imagenes

PImage MenuPrincipal1, Tablero1, Historia1, Instrucciones1, Creditos1, Victoria1, Perdida1, Ficha1;

// Utilitzacion de la fuente 

String typedtext = "";

PFont font;

/*import ddf.minim.*; 
AudioPlayer player; 
Minim minim;
*/
void setup(){
  
  size (1151, 559);
  
//  minim = new Minim(this); //
//  player = minim.loadFile("MusicaEspacial.mp3"); //
//  player.play(); //
//  player.loop();
  
  font = createFont("FranklinGothic-Book-48", 48, true);
  
  textFont(font,36);
  smooth();
  
  
  // Cargar las imagenes que utilizaremos
  
  MenuPrincipal1 = loadImage("MenuPrincipal.jpg");
  Tablero1 = loadImage("Tablero.jpg");
  Historia1 = loadImage("Historia.jpg");
  Instrucciones1 = loadImage("Instrucciones.jpg");
  Creditos1 = loadImage("Creditos.jpg");
  Ficha1 = loadImage("Ficha.png");
  Victoria1= loadImage("Victoria.jpg");
  Perdida1 = loadImage("Perdida.jpg");
}

void draw(){
    
  background (255);
        
    
    
    fill(#D1C004);
      
 // print(mouseX);
 // print(",");
 // println(mouseY);  
    
  // Declaracio de las pantallas que utilizaremos en el fichero PANTALLAS_de_galactic_travel.pde
  
  if (nombrePantalla == 1) MenuPrincipal();
  if (nombrePantalla == 2) Tablero();
  if (nombrePantalla == 3) Historia();
  if (nombrePantalla == 4) Instrucciones();
  if (nombrePantalla == 5) Creditos();
  if (nombrePantalla == 6) Victoria();
  if (nombrePantalla == 7) Perdida();
 
  
  //text(cronometre.minutsEnrera()+":"+cronometre.segonsEnrera(), 140, 516);
  
  textSize(25);
  fill(#D1C004);  
}

void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
       verificar();
  }
  if (keyCode == BACKSPACE || keyCode == DELETE){
    back = true;
      typedtext = typedtext.substring(0,max(0,typedtext.length()-1));
  } 
  if ( key == '0' ||key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' || key == '-') {
      if(typedtext.length()<6){
        typedtext = typedtext.concat (new String(key));
      }
  }
}



/******************************************************
 * PANTALLAS de juego Galactic
 
 * Parte de las pantallas de les imagenes
 ******************************************************/



String vida1;
String vida2;
String vida3;
float L,U,V=50;
int [] PosicionX = {35,30,270,435,585,950,772,1007,1032};

int [] PosicionY = {285,25,20,145,265,300,160,165,17};

int posX = PosicionX[0];
int posY = PosicionY[0];

int posicionFicha = 0;
Temps cronometre = new Temps(); 

// Pantalla del "Menu Principal"  
    
void MenuPrincipal(){
   background(#000000);  
   image (MenuPrincipal1, 0, 0);

    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
    }

           //-- Ir a al "Tablero"
          
          
          
           if (mouseX > 279 && mouseX < 841 && mouseY > 137 && mouseY < 169){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=2;
                iniciar();
              }
           }
           else {
             cursor(ARROW);
           }
         cronometre.comptaEnrera(91);
         
         
           //-- Ir a la "Historia"
          
           if (mouseX > 271 && mouseX < 838 && mouseY > 204 && mouseY < 232){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=3;
              }
           }
           else {
             cursor(ARROW);
           }
         
           //-- Ir a "Instrucciones"
          
           if (mouseX > 272 && mouseX < 835 && mouseY > 270 && mouseY < 297){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=4;
              }
           }
           else {
             cursor(ARROW);
           }
           
           //-- Ir a "Creditos"
          
           if (mouseX > 266 && mouseX < 835 && mouseY > 329 && mouseY < 359){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=5;
              }
           }
           else {
             cursor(ARROW);
           }  
     
           //-- Ir a "Salir"
   
           if (mouseX > 266 && mouseX < 835 && mouseY > 390 && mouseY < 423){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                exit();
              }
           }
           else {
             cursor(ARROW);
           }
           
}

// Pantalla del "Tablero"

void Tablero(){
   background(#6A8FD6);  
   image (Tablero1, 0, 0);
   Pregunta();
   Vida();
   Puntuacion();
   //Ficha.mou();
   
    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(0,412));
        
    }


   fill(#D1C004);
   textSize(20);
   text("Resolver la Equacion",500,438);
   
   
   
   fill(#D1C004);
   textSize(15);
   
 
   
    
    
    image (Ficha1,posX,posY); 
    
    if ( posY > PosicionY[posicionFicha]){
     posY = posY-5; 
    }
    if ( posY < PosicionY[posicionFicha]){
     posY = posY+5; 
    } 
    if ( posX > PosicionX[posicionFicha]){
     posX = posX-5; 
    }
    if ( posX < PosicionX[posicionFicha]){
     posX = posX+5; 
    }
      
      //-- Ir a "Victoria"
          
              if (posicionFicha==8) {
                
                nombrePantalla=6;
              }
       
      //Imprimim una comptaEnrera que és de 3 min
            
   textSize(25);
  fill(#D1C004);
  text(cronometre.minutsEnrera()+":"+cronometre.segonsEnrera(), 140, 516);
}

  class Temps {
    int principi;
    int enrera;
      
    Temps(){
      principi = millis();
     
    }
    
    void comptaEnrera(int segons){
      enrera = segons * 1000 + millis();
    }
    int minutsEnrera(){
      int minuts = int((enrera-millis())/60000);
      if( minuts < 0){
        minuts = 0; 
      }
      return minuts;
    } 
    int segonsEnrera(){
      int segons = int((enrera-millis())/1000%60);
          if (segons < 0 && vidas ==3){
             segons =0;
              
                  vida3 = new String('X');
                  cronometre.comptaEnrera(91); 
                  vidas--;
          }
          if (segons < 0  && vidas == 2){
                 segons =0;
                 vida2 = new String('X');
                 cronometre.comptaEnrera(71); 
                 vidas=1;
          }
          if (segons < 0 ){
                segons =0;
                vida1 = new String('X');
                cronometre.comptaEnrera(51);  
                nombrePantalla=7;
          }   
            return segons;
    }
  }


/*class Ficha{
  
  int x;
  int y;
  int velocitat;
  int colors;
  
  void mou(){
    
    y = y+velocitat;
    if(y>(width+20)){
      y = -20;
    }
               
  }
    
    Ficha(){
      x=20;
      y=50;
      velocitat=1;
    }
    
    Ficha(int xPos,int yPos,int vel,int col){
   
     x = xPos;
     y = yPos;
     velocitat = vel;
     colors = col;
   
 }
      
}*/

   
  void Vida(){
    
    
  U=sin(L++*.1)*5;  
  fill(#FF0000);
  textSize(V+U);
  text(vida1,130,460);
  text(vida2,180,460);
  text(vida3,230,460);
  
    
  }

    
// Pantalla de "Historia"

void Historia(){
   background(#6A8FD6);  
   image (Historia1, 0, 0);
   
   
   strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
    }


        //-- Volver "Menu Principal"
                         
          if (mouseX > 733 && mouseX < 1134 && mouseY > 515 && mouseY < 538){
            cursor(HAND);
            if (mousePressed) {
              cursor(ARROW);
              nombrePantalla=1;
            }
          }
          else {
            cursor(ARROW);
          }
}

// Pantalla de "Instrucciones"

void Instrucciones(){
   background(#6A8FD6);  
   image (Instrucciones1, 0, 0);
   
   strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
    }
   
   
         //-- Volver "Menu Principal"
                           
            if (mouseX > 733 && mouseX < 1134 && mouseY > 515 && mouseY < 538){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=1;
              }
            }
            else {
              cursor(ARROW);
            }
   
}   

// Pantalla de "Creditos"

void Creditos(){
   background(#6A8FD6);  
   image (Creditos1, 0, 0);
   
   strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
    }
   
         //-- Volver "Menu Principal"
                         
          if (mouseX > 733 && mouseX < 1134 && mouseY > 515 && mouseY < 538){
            cursor(HAND);
            if (mousePressed) {
              cursor(ARROW);
              nombrePantalla=1;
            }
          }
          else {
            cursor(ARROW);
          }
}           


void Victoria(){
  background(#6A8FD6);  
   image (Victoria1, 0, 0);
  
    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
        
        
    }
  
  
          //-- Volver "Menu Principal"
                           
            if (mouseX > 733 && mouseX < 1134 && mouseY > 515 && mouseY < 538){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=1;
              }
            }
            else {
              cursor(ARROW);
            }
                textSize(40);
              text(score,600,300);

} 

void Perdida(){
  background(#6A8FD6);  
   image (Perdida1, 0, 0);
  
    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < 5000; i++) {
        point(random(width), random(height));
        
    }
  
  
          //-- Volver "Menu Principal"
                           
            if (mouseX > 733 && mouseX < 1134 && mouseY > 515 && mouseY < 538){
              cursor(HAND);
              if (mousePressed) {
                cursor(ARROW);
                nombrePantalla=1;
              }
            }
            else {
              cursor(ARROW);
            }
            textSize(40);
  text(score,583,197);
  
  
} 
void iniciar(){
posicionFicha=0;
posX = PosicionX[0];
posY = PosicionY[0];
cronometre.comptaEnrera(91);
valor1=(int)random(0,100);
valor2=(int)random(0,100);
vidas=3;
vida1="♥";
vida2 ="♥";
vida3 ="♥";
 if (vidas == 2) {
           vida3 = new String('X');
           cronometre.comptaEnrera(61); 
         } else if (vidas == 1){
           vida2 = new String('X');
           cronometre.comptaEnrera(41); 
         }else if (vidas == 0){
           vida1 = new String('X');
           
           nombrePantalla=7;
         }
score=0;
}





int vidas = 3;

int valor1=(int)random(0,100);
int valor2=(int)random(0,100);

int score=0;

int resultado=0;
int signo = (int) random(0,3);


void Pregunta(){
    if (signo == 0){
      resultado= valor2-valor1;
    } else if(signo==1){
      resultado= valor2+valor1;
    }else{
      resultado=valor2*valor1;
    }
  strokeWeight(5);
   stroke(#D1C004);
   fill(#000000);
   rect(373, 450, 220, 95, 8, 8);
   rect(650, 450, 100, 95, 8, 8);
   fill(#000000);
   strokeWeight(3);
   stroke(#D1C004);
   rect(780, 425, 340, 120, 8, 8);
       rect(780, 425, 230, 45);
           stroke(#747373);
           fill (#2E1903);
           ellipse (840, 495, 100, 20);
               line (840, 495, 880, 480);
           ellipse (840, 525, 100, 20);
               line (840, 525, 880, 510);
           ellipse (955, 495, 100, 20);
               line (955, 495, 995, 480);
           ellipse (955, 525, 100, 20);
               line (955, 525, 995, 510);
           
               noStroke();
               fill(#D1C004);
               ellipse (880, 480, 15, 15);
               ellipse (880, 510, 15, 15);
               ellipse (995, 480, 15, 15);
               ellipse (995, 510, 15, 15);
           
               fill(#000000);
               stroke(#D1C004);
               rect (1010, 425, 120, 120);
                   stroke(#747373);
                   fill (#2E1903);
                   rect ( 1030, 445, 30, 30);
                   rect ( 1080, 445, 30, 30);
                   rect ( 1030, 495, 30, 30);
                   rect ( 1080, 495, 30, 30);
                         noStroke();
                         fill(155,mouseY+2,mouseX+2);
                         ellipse (1045, 460, 20, 20);
                         ellipse (1095, 460, 20, 20);
                         ellipse (1045, 510, 20, 20);
                         ellipse (1095, 510, 20, 20);
           
           

   fill(#D1C004);
   textSize(15);
   text("RESULTADO =", 790, 440, 120,50);
   fill(#FF0000);
   textSize(25);
   text(typedtext+(frameCount/10 % 2 == 0 ? "_" : ""), 900, 430, 75,50); 
  
   fill(#D1C004);
   textSize(60);
   text("=", 610, 520);
   
    text ( "x", 400, 515);
    if (signo == 0){
      text ( "+", 450, 515);
    } else if(signo == 1){
      text ( "-", 450, 515);
    }else {
      text ("/", 450, 520);
    }
    text(valor1, 485,515);  
    text(valor2, 670,515);
    

    
/*  if(NumeroPregunta == 1){
    
    textSize(60);
    fill(#D1C004);    
    text ( "x", 725, 510);
    text ( "+", 770, 515);
    text(valor1, 820,510);  
    text(valor2, 1000,520);
    resultado= valor2-valor1;
  
  }
    
  if(NumeroPregunta == 2){
    
    textSize(60); 
    text ( "x", 725, 510);
    text ( "-", 770, 510);
    text(valor1, 820,510);  
    text(valor2, 1000,520);
    resultado= valor2+valor1;
      
  }
  
  if(NumeroPregunta == 3){
    
    textSize(60);   
    text ( "x", 725, 510);
    text ( "+", 770, 515);
    text(valor1, 820,510);   
    text(valor2, 1000,520); 
    resultado= valor2-valor1;
      
  }
  
  if(NumeroPregunta == 4){
    
    textSize(60);    
    text ( "x", 725, 510);
    text ( "-", 770, 510);
    text(valor1, 820,510);    
    text(valor2, 1000,520);   
    resultado= valor2+valor1;
     
  }
  
  if(NumeroPregunta == 5){
    
    textSize(60);    
    text ( "x", 725, 510);
    text ( "+", 770, 515);
    text(valor1, 820,510);      
    text(valor2, 1000,520);
    resultado= valor2-valor1;
      
  }
  
  if(NumeroPregunta == 6){
    
    textSize(60);
        
    text ( "x", 725, 510);
    text ( "-", 770, 510);
    text(valor1, 820,510);    
    text(valor2, 1000,520);
    resultado= valor2+valor1;
      
  }
  
  if(NumeroPregunta == 7){
    
    textSize(60);    
    text ( "x", 725, 510);
    text ( "+", 770, 515);
    text(valor1, 820,510);    
    text(valor2, 1000,520);
    resultado= valor2-valor1;  
    
  }
  
  if(NumeroPregunta == 8){
    
    textSize(60);        
    text ( "x", 725, 510);
    text ( "-", 770, 510);
    text(valor1, 820,510);    
    text(valor2, 1000,520);
    resultado= valor2+valor1;
      
  }
  
  if(NumeroPregunta == 9){
    
    textSize(60);  
    text ( "x", 725, 510);
    text ( "+", 770, 515);
    text(valor1, 820,510);   
    text(valor2, 1000,520);
    resultado= valor2-valor1;
    
  }
  
  if(NumeroPregunta == 10){
    
    textSize(60);  
    text ( "x", 725, 510);
    text ( "-", 770, 510);
    text(valor1, 820,510);  
    text(valor2, 1000,520);
    resultado= valor2+valor1;
      
  }
*/
}

void NuevaPregunta(){
   typedtext ="";
    valor1=(int)random(0,100);
    valor2=(int)random(0,100);
    signo = (int) random(0,3);
     if (signo == 0){
      resultado= valor2-valor1;
    } else if (signo==1){
      resultado= valor2+valor1;
    }else{
      resultado=valor2*valor1;
    }
}
void Puntuacion(){
  
 fill(#D1C004);
  textSize(25);
  text(score, 208, 481);
 
}

void verificar(){
  if(posicionFicha<8 && nombrePantalla==2){  
       if(typedtext.equals(new String(resultado))){
         //Has acertado
         noStroke();
         fill(#29FF00);
         rect(895, 430, 100, 35, 8, 8);
         //println("HAS ACERTADO");
         score = score+200;
         posicionFicha++;
        cronometre.comptaEnrera(91); 
         NuevaPregunta();    
         
         
       } else {
         //Has fallado
         vidas--;
         typedtext ="";
         fill(#FF0000);
         rect(895, 430, 100, 35, 8, 8);
         if (vidas == 2) {
           vida3 = new String('X');
           cronometre.comptaEnrera(61); 
         } else if (vidas == 1){
           vida2 = new String('X');
           cronometre.comptaEnrera(41); 
         }else if (vidas == 0){
           vida1 = new String('X');
           
           nombrePantalla=7;
         }
       
         
         //println("HAS FALLADO");
       }
   }

}
 
 
  
  


