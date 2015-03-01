
// PONG PARA PROCESSING!
//El adversario siempre se mueve acorde con la pelota, tu le has de devolver el toque.
//La paleta de la izquierda en cambio se puede mover y si la pelota no colisiona con ella saldrá de la partida.

//Variables

float x = 0;
float y = 0;
float vx = 4;
float vy = 5;
float s=20;

//Setup

void setup() 
{
  size(500, 300);
  smooth();

  frameRate(40);
}

//Draw

void draw()
{
  background (0, 250, 0);

  pushMatrix();
  {
    //pelota
    strokeWeight(3);
    stroke(255);
    ellipse (x, y, s, s);


    //Condiciones para que rebote 
    x = x+vx;

    if (x>=width-s/2-10)//se resta la mitad del diámetro de la pelota y el ancho de la paleta para que rebote en ella
    {
      vx = -4;
    }

    y = y+vy;

    if (y>=height-s/2)
    {
      vy = -5;
    }
    if (y<=s/2)
    {
      vy=5;
    }    

    if (x-s/2 == 10 && y >= mouseY && y<= mouseY+50) //para que rebote en la paleta en cualquier punto de Y comprendido entre 10 y 50, pero con X = 10 (anchura de la paleta)
    {
      vx = 5;
    }

    if (x<0)
    {
      
    }
      
      popMatrix();
      
  }

    pushMatrix(); //barras de desplazamiento para jugar
    {
    rect(0, mouseY, 10, 50);
    rect(width-10, y, 10, 50);
    popMatrix();
    }
    
  
}
