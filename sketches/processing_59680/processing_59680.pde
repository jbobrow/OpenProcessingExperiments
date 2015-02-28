




    int velocidad = 10;
    int tamanoTablero = 405;
    int tamanoPunto = 15;
    int puntosMaximos;
    int numJugadores = 2;
    
   
    int x[][];
    int y[][];

    int puntos[];
    int total[];
    int manzana_x;
    int manzana_y;


    boolean izquierda[];
    boolean derecha[];
    boolean arriba[];
    boolean abajo[];
    boolean enJuego[];
    boolean continuar;

    PImage cuerpo[];
    PImage manzana;
    PImage cabeza[];
    PFont letra;
    
    
    

void setup()
{      
 
        size(405, 605);
        puntosMaximos = tamanoTablero/tamanoPunto;
       
        x = new int[numJugadores][puntosMaximos];
        y = new int[numJugadores][puntosMaximos];
        izquierda = new boolean[numJugadores];
        derecha = new boolean[numJugadores];
        arriba = new boolean[numJugadores];
        abajo = new boolean[numJugadores];
        enJuego = new boolean[numJugadores];
        puntos = new int[numJugadores];
        total  = new int[numJugadores];
        puntos = new int[numJugadores];
        cuerpo = new PImage[numJugadores];
        cabeza = new PImage[numJugadores];
        

        for(int i=0; i<numJugadores; i++)
        {
        cuerpo[i] = loadImage("cuerpo"+(i+1)+".png");
        cabeza[i] = loadImage("cabeza"+(i+1)+".png");
        }
        
        manzana = loadImage("manzana.png");
       
        iniciarJuego();
    
      smooth();
      frameRate(velocidad);

}

void iniciarJuego()
{    

        boolean direccion = true;
        for(int i=0; i<numJugadores; i++)
        {
        izquierda[i] = !direccion;
        derecha[i] = direccion;
        arriba[i] = false;
        abajo[i] = false;
        enJuego[i] = true;
       
        direccion = !direccion;
        }
        

        for(int i=0; i<numJugadores; i++)
        {puntos[i] = 3;
         total[i]=0;
        }
        

        int signo=1;
        for(int i=0; i<numJugadores; i++)
        {   signo *= -1;
            for (int z = 0; z < puntos[0]; z++) {
              x[i][z] = tamanoPunto*(5+(10*i)) + z*10*signo;
              y[i][z] = tamanoPunto*(5+(10*i));
             }
         }
             
                
        ponerManzana();
        
        fill(color(153));
        rect(0, tamanoTablero, tamanoTablero,100);
        fill(0);
        letra = loadFont("CourierNew36.vlw");
        textFont(letra, 20);
        text("Jugador 1: " + total[0], 25, tamanoTablero+35);
        if(numJugadores>1) text("Jugador 2: " + total[1], 25, tamanoTablero+75);

        
}
void draw() 
{   
    
     
    continuar = false;
    for(int i=0; i<numJugadores; i++)
    { continuar = continuar || enJuego[i];
    } 
   
    if (continuar) {
      
    fill(color(0));
    rect(0, 0, tamanoTablero, tamanoTablero);
    
    image(manzana, manzana_x, manzana_y,tamanoPunto,tamanoPunto);
    for (int i=0; i<numJugadores; i++){
        for (int z = 0; z < puntos[i]; z++) {
           if (z == 0) image(cabeza[i], x[i][z], y[i][z],tamanoPunto,tamanoPunto);
           else image(cuerpo[i], x[i][z], y[i][z],tamanoPunto,tamanoPunto);
                
         }
    }
        
        
        verificarManzana();
        verificarColision();
        
        moverse();
         
        }  

   else gameOver();
       
}

