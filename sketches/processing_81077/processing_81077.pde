
//el escenario
    PImage miImagen;
    PImage nave; 


void setup ()
  {
   // Image miImagen;
    size(600,600);
    miImagen = loadImage("wall23.jpg");
    nave = loadImage("nave_espacial.jpg");
    

   }

void draw ()
  {
    background(0);
    image(miImagen,0,0);
    arma();//triangulo de 15 de alto y de base 8 pixeles.
    invasores();
    finDeJuego();
  }
//el arma
void arma()
  {
    fill(0,255,0);
    stroke(color(0,255,0));// ¿?
    image(nave, mouseX-26,545,60,60);
   // triangle(mouseX-8, 580,mouseX, 565, mouseX+8, 580);
  }

int[] coordenadaXinvasor = {int(random(600)), int(random(600)), int(random(600)), int(random(600)), int (random(600))};
int[] coordenadaYinvasor = {0,0,0,0,0};
int diametroinvasor=10;

void invasores()
  {
    //stroke(255);
    //fill(255);
    for (int i=0; i<5; i++)
      {
        ellipse(coordenadaXinvasor[i], coordenadaYinvasor[i]++, diametroinvasor, diametroinvasor);
      }
  }
  
  //El disparo
  //void mousePressed() detecta el click del raton
  void mousePressed()
    {
       proyectil(mouseX); //tomamos la posición x del disparo ( de mouse)
    } 
    
    //el proyectil
    void proyectil(int disparoX) 
      {
        boolean acertar= false;
        for(int i=0; i<5; i++)
          {
            if((disparoX>=(coordenadaXinvasor[i]-diametroinvasor/2)) && (disparoX<=(coordenadaXinvasor[i]+diametroinvasor/2)))
              {
                acertar=true;
                line(mouseX,565, mouseX, coordenadaYinvasor[i]);
                 ellipse(coordenadaXinvasor[i], coordenadaYinvasor[i], diametroinvasor + 25, diametroinvasor + 25);// explota elinvasor
                 coordenadaXinvasor[i] = int (random(600));
                 coordenadaYinvasor[i] = 0;
                
              }
          }
         if(acertar == false)
           
             line(mouseX,565, mouseX, 0);// fallo, el proyectil se va hasta arriba
             
      }
      
      //el final
      
      void finDeJuego()
        {
          for(int i=0; i<5; i++)
            if(coordenadaYinvasor[i]==600)
                noLoop();
        }
      
      //poner un fondo o un contador para poner ya ganaste o algo a si 