void keyPressed()
{
  
           if ((key == 'a') && (!derecha[0])) {
               izquierda[0] = true;
               arriba[0] = false; 
               abajo[0] = false;
            }

            if ((key == 'd') && (!izquierda[0])) {
                derecha[0] = true;
                arriba[0] = false;
                abajo[0] = false;
            }

            if ((key == 'w') && (!abajo[0])) {
                arriba[0] = true;
                derecha[0] = false;
                izquierda[0] = false;
            }

            if ((key == 's') && (!arriba[0])) {
                abajo[0] = true;
                derecha[0] = false;
                izquierda[0] = false;
            }
            
              if ((key == 'j') && (!derecha[1])) {
               izquierda[1] = true;
               arriba[1] = false; 
               abajo[1] = false;
            }

            if ((key == 'l') && (!izquierda[1])) {
                derecha[1] = true;
                arriba[1] = false;
                abajo[1] = false;
            }

            if ((key == 'i') && (!abajo[1])) {
                arriba[1] = true;
                derecha[1] = false;
                izquierda[1] = false;
            }

            if ((key == 'k') && (!arriba[1])) {
                abajo[1] = true;
                derecha[1] = false;
                izquierda[1] = false;
            }
            
            if((key=='r' || key=='R') && !continuar)
            {
              iniciarJuego();
            
            }
            
  
}


    public void verificarManzana() {
      for(int i=0; i<numJugadores; i++)
      {
        if ((x[i][0] == manzana_x) && (y[i][0] == manzana_y)) {
            puntos[i]++;
            total[i]=total[i]+10;
            fill(color(153));
            rect(0, tamanoTablero, tamanoTablero,100);
            fill(0);
            textFont(letra, 20);
            text("Jugador 1: " + total[0], 25, tamanoTablero+35);
            if(numJugadores>1) text("Jugador 2: " + total[1], 25, tamanoTablero+75);
            ponerManzana();
        }
      }  
  }


    public void moverse() {
      
      for(int i=0; i<numJugadores; i++)
      {
        for (int z = puntos[i]; z > 0; z--) {
            x[i][z] = x[i][(z - 1)];
            y[i][z] = y[i][(z - 1)];
        }

        if (izquierda[i]) {
            x[i][0] -= tamanoPunto;
        }

        if (derecha[i]) {
            x[i][0] += tamanoPunto;
        }

        if (arriba[i]) {
            y[i][0] -= tamanoPunto;
        }

        if (abajo[i]) {
            y[i][0] += tamanoPunto;
        }
        
      }
    }


    public void verificarColision() {
      
      for(int i=0; i<numJugadores; i++)
        {  for (int z = puntos[i]; z > numJugadores; z--) {

              if ((x[i][0] == x[i][z]) && (y[i][0] == y[i][z])) {
                  enJuego[i] = false; puntos[i]=0;
              }
          }
        

        if (y[i][0]+tamanoPunto > tamanoTablero) {
            enJuego[i] = false; puntos[i]=0;
        }

        if (y[i][0] < 0) {
            enJuego[i] = false; puntos[i]=0;
        }

        if (x[i][0]+tamanoPunto > tamanoTablero) {
            enJuego[i] = false; puntos[i]=0;
        }

        if (x[i][0] < 0) {
            enJuego[i] = false; puntos[i]=0;
        }
        }
        
      
    }

    public void ponerManzana() {
        
       boolean posicionIncorrecta=true;
       while(posicionIncorrecta==true)    
       {  
         posicionIncorrecta=false;
        int r = (int) (Math.random() * tamanoTablero);
        manzana_x = r - (r%tamanoPunto);
        r = (int) (Math.random() * tamanoTablero);
        manzana_y = r - (r%tamanoPunto);
       
        for(int i=0; i<numJugadores; i++)
        {
        for(int z=0; z<puntos[i]; z++)
          if(manzana_x==x[i][z] && manzana_y==y[i][z]) posicionIncorrecta=true;
        }
      }
  }
  
   public void gameOver() {
         
        String ganador = "";
        if(numJugadores>1)
        {ganador = "Ganador Jugador ";
        if(total[0]>total[1]) ganador += "1";
        else if(total[1]>total[0])ganador += "2";
             else ganador = "    Empate";
        }
        fill(153);
        textFont(letra, 32);
        text("Juego terminado", (width/2)-150, (height/2)-30);
        text(ganador, (width/2)-150, height/2);   
        textFont(letra, 25);
        text("Reiniciar Juego (R)", (width/2)-130, 40+height/2);
        
    }


